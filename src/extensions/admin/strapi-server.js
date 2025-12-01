// src/extensions/admin.plugin.js or wherever you extend the admin plugin

const debugLogs = [];
// Expose buffer for other parts of the app (e.g., a debug controller)
global.__adminEmailDebugLogs = debugLogs;

function addDebug(message, context) {
  const entry = { timestamp: Date.now(), message, context };

  debugLogs.push(entry);

  // Also keep sending to Strapi logs for backend visibility

  strapi.log.info(message, context);
}

/** Your main plugin extension */

module.exports = (plugin) => {
  addDebug('[DEBUG] admin extension loaded', {});
  // Helpers for env-based lists
  const getEnvList = (name) => {
    const raw = process.env[name];
    if (!raw) return [];
    return String(raw)
      .split(',')
      .map((s) => s.trim())
      .filter((s) => s.length > 0);
  };
  const sentWelcomeAdminIds = new Set();

  const sentInviteTokens = new Set();

  const getAdminBaseUrl = () => {
    return (
      process.env.ADMIN_URL ||
      process.env.STRAPI_ADMIN_URL ||
      process.env.PUBLIC_ADMIN_URL ||
      "https://strapi-webapp-beg3aydvbkebbdbp.canadacentral-01.azurewebsites.net/admin"
    );
  };

  // Load full admin details

  const loadAdminWithSensitiveFields = async (adminPartial) => {
    const adminId = adminPartial?.id;

    if (!adminId) {
      addDebug("[DEBUG] loadAdminWithSensitiveFields: missing adminId", {
        adminPartial,
      });

      return adminPartial;
    }

    try {
      const full = await strapi.db.query("admin::user").findOne({
        where: { id: adminId },

        select: [
          "id",
          "email",
          "firstname",
          "lastname",
          "isActive",
          "registrationToken",
        ],

        populate: {},
      });

      addDebug("[DEBUG] Loaded full admin record", { full });

      return full || adminPartial;
    } catch (e) {
      addDebug("[DEBUG] Failed to load full admin record", {
        adminId,
        error: e.message,
      });

      return adminPartial;
    }
  };

  // Welcome/Invite email sending logic

  const sendWelcomeEmailIfNeeded = async (adminUserInput) => {
    addDebug("[DEBUG] sendWelcomeEmailIfNeeded called", { adminUserInput });

    const adminUser = await loadAdminWithSensitiveFields(adminUserInput);

    const adminId = adminUser.id;

    const isActive = adminUser.isActive === true;

    const email = adminUser.email;

    const registrationToken = adminUser.registrationToken;

    if (!email) {
      addDebug("[DEBUG] Skipping email: missing email field", { adminId });

      return;
    }

    // Optional domain allowlist
    const allowedDomains = getEnvList('ALLOWED_INVITE_DOMAINS');
    if (allowedDomains.length > 0) {
      const recipientDomain = String(email).split('@')[1] || '';
      const isAllowed = allowedDomains.some((d) => d.toLowerCase() === recipientDomain.toLowerCase());
      if (!isAllowed) {
        addDebug('[DEBUG] Skipping invite: recipient domain not allowed', { email, recipientDomain, allowedDomains });
        return;
      }
    }

    // Invite email if registrationToken is present

    if (registrationToken) {
      if (sentInviteTokens.has(registrationToken)) {
        addDebug("[DEBUG] Invite already sent for this token", { adminId });

        return;
      }

      const baseUrl = getAdminBaseUrl();

      const inviteUrl = `${baseUrl.replace(/\/$/, "")}/auth/register?registrationToken=${registrationToken}`;

      const subject = "[DEBUG] You are invited to Strapi Administration";

      const text = `Hello ${adminUser.firstname || ""} ${adminUser.lastname || ""}\n\nYou have been invited to the Strapi administration panel.\nPlease complete your registration by visiting this link: ${inviteUrl}`;

      const html = `<p>Hello ${adminUser.firstname || ""} ${adminUser.lastname || ""},</p><p>You have been invited to the Strapi administration panel.</p><p>Please complete your registration by clicking the link below:</p><p><a href="${inviteUrl}">${inviteUrl}</a></p>`;

      try {
        addDebug("[DEBUG] Sending invite email", {
          to: email,
          inviteUrl,
          registrationToken,
        });

        const ccList = getEnvList('EMAIL_INVITE_CC');
        const bccList = getEnvList('EMAIL_INVITE_BCC');

        await strapi
          .plugin("email")
          .service("email")
          .send({ to: email, cc: ccList, bcc: bccList, subject, text, html });

        sentInviteTokens.add(registrationToken);

        addDebug("[DEBUG] Invite email sent", { to: email });
      } catch (err) {
        addDebug("[DEBUG] Failed to send invite email", {
          to: email,
          error: err.message,
        });
      }

      return;
    }

    // Welcome email if admin account is active

    if (!isActive) {
      addDebug("[DEBUG] Welcome email not sent: admin not active", { adminId });

      return;
    }

    if (adminId && sentWelcomeAdminIds.has(adminId)) {
      addDebug("[DEBUG] Welcome email not sent: already sent for this admin", {
        adminId,
      });

      return;
    }

    const subject = "[DEBUG] Welcome to the Strapi Administration";

    const text = `Hello ${adminUser.firstname || ""} ${adminUser.lastname || ""}\n\nYour administrator account has been created successfully.\nYou can now sign in to the administration panel.`;

    const html = `<p>Hello ${adminUser.firstname || ""} ${adminUser.lastname || ""},</p><p>Your administrator account has been created successfully.</p><p>You can now sign in to the administration panel.</p>`;

    try {
      addDebug("[DEBUG] Sending welcome email", { to: email });

      await strapi.plugin("email").service("email").send({
        to: email,

        subject,

        text,

        html,
      });

      if (adminId) sentWelcomeAdminIds.add(adminId);

      addDebug("[DEBUG] Welcome email sent", { to: email });
    } catch (err) {
      addDebug("[DEBUG] Failed to send welcome email", {
        to: email,
        error: err.message,
      });
    }
  };

  // DEBUG lifecycle event hooks

  try {
    strapi.db.lifecycles.subscribe({
      models: ["admin::user"],

      async afterCreate(event) {
        addDebug("[DEBUG] afterCreate fired", { event });

        try {
          const createdAdmin = event.result || event.params?.data || {};

          await sendWelcomeEmailIfNeeded(createdAdmin);
        } catch (err) {
          addDebug("[DEBUG] afterCreate error", err);
        }
      },

      async afterUpdate(event) {
        addDebug("[DEBUG] afterUpdate fired", { event });

        try {
          const updatedAdmin = event.result || {};

          await sendWelcomeEmailIfNeeded(updatedAdmin);
        } catch (err) {
          addDebug("[DEBUG] afterUpdate error", err)
        }
      },
    });
  } catch (err) {
    addDebug("[DEBUG] Failed to subscribe to admin::user lifecycles", err);
  }

  // Attach debug endpoint handler to expose logs

  strapi.server.routes.get("/debug-logs", async (ctx) => {
    ctx.body = { logs: debugLogs.slice(-100) }; // Return last 100 entries
  });

  return plugin;
};
