'use strict';

module.exports = {
  register(/*{ strapi }*/) {},

  bootstrap({ strapi }) {
    // Shared in-memory debug buffer
    if (!global.__adminEmailDebugLogs) global.__adminEmailDebugLogs = [];
    const pushDebug = (message, data) => {
      const entry = { ts: new Date().toISOString(), message, data };
      try {
        global.__adminEmailDebugLogs.push(entry);
        if (global.__adminEmailDebugLogs.length > 500) {
          global.__adminEmailDebugLogs.splice(0, global.__adminEmailDebugLogs.length - 500);
        }
      } catch (_) {}
      strapi.log.info(message, data);
    };

    const getEnvList = (name) => {
      const raw = process.env[name];
      if (!raw) return [];
      return String(raw)
        .split(',')
        .map((s) => s.trim())
        .filter((s) => s.length > 0);
    };

    const getAdminBaseUrl = () => {
      return (
        process.env.ADMIN_URL ||
        process.env.STRAPI_ADMIN_URL ||
        process.env.PUBLIC_ADMIN_URL ||
        'https://strapi-webapp-beg3aydvbkebbdbp.canadacentral-01.azurewebsites.net/admin'
      );
    };

    const sentWelcomeAdminIds = new Set();
    const sentInviteTokens = new Set();

    const loadAdminWithSensitiveFields = async (adminPartial) => {
      const adminId = adminPartial?.id;
      if (!adminId) return adminPartial;
      try {
        const full = await strapi.db.query('admin::user').findOne({
          where: { id: adminId },
          select: ['id', 'email', 'firstname', 'lastname', 'isActive', 'registrationToken'],
          populate: {},
        });
        pushDebug('[DEBUG/bootstrap] Loaded full admin', { id: full?.id, email: full?.email, isActive: full?.isActive, hasToken: !!full?.registrationToken });
        return full || adminPartial;
      } catch (e) {
        pushDebug('[DEBUG/bootstrap] Load admin failed', { id: adminId, error: e.message });
        return adminPartial;
      }
    };

    const sendEmailsIfNeeded = async (adminUserInput) => {
      pushDebug('[DEBUG/bootstrap] sendEmailsIfNeeded called', { id: adminUserInput?.id, email: adminUserInput?.email });
      const adminUser = await loadAdminWithSensitiveFields(adminUserInput);
      const adminId = adminUser.id;
      const isActive = adminUser.isActive === true;
      const email = adminUser.email;
      const registrationToken = adminUser.registrationToken;

      if (!email) {
        pushDebug('[DEBUG/bootstrap] Skip: missing email', { adminId });
        return;
      }

      // Optional domain allowlist
      const allowedDomains = getEnvList('ALLOWED_INVITE_DOMAINS');
      if (allowedDomains.length > 0) {
        const recipientDomain = String(email).split('@')[1] || '';
        const isAllowed = allowedDomains.some((d) => d.toLowerCase() === recipientDomain.toLowerCase());
        if (!isAllowed) {
          pushDebug('[DEBUG/bootstrap] Skip: domain not allowed', { email, recipientDomain, allowedDomains });
          return;
        }
      }

      // Invite email on token
      if (registrationToken) {
        if (sentInviteTokens.has(registrationToken)) {
          pushDebug('[DEBUG/bootstrap] Skip invite: token already sent', { adminId });
          return;
        }
        const baseUrl = getAdminBaseUrl();
        const inviteUrl = `${baseUrl.replace(/\/$/, '')}/auth/register?registrationToken=${registrationToken}`;
        const subject = 'You are invited to Strapi Administration';
        const text = `Hello ${adminUser.firstname || ''} ${adminUser.lastname || ''}\n\nYou have been invited to the Strapi administration panel.\nPlease complete your registration: ${inviteUrl}`;
        const html = `<p>Hello ${adminUser.firstname || ''} ${adminUser.lastname || ''},</p><p>You have been invited to the Strapi administration panel.</p><p>Please complete your registration by clicking the link below:</p><p><a href="${inviteUrl}">${inviteUrl}</a></p>`;
        try {
          const ccList = getEnvList('EMAIL_INVITE_CC');
          const bccList = getEnvList('EMAIL_INVITE_BCC');
          pushDebug('[DEBUG/bootstrap] Sending invite', { to: email, inviteUrl, hasToken: !!registrationToken });
          await strapi.plugin('email').service('email').send({ to: email, cc: ccList, bcc: bccList, subject, text, html });
          sentInviteTokens.add(registrationToken);
          pushDebug('[DEBUG/bootstrap] Invite sent', { to: email });
          return;
        } catch (e) {
          pushDebug('[DEBUG/bootstrap] Invite failed', { to: email, error: e.message });
          return;
        }
      }

      // Welcome email when active
      if (!isActive) {
        pushDebug('[DEBUG/bootstrap] Skip welcome: not active', { adminId });
        return;
      }
      if (adminId && sentWelcomeAdminIds.has(adminId)) {
        pushDebug('[DEBUG/bootstrap] Skip welcome: already sent', { adminId });
        return;
      }
      const subject = 'Welcome to the Strapi Administration';
      const text = `Hello ${adminUser.firstname || ''} ${adminUser.lastname || ''}\n\nYour administrator account has been created successfully.\nYou can now sign in to the administration panel.`;
      const html = `<p>Hello ${adminUser.firstname || ''} ${adminUser.lastname || ''},</p><p>Your administrator account has been created successfully.</p><p>You can now sign in to the administration panel.</p>`;
      try {
        pushDebug('[DEBUG/bootstrap] Sending welcome', { to: email });
        await strapi.plugin('email').service('email').send({ to: email, subject, text, html });
        if (adminId) sentWelcomeAdminIds.add(adminId);
        pushDebug('[DEBUG/bootstrap] Welcome sent', { to: email });
      } catch (e) {
        pushDebug('[DEBUG/bootstrap] Welcome failed', { to: email, error: e.message });
      }
    };

    // Subscribe to admin::user lifecycle globally
    try {
      pushDebug('[DEBUG/bootstrap] Subscribing admin::user lifecycles', {});
      strapi.db.lifecycles.subscribe({
        models: ['admin::user'],
        async afterCreate(event) {
          pushDebug('[DEBUG/bootstrap] afterCreate', { id: event?.result?.id, hasToken: !!event?.result?.registrationToken });
          await sendEmailsIfNeeded(event.result || event.params?.data || {});
        },
        async afterUpdate(event) {
          pushDebug('[DEBUG/bootstrap] afterUpdate', { id: event?.result?.id, isActive: event?.result?.isActive });
          await sendEmailsIfNeeded(event.result || {});
        },
      });
    } catch (e) {
      pushDebug('[DEBUG/bootstrap] Lifecycle subscribe failed', { error: e.message });
    }

    pushDebug('[DEBUG/bootstrap] Admin invite mailer initialized', {});
  },
};
