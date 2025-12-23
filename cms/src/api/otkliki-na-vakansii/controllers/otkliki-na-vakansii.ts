/**
 * otkliki-na-vakansii controller
 */

import { factories } from '@strapi/strapi';

interface EntryData {
    name: string;
    phone: string;
    city?: string | null;
    vacancy?: string | null;
    message?: string | null;
    accept_terms: boolean;
    locale?: string;
    publishedAt?: string | null;
    resume?: any;
}

export default factories.createCoreController(
    'api::otkliki-na-vakansii.otkliki-na-vakansii',
    ({ strapi }) => ({
        async create(ctx) {
            try {
                strapi.log.info('📥 Получен запрос на создание отклика');

                // Получаем данные из запроса
                const requestBody = ctx.request.body as any;

                // Логируем для отладки
                strapi.log.info('📦 Request body:', JSON.stringify(requestBody, null, 2));

                // Определяем источник данных
                let formData: any;

                if (requestBody && typeof requestBody === 'object') {
                    if (requestBody.data) {
                        formData = requestBody.data;
                    } else {
                        formData = requestBody;
                    }
                } else {
                    return ctx.badRequest('Invalid request format');
                }

                strapi.log.info('📝 Form data:', formData);

                // Валидация обязательных полей
                if (!formData?.name || !formData?.phone) {
                    strapi.log.error('❌ Missing required fields');
                    return ctx.badRequest('Name and phone are required');
                }

                // Подготавливаем данные для создания записи
                const entryData: EntryData = {
                    name: String(formData.name),
                    phone: String(formData.phone),
                    city: formData.city || null,
                    vacancy: formData.vacancy || null,
                    message: formData.message || null,
                    accept_terms: formData.accept_terms === true || formData.accept_terms === "true",
                    locale: formData.locale || 'ru',
                    publishedAt: null
                };

                // Добавляем resume ID если есть
                if (formData.resume) {
                    entryData.resume = formData.resume;
                    strapi.log.info('📎 Resume file ID:', formData.resume);
                }

                strapi.log.info('🎯 Creating entry with data:', entryData);

                // Создаем запись
                const entry = await strapi.entityService.create(
                    'api::otkliki-na-vakansii.otkliki-na-vakansii',
                    {
                        data: entryData,
                        populate: ['resume']
                    }
                ) as any; // Используем any для обхода типов

                strapi.log.info('✅ Entry created successfully, ID:', entry.id);

                // Отправляем email (опционально)
                if (process.env.SEND_EMAILS !== 'false') {
                    try {
                        await sendEmailNotification(entry, strapi);
                    } catch (emailError) {
                        strapi.log.error('⚠️ Email sending error:', emailError);
                    }
                }

                // Подготавливаем ответ
                const response = {
                    data: {
                        id: entry.id,
                        attributes: {
                            name: entry.name,
                            phone: entry.phone,
                            city: entry.city,
                            vacancy: entry.vacancy,
                            message: entry.message,
                            accept_terms: entry.accept_terms,
                            locale: entry.locale,
                            createdAt: entry.createdAt,
                            updatedAt: entry.updatedAt,
                            publishedAt: entry.publishedAt
                        }
                    }
                };

                // Добавляем resume в ответ если есть
                if (entry.resume) {
                    (response.data.attributes as any).resume = entry.resume;
                }

                return ctx.created(response);

            } catch (error: any) {
                strapi.log.error('💥 Error creating application:', error);
                return ctx.badRequest('Error creating application', {
                    details: {
                        message: error.message
                    }
                });
            }
        }
    })
);

// Отдельная функция для отправки email
async function sendEmailNotification(entry: any, strapi: any) {
    try {
        let resumeInfo = '';

        if (entry.resume?.id) {
            const file = await strapi.db.query('plugin::upload.file').findOne({
                where: { id: entry.resume.id }
            });

            if (file) {
                const publicUrl = process.env.VITE_BACKEND_URL || 'https://cms.legenda-hotels.ru';
                const fileUrl = file.url.startsWith('http')
                    ? file.url
                    : `${publicUrl}${file.url}`;

                resumeInfo = `
          <div style="margin: 15px 0; padding: 15px; background: #e8f4fd; border-radius: 6px;">
            <p style="margin: 0 0 10px 0; font-weight: 600;">📎 Прикрепленное резюме:</p>
            <p style="margin: 5px 0;">
              <strong>Файл:</strong> 
              <a href="${fileUrl}" target="_blank" style="color: #2563eb;">${file.name}</a>
            </p>
            <p style="margin: 5px 0;">
              <strong>Размер:</strong> ${(file.size / 1024).toFixed(2)} KB
            </p>
            <p style="margin: 5px 0;">
              <strong>Формат:</strong> ${file.ext.toUpperCase()}
            </p>
          </div>
        `;
            }
        }

        // HTML шаблон письма
        const html = `
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="utf-8">
        <style>
          body { font-family: 'Montserrat', 'Segoe UI', Arial, sans-serif; line-height: 1.6; color: #333; }
          .container { max-width: 600px; margin: 0 auto; padding: 20px; }
          .header { background: #244C60; color: white; padding: 20px; border-radius: 8px 8px 0 0; }
          .content { background: #f8f9fa; padding: 25px; }
          .field { margin-bottom: 12px; }
          .field-label { font-weight: 600; color: #244C60; display: inline-block; width: 120px; }
          .footer { margin-top: 20px; padding: 15px; background: #fff3cd; border-radius: 6px; font-size: 14px; }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h2 style="margin: 0;">📋 Новый отклик на вакансию</h2>
            <p style="margin: 5px 0 0 0; opacity: 0.9;">LEGENDA Hotels</p>
          </div>
          
          <div class="content">
            <div class="field">
              <span class="field-label">👤 Имя:</span> ${entry.name}
            </div>
            <div class="field">
              <span class="field-label">📞 Телефон:</span> 
              <a href="tel:${entry.phone}" style="color: #2563eb; text-decoration: none;">${entry.phone}</a>
            </div>
            ${entry.city ? `<div class="field"><span class="field-label">🏙️ Город:</span> ${entry.city}</div>` : ''}
            ${entry.vacancy ? `<div class="field"><span class="field-label">🧑‍💼 Вакансия:</span> ${entry.vacancy}</div>` : ''}
            ${entry.message ? `
              <div class="field">
                <span class="field-label">💬 Сообщение:</span><br>
                <div style="margin-top: 5px; padding: 10px; background: white; border-radius: 4px;">
                  ${entry.message.replace(/\n/g, '<br>')}
                </div>
              </div>
            ` : ''}
            <div class="field">
              <span class="field-label">✅ Согласие:</span> ${entry.accept_terms ? 'Да' : 'Нет'}
            </div>
            ${resumeInfo}
            <div class="field">
              <span class="field-label">📅 Дата:</span> ${new Date(entry.createdAt).toLocaleString('ru-RU')}
            </div>
          </div>
          
          <div class="footer">
            <p style="margin: 0;">
              <strong>⚠️ Внимание:</strong> Это автоматическое уведомление.
            </p>
          </div>
          
          <p style="text-align: center; margin-top: 25px; color: #6c757d; font-size: 12px;">
            © ${new Date().getFullYear()} LEGENDA Hotels. Все права защищены.
          </p>
        </div>
      </body>
      </html>
    `;

        // Отправляем email
        await strapi.plugin('email').service('email').send({
            to: process.env.SMTP_TO_HR ? process.env.SMTP_TO_HR.split(',').map(email => email.trim()) : ['slastenindev@gmail.com'],
            from: process.env.SMTP_DEFAULT_FROM || 'noreply@example.com',
            replyTo: process.env.SMTP_DEFAULT_REPLY_TO,
            subject: '📋 Отклик на вакансию с сайта LEGENDA Hotels',
            html
        });

        strapi.log.info('📧 Email notification sent');

    } catch (error: any) {
        strapi.log.error('❌ Email sending error:', error.message);
    }
}