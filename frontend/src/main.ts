import '@/scss/main.scss'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

// Отключаем нативное восстановление скролла браузером
if ('scrollRestoration' in history) {
  history.scrollRestoration = 'manual'
}
import { createHead } from '@vueuse/head'
import 'virtual:svg-icons-register'
import { IMaskDirective } from 'vue-imask'
import { createYmaps } from 'vue-yandex-maps'
import VueYandexMetrika from 'vue-yandex-metrika'
import { appear } from './directives/gsap-appear'
import { preloadObjects } from './cache/objectsCache'

const app = createApp(App).use(router)
const head = createHead()
app.use(head)

app.directive('imask', IMaskDirective as any)
app.use(
  createYmaps({
    apikey: 'bb753275-daf4-43fa-9089-8a54cfead427',
    lang: 'ru_RU',
  }),
)
app.use(VueYandexMetrika, {
  id: 105125798,
  router: router,
  env: process.env.NODE_ENV,
  options: {
    webvisor: true,
    clickmap: true,
    trackLinks: true,
    accurateTrackBounce: true,
    ecommerce: "dataLayer"
  }
})
app.directive('appear', appear)

app.mount('#app')

router.isReady().then(() => {
  preloadObjects()
})
