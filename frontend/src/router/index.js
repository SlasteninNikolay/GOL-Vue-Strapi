import { createRouter, createWebHistory } from 'vue-router'
import { routes } from './routes'
import { startTransition, endTransition } from '@/utils/usePageTransition.js'
import { set404Status } from '@/utils/seo.js'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savedPosition) {

    if (savedPosition) {
      return savedPosition
    } else if (to.hash) {
      return {
        el: to.hash,
        behavior: 'smooth',
        top: 20,
      }
    } else {
      return { top: 0, left: 0 }
    }
  },
  linkActiveClass: 'router-link-active',
  linkExactActiveClass: 'router-link-exact-active',
})

router.beforeEach(async (to, from, next) => {
  startTransition()
  next()
})

router.afterEach((to, from) => {

  if (to.name !== from.name || to.fullPath !== from.fullPath) {
    endTransition()
  }

  if (to.name === 'not-found') {
    set404Status()
  }

  if (to.meta.title) {
    document.title = to.meta.title
  }
})

router.onError((error) => {
  console.error('Router error:', error)
  endTransition()

  if (error.message.includes('Failed to fetch dynamically imported module')) {

    if (!window.location.search.includes('reloaded=true')) {
      window.location.search = '?reloaded=true'
    } else {
      window.location.href = '/error'
    }
  }
})

router.beforeResolve((to, from, next) => {
  if (to.matched.length === 0) {
    next({ name: 'not-found' })
  } else {
    next()
  }
})

export default router
