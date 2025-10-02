export default [
  'strapi::logger',
  'strapi::errors',
  'strapi::security',
  'strapi::poweredBy',
  'strapi::query',
  'strapi::body',
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
    {
        name: 'strapi::cors',
        config: {
            origin: ['http://localhost:3000', 'http://localhost:5173', "https://legenda-dev.ru", "https://api.legenda-dev.ru","https://legenda-hotels.ru", "https://cms.legenda-hotels.ru"],
            methods: ['GET', 'POST', 'OPTIONS'],
            headers: ['Content-Type', 'Authorization', 'Origin', 'Accept'],
            keepHeaderOnError: true,
        },
    },
];
