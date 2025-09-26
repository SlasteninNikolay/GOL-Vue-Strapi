import { createRouter, createWebHistory } from 'vue-router'
import { routes } from './routes'
import { startTransition, endTransition } from '@/utils/usePageTransition.js'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) return savedPosition
    window.scrollTo(0, 0)
  },
  linkActiveClass: 'navbar__menu-link--active',
})

router.beforeEach( async (to, from, next) => {
  startTransition()
  next()
})
router.afterEach(() => {
  endTransition()
})

export default router
