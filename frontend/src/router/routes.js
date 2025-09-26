import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'
import { getObjectNameBySlug, getRoomTitleBySlug } from '@/cache/objectsCache.js'

export const routes = [
  {
    path: '/',
    name: 'home',
    component: () => import('@/views/HomeView.vue'),
    meta: {
      breadcrumb: 'Главная',
    },
  },
  {
    path: '/about',
    name: 'about',
    component: () => import('@/views/AboutView.vue'),
    meta: {
      breadcrumb: 'О нас',
    },
  },
  {
    path: '/objects',
    component: () => import('@/components/ui/layout/AppObjectsLayout.vue'),
    meta: { breadcrumb: 'Портфолио' },
    children: [
      {
        path: '',
        name: 'objects',
        component: () => import('@/views/ObjectsView.vue'),
        meta: { breadcrumb: null }
      },
      {
        path: ':slug',
        name: 'objects-single',
        component: () => import('@/views/ObjectsSingleView.vue'),
        meta: { breadcrumb: (route) => getObjectNameBySlug(route.params.slug) }
      },
      {
        path: ':slug/rooms/:roomSlug',
        name: 'object-room',
        component: () => import('@/views/ObjectRoomView.vue'),
        meta: {
          breadcrumb: (route) => `${getObjectNameBySlug(route.params.slug)} / ${getRoomTitleBySlug(route.params.roomSlug)}`
        }
      },
    ],
  },
  {
    path: '/vacancies',
    name: 'vacancies',
    component: () => import('@/views/VacanciesView.vue'),
    meta: {
      breadcrumb: 'Карьера',
    },
    children: [
      {
        path: '/vacancies/:id',
        name: 'vacancies-single',
        component: () => import('@/views/VacanciesSingleView.vue'),
        meta: {
          breadcrumb: (route) => route.params.slug
        }
      },
    ],
  },
  {
    path: '/contacts',
    name: 'contacts',
    component: () => import('@/views/ContactsView.vue'),
    meta: {
      breadcrumb: 'Контакты',
    },
  },
  {
    path: '/blog',
    name: 'blog',
    component: () => import('@/views/BlogView.vue'),
    meta: {
      breadcrumb: 'Блог',
    },
    children: [
      {
        path: ':slug',
        name: 'blog-single',
        component: () => import('@/views/BlogSingleView.vue'),
        meta: {
          breadcrumb: (route) => route.params.slug
        }
      }
    ],
  },
  {
    path: '/services',
    name: 'services',
    component: () => import('@/views/ServicesView.vue'),
    meta: {
      breadcrumb: 'Услуги',
    },
    children: [
      {
        path: ':slug',  // Изменено с :id на :slug
        name: 'services-single',
        component: () => import('@/views/ServicesSingleView.vue'),
        props: true,
        meta: {
          breadcrumb: (route) => route.params.title || route.params.slug
        },
      },
    ],
  },
  {
    path: '/pages',
    name: 'pages',
    component: () => import('@/views/InfoView.vue'),
    meta: {
      breadcrumb: 'Информация',
    },
    children: [
      {
        path: ':slug',
        name: 'pages-single',
        component: () => import('@/views/InfoSingleView.vue'),
        props: true,
        meta: {
          breadcrumb: (route) => route.params.title || route.params.slug
        },
      },
    ],
  },
  {
    path: '/loyalty-program',
    name: 'loyalty-program',
    component: () => import('@/views/LoyaltyProgramView.vue'),
    props: true,
    meta: {
      breadcrumb: (route) => route.params.title || route.params.slug
    },
  },
  {
    path: '/:pathMatch(.*)*',
    name: 'not-found',
    component: () => import('@/views/NotFoundView.vue'),
    meta: {
      breadcrumb: 'Страница не найдена',
    },
  }
]

