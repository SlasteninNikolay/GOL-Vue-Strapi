import { createRouter, createWebHistory } from 'vue-router'
import { routes } from './routes'
import { startTransition, endTransition } from '@/utils/usePageTransition.js'
import { set404Status } from '@/utils/seo.js'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) return savedPosition
    window.scrollTo(0, 0)
  },
  linkActiveClass: 'navbar__menu-link--active',
})

router.beforeEach(async (to, from, next) => {
  startTransition()
  next()
})

router.afterEach((to) => {
  if (to.name === 'not-found') {
    set404Status()
  }
  endTransition()
})

router.onError((error) => {
  console.error('Router error:', error)
  if (error.message.includes('Failed to fetch dynamically imported module')) {
    set404Status()
    return { name: 'not-found' }
  }
})

export default router
