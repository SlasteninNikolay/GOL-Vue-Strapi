export default [
  'strapi::logger',
  'strapi::errors',
  'strapi::security',
  'strapi::poweredBy',
  'strapi::query',
  {
    name: 'strapi::body',
    config: {
      formLimit: '256mb',
      jsonLimit: '256mb',
      textLimit: '256mb',
      formidable: {
        maxFileSize: 10 * 1024 * 1024, // 10MB
      },
    },
  },
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
    {
        name: 'strapi::cors',
        config: {
            origin: ['http://localhost:3000', 'http://localhost:5173', "https://legenda-hotels.ru", "https://cms.legenda-hotels.ru"],
            methods: ['GET', 'POST', 'PUT', 'OPTIONS'],
            headers: ['Content-Type', 'Authorization', 'Origin', 'Accept', 'Access-Control-Allow-Origin'],
            credentials: true,
            keepHeaderOnError: true,
        },
    },
];
