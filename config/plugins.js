module.exports = ({ env }) => {
  const supabaseUrl = env(
    "SUPABASE_URL",
    "https://zzfhuvwpjobfregqvnbz.supabase.co"
  );

  const supabaseBucket = env("SUPABASE_BUCKET", "media_bucket");

  return {
    upload: {
      config: {
        provider: "aws-s3",

        providerOptions: {
          s3Options: {
            endpoint: env(
              "SUPABASE_STORAGE_ENDPOINT",
              `${supabaseUrl}/storage/v1/s3`
            ),

            credentials: {
              accessKeyId: env("SUPABASE_ACCESS_KEY_ID"),

              secretAccessKey: env("SUPABASE_SECRET_ACCESS_KEY"),
            },

            region: "us-east-2",
          },

          params: {
            Bucket: supabaseBucket,
          },

          baseUrl: `${supabaseUrl}/storage/v1/object/public/${supabaseBucket}`,
        },
      },
    },

    seo: {
      enabled: true,
    },

    email: {
      config: {
        provider: "nodemailer",

        providerOptions: {
          host: env("EMAIL_SMTP_HOST", "smtp.gmail.com"),

          port: env.int("EMAIL_SMTP_PORT", 465),

          secure: env.bool("EMAIL_SMTP_SECURE", false),

          logger: true, // Enable nodemailer logging

          debug: true, // Enable SMTP debug output

          auth: {
            user: env("EMAIL_SMTP_USERNAME"),

            pass: env("EMAIL_SMTP_PASSWORD"),
          },
        },

        settings: {
          defaultFrom: env("EMAIL_DEFAULT_FROM", env("EMAIL_SMTP_USERNAME")),

          defaultReplyTo: env(
            "EMAIL_DEFAULT_REPLY_TO",
            env("EMAIL_SMTP_USERNAME")
          ),
        },
      },
    },
  };
};
