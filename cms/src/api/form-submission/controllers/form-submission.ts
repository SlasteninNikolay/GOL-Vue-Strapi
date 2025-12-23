import { factories } from '@strapi/strapi';

interface FormData {
    name: string;
    phone: string;
    message: string;
    accept_terms: boolean | string;
}

export default factories.createCoreController(
    'api::form-submission.form-submission',
    ({ strapi }) => ({
        async create(ctx) {
            try {
                const sanitizedInput = await this.sanitizeInput(ctx.request.body, ctx);
                const { data } = sanitizedInput as { data: FormData };
                const { name, phone, message = '', accept_terms } = data;

                // Создаем запись
                const entry = await strapi.service('api::form-submission.form-submission').create({
                    data: {
                        name,
                        phone,
                        message,
                        accept_terms: accept_terms === "true" || accept_terms === true
                    },
                });

                // Отправляем email с noreply ящика
                if (process.env.SEND_EMAILS !== 'false') {
                    try {
                        await strapi.plugins['email'].services.email.send({
                            to: process.env.SMTP_TO_MANAGER ? process.env.SMTP_TO_MANAGER.split(',').map(email => email.trim()) : ['slastenindev@gmail.com'],
                            from: process.env.SMTP_DEFAULT_FROM,
                            replyTo: process.env.SMTP_DEFAULT_REPLY_TO,
                            subject: '📋 Новая заявка с сайта LEGENDA Hotels',
                            html: `
                                <div style="font-family: Montserrat, sans-serif; max-width: 600px;">
                                  <h2 style="color: #244C60;">🔔 Новая заявка</h2>
                                  
                                  <div style="background: #f8f9fa; padding: 20px; border-radius: 8px; border-left: 4px solid #244C60;">
                                    <p><strong>👤 Имя:</strong> ${name}</p>
                                    <p><strong>📞 Телефон:</strong> <a href="tel:${phone}">${phone}</a></p>
                                    <p><strong>✉️ Сообщение:</strong> ${message ? message : '—'}</p>                        
                                    <p><strong>✅ Согласие с политикой:</strong> ${accept_terms ? 'Да' : 'Нет'}</p>
                                    <p><strong>📅 Дата получения:</strong> ${new Intl.DateTimeFormat('ru-RU', { timeZone: 'Europe/Moscow' }).format(new Date())}</p>
                                  </div>
                                  
                                  <div style="margin-top: 20px; padding: 15px; background: #fff3cd; border-radius: 6px;">
                                    <p style="margin: 0; color: #856404;">
                                      <strong>⚠️ Внимание:</strong> Это автоматическое уведомление. 
                                      Пожалуйста, не отвечайте на это письмо. 
                                      Для связи используйте почту: ${process.env.SMTP_DEFAULT_REPLY_TO}
                                    </p>
                                  </div>
                                  
                                  <p style="color: #6c757d; font-size: 12px; margin-top: 20px;">
                                    © ${new Date().getFullYear()} LEGENDA Hotels. Все права защищены.
                                  </p>
                                </div>
                              `,
                        });

                    } catch (emailError) {
                        console.error('❌ Ошибка отправки email:', emailError);
                    }
                } else {
                    strapi.log.info('Email sending is disabled by SEND_EMAILS=false');
                }

                // Возвращаем ответ
                const sanitizedEntry = await this.sanitizeOutput(entry, ctx);
                return this.transformResponse(sanitizedEntry);

            } catch (error) {
                strapi.log.error('Error:', error);
            }
        }
    })
);
