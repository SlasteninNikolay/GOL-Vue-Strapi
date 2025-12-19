/**
 * otkliki-na-vakansii controller
 */

import { factories } from '@strapi/strapi';

interface FormData {
    name: string;
    phone: string;
    city: string;
    vacancy: string;
    accept_terms: boolean | string;
}

export default factories.createCoreController(
    'api::otkliki-na-vakansii.otkliki-na-vakansii',
    ({ strapi }) => ({
        async create(ctx) {
            try {
                // Проверяем наличие файла
                const files = ctx.request.files;
                let resumeId = null;

                if (files?.resume) {
                    const uploadedFiles = await strapi.plugins['upload'].services.upload.upload({
                        data: {},
                        files: files.resume,
                    });
                    resumeId = uploadedFiles[0]?.id;
                }

                const sanitizedInput = await this.sanitizeInput(ctx.request.body, ctx);
                const { data } = sanitizedInput as { data: FormData };
                const { name, phone, city, vacancy, accept_terms } = data;

                // Создаем запись
                const entry = await strapi.service('api::otkliki-na-vakansii.otkliki-na-vakansii').create({
                    data: {
                        name,
                        phone,
                        city,
                        vacancy,
                        accept_terms: accept_terms === "true" || accept_terms === true,
                        resume: resumeId
                    },
                });

                // Отправляем email с noreply ящика
                if (process.env.SEND_EMAILS !== 'false') {
                    try {
                        // Получаем информацию о файле
                        let resumeInfo = '';
                        if (resumeId) {
                            const file = await strapi.db.query('plugin::upload.file').findOne({
                                where: { id: resumeId }
                            });
                            if (file) {
                                const fileUrl = file.url.startsWith('http') ? file.url : `${process.env.PUBLIC_URL || 'http://localhost:1337'}${file.url}`;
                                resumeInfo = `<p><strong>📎 Резюме:</strong> <a href="${fileUrl}">${file.name}</a> (${(file.size / 1024).toFixed(2)} KB)</p>`;
                            }
                        }

                        await strapi.plugins['email'].services.email.send({
                            to: process.env.SMTP_TO_ADMIN || 'slastenindev@gmail.com',
                            from: process.env.SMTP_DEFAULT_FROM,
                            replyTo: process.env.SMTP_DEFAULT_REPLY_TO,
                            subject: '📋 Отклик на вакансию с сайта LEGENDA Hotels',
                            html: `
                                <div style="font-family: Montserrat, sans-serif; max-width: 600px;">
                                  <h2 style="color: #244C60;">🔔 Новый отклик на вакансию</h2>
                                  
                                  <div style="background: #f8f9fa; padding: 20px; border-radius: 8px; border-left: 4px solid #2563eb;">
                                    <p><strong>👤 Имя:</strong> ${name}</p>
                                    <p><strong>📞 Телефон:</strong> <a href="tel:${phone}">${phone}</a></p>
                                    <p><strong>🏙️ Город:</strong> ${city}</p>    
                                    <p><strong>🧑‍💼 Вакансия:</strong> ${vacancy}</p>
                                    ${resumeInfo}
                                    <p><strong>✅ Согласие с политикой:</strong> ${accept_terms ? 'Да' : 'Нет'}</p>
                                    <p><strong>📅 Дата получения:</strong> ${new Date().toLocaleString('ru-RU')}</p>
                                  </div>
                                  
                                  <div style="margin-top: 20px; padding: 15px; background: #fff3cd; border-radius: 6px;">
                                    <p style="margin: 0; color: #244C60;">
                                      <strong>⚠️ Внимание:</strong> Это автоматическое уведомление. 
                                      Пожалуйста, не отвечайте на это письмо. 
                                      Для связи используйте почту: ${process.env.SMTP_DEFAULT_REPLY_TO}
                                    </p>
                                  </div>
                                  
                                  <p style="color: #244C60; font-size: 12px; margin-top: 20px;">
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