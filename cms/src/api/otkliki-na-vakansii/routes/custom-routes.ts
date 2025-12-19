export default {
  routes: [
    {
      method: 'POST',
      path: '/otkliki-na-vakansiis',
      handler: 'otkliki-na-vakansii.create',
      config: {
        auth: false, // Отключаем аутентификацию для публичного доступа
        policies: [],
        middlewares: [],
      },
    },
  ],
};
