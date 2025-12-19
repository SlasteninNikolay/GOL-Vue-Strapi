/**
 * otkliki-na-vakansii router
 */

import { factories } from '@strapi/strapi';

const defaultRouter = factories.createCoreRouter('api::otkliki-na-vakansii.otkliki-na-vakansii');

const customRouter = (innerRouter, extraRoutes = []) => {
  let routes;
  return {
    get prefix() {
      return innerRouter.prefix;
    },
    get routes() {
      if (!routes) routes = [...extraRoutes, ...innerRouter.routes];
      return routes;
    },
  };
};

const myExtraRoutes = [
  {
    method: 'POST',
    path: '/otkliki-na-vakansiis',
    handler: 'otkliki-na-vakansii.create',
    config: {
      policies: [],
      middlewares: [],
    },
  },
];

export default customRouter(defaultRouter, myExtraRoutes);
