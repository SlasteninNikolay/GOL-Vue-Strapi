export default ({ env }) => ({
    email: {
        config: {
            provider: 'nodemailer',
            providerOptions: {
                host: env('SMTP_HOST', 'mail.hosting.reg.ru'),
                port: env('SMTP_PORT', 587),
                secure: env.bool('SMTP_SECURE', false),
                auth: {
                    user: env('SMTP_USERNAME'),
                    pass: env('SMTP_PASSWORD'),
                },
                mimeTypes: ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
                requireTLS: env.bool('SMTP_REQUIRE_TLS', true),
                ignoreTLS: env.bool('SMTP_IGNORE_TLS', false),
                tls: {
                    rejectUnauthorized: env.bool('SMTP_TLS_REJECT_UNAUTHORIZED', false),
                    minVersion: env('SMTP_TLS_MIN_VERSION', 'TLSv1.2'),
                    maxVersion: env('SMTP_TLS_MAX_VERSION', 'TLSv1.3'),
                    ciphers: env('SMTP_TLS_CIPHERS', 'HIGH:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!SRP:!CAMELLIA')
                },
                connectionTimeout: env.int('EMAIL_TIMEOUT', 30000),
                socketTimeout: env.int('EMAIL_TIMEOUT', 30000),
                greetingTimeout: env.int('EMAIL_TIMEOUT', 30000),
                debug: env.bool('EMAIL_DEBUG', false),
                logger: env.bool('EMAIL_LOGGER', true)
            },
            settings: {
                defaultFrom: env('SMTP_DEFAULT_FROM'),
                defaultReplyTo: env('SMTP_DEFAULT_REPLY_TO'),
            },
        },
    },
    upload: {
        config: {
            sizeLimit: 10 * 1024 * 1024, // 10MB
        },
    },
});
