<template>
  <div class="breadcrumbs-wrapper container">
    <nav aria-label="breadcrumbs" v-if="breadcrumbs.length">
      <ol class="breadcrumbs">
        <li class="breadcrumbs-item">
          <router-link to="/">Главная</router-link>
        </li>
        <li
          v-for="(crumb, idx) in breadcrumbs"
          :key="idx"
          class="breadcrumbs-item"
          :class="{ active: idx === breadcrumbs.length - 1 }"
        >
          <router-link v-if="idx !== breadcrumbs.length - 1 && crumb.to" :to="crumb.to">
            {{ crumb.text }}
          </router-link>
          <span v-else>{{ crumb.text }}</span>
        </li>
      </ol>
    </nav>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import { getObjectNameBySlug, getRoomTitleBySlug } from '@/cache/objectsCache.js'

const route = useRoute()

const breadcrumbs = computed(() => {
  const crumbs = []
  const matched = route.matched.filter(r => r.meta && r.meta.breadcrumb)

  // Обрабатываем специальные случаи для объектов
  if (route.name === 'objects-single' && route.params.slug) {
    // Для страницы объекта: Главная → Портфолио → Название объекта
    crumbs.push({
      text: 'Портфолио',
      to: '/objects'
    })
    crumbs.push({
      text: getObjectNameBySlug(route.params.slug),
      to: null // Текущая страница
    })
  }
  else if (route.name === 'object-room' && route.params.slug && route.params.roomSlug) {
    // Для страницы комнаты: Главная → Портфолио → Название объекта → Название комнаты
    crumbs.push({
      text: 'Портфолио',
      to: '/objects'
    })
    crumbs.push({
      text: getObjectNameBySlug(route.params.slug),
      to: `/objects/${route.params.slug}`
    })
    crumbs.push({
      text: getRoomTitleBySlug(route.params.roomSlug),
      to: null // Текущая страница
    })
  }
  else {
    // Стандартная обработка для остальных маршрутов
    matched.forEach((r, index, array) => {
      let label = r.meta.breadcrumb
      if (typeof label === 'function') {
        label = label(route)
      }

      // Формируем путь для ссылки
      let to = r.path

      // Заменяем параметры в пути на актуальные значения
      for (const key in route.params) {
        if (r.path.includes(':' + key)) {
          to = to.replace(':' + key, route.params[key])
        }
      }

      // Для последнего элемента делаем ссылку неактивной
      const isLast = index === array.length - 1

      crumbs.push({
        text: label,
        to: isLast ? null : to,
      })
    })
  }

  return crumbs
})
</script>

<style scoped lang="scss">
.breadcrumbs {
  display: flex;
  align-items: center;
  list-style: none;
  padding: 0;

  &-wrapper {
    padding-block: fluid-to-laptop(30, 30);
  }
}

.breadcrumbs-item + .breadcrumbs-item::before {
  content: ' / ';
  padding: 0 0.5em;
}

.breadcrumbs-item {
  display: inline-flex;
  font-size: 10px;
  font-weight: 400;
  text-transform: uppercase;
  color: var(--color-primary);

  &.active {
    color: var(--color-gray-75);
  }
}
</style>
