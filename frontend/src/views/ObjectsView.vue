<script setup>
import { ref, computed, watch, onMounted } from 'vue'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import BaseSkeleton from '@/components/ui/base/BaseSkeleton.vue'
import ObjectCard from '@/components/features/ObjectCard.vue'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
import YandexMap from '@/components/features/YandexMap.vue'
import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'
import { useRoute } from 'vue-router'
import { useHead } from '@vueuse/head'

const route = useRoute()

const region = ref('')
const selectedCategory = ref(null)
const showCount = ref(8)
const isLoading = ref(false)
const isLoadingMore = ref(false)
const skeletonCount = 4

// Получаем данные из Strapi
const objects = ref([])
const categories = ref([])
const loading = ref(true)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    // Получаем объекты
    const [objectsRes, categoriesRes] = await Promise.all([
      axios.get(`${API_URL}/objects?populate=*&pagination[pageSize]=100`, {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }),
      axios.get(`${API_URL}/object-categories`, {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }),
    ])
    objects.value = objectsRes.data.data
    categories.value = categoriesRes.data.data

    const categoryFromQuery = route.query.category
    if (categoryFromQuery) {
      const foundCategory = categories.value.find(
        cat => String(cat.id) === String(categoryFromQuery)
      )

      if (foundCategory) {
        selectedCategory.value = foundCategory.id
      }
    }
  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

const selectCategory = (id) => {
  selectedCategory.value = selectedCategory.value === id ? null : id
}
const resetFilters = () => {
  region.value = ''
  selectedCategory.value = null
  showCount.value = 4
}
const showMore = () => {
  isLoadingMore.value = true
  setTimeout(() => {
    showCount.value += 4
    isLoadingMore.value = false
  }, 300)
}

const filteredObjects = computed(() => {
  if (!objects.value) return []
  return objects.value.filter((obj) => {
    const attrs = obj
    const searchTerm = region.value.toLowerCase().trim()
    const matchRegion = searchTerm
      ? (attrs.adress && attrs.adress.toLowerCase().includes(searchTerm)) ||
        (attrs.title && attrs.title.toLowerCase().includes(searchTerm)) ||
        (attrs.type && attrs.type.toLowerCase().includes(searchTerm))
      : true

    const matchCategory = selectedCategory.value
      ? String(attrs.object_category?.id) === String(selectedCategory.value)
      : true

    return matchRegion && matchCategory
  })
})

useHead({
  title: 'Портфолио LEGENDA Hotels',
  meta: [
    { name: 'description', content: 'Профессиональное управление отелями, турбазами, глемпингами, хостелами и курортами по всей России. Техническое сопровождение, развитие и сервис.' },
    { name: 'keywords', content: 'legenda, гостиничные объекты, управление туристическим бизнесом, управление туристической деятельностью, туристический бизнес, развитие туристического бизнеса, туристический бизнес 2025, туристический бизнес в россии, гостиничный и туристический бизнес' },

    // Open Graph (социальные сети)
    { property: 'og:title', content: 'Портфолио LEGENDA Hotels' },
    { property: 'og:description', content: 'Профессиональное управление отелями, турбазами, глемпингами, хостелами и курортами по всей России. Техническое сопровождение, развитие и сервис.' },
    { property: 'og:image', content: '/default-image.jpg' },
    { property: 'og:type', content: 'website' },
    { property: 'og:url', content: window.location.href },
    { property: 'og:site_name', content: 'Портфолио LEGENDA Hotels' },

    // Twitter Card
    { name: 'twitter:card', content: 'summary_large_image' },
    { name: 'twitter:title', content: 'Портфолио LEGENDA Hotels' },
    { name: 'twitter:description', content: 'Профессиональное управление отелями, турбазами, глемпингами, хостелами и курортами по всей России. Техническое сопровождение, развитие и сервис.' },
    { name: 'twitter:image', content: '/default-image.jpg' },

    { name: 'author', content: 'Портфолио LEGENDA Hotels' },
  ],
  link: [
    { rel: 'icon', href: '/favicon.svg' },
  ]
})

// Имитация загрузки при фильтрации
watch([region, selectedCategory], () => {
  isLoading.value = true
  setTimeout(() => {
    isLoading.value = false
  }, 600)
})

onMounted(async () => {
  await fetchData()
})

// Следим за изменением query-параметра category
watch(
  () => route.query.category,
  (newCategory) => {
    if (categories.value.length) {
      const foundCategory = categories.value.find(
        cat => String(cat.id) === String(newCategory)
      )
      if (foundCategory) {
        selectedCategory.value = foundCategory.id
      } else {
        selectedCategory.value = null
      }
    }
  }
)
</script>

<template>
  <div class="content__inner">
    <AppSection
      class="objects-section"
      with-divider="true"
      title="Объекты группы Legenda"
      title-tag="h1"
      v-appear
    >
      <!-- Фильтры -->
      <div class="filters">
        <div class="filters__regions">
          <BaseIcon class="filters__regions-icon" name="lupe" color="#5d5d5d" />
          <input
            title="Название или локация"
            v-model="region"
            type="text"
            placeholder="Город, регион, название"
            class="filters__regions-input"
          />
          <BaseButton
            @click="resetFilters"
            class="filters__reset-button"
            mode="transparent"
            icon-size="small"
            icon-name="reset"
          />
        </div>
        <div class="filters__categories">
          <div class="categories">
            <button
              v-for="cat in categories"
              :key="cat.id"
              class="categories__item"
              :class="{ active: selectedCategory === cat.id }"
              @click="selectCategory(cat.id)"
            >
              <BaseIcon class="categories__icon" :name="cat.icon" color="#5A5A5A" />
              <span class="categories__name">{{ cat.name }}</span>
            </button>
          </div>
        </div>
      </div>

      <!-- Сетка объектов -->
      <BaseGrid columns="4">
        <template v-if="isLoading || loading">
          <BaseSkeleton v-for="n in skeletonCount" :key="'skeleton-' + n" />
        </template>
        <template v-else-if="objects && objects.length">
          <ObjectCard
            v-for="obj in filteredObjects.slice(0, showCount)"
            :key="obj.id"
            :object="obj"
          />
          <!-- Скелетоны для "показать еще" -->
          <template v-if="isLoadingMore">
            <BaseSkeleton v-for="n in 4" :key="'more-skeleton-' + n" />
          </template>
        </template>
        <template v-else> Нет данных </template>
      </BaseGrid>

      <!-- Сообщение если ничего не найдено -->
      <div v-if="!isLoading && !loading && filteredObjects.length === 0" class="empty-state">
        <p>По вашему запросу ничего не найдено</p>
        <BaseButton
          class="reset-btn"
          label="Сбросить фильтры"
          mode="outlined"
          icon-name="reset"
          icon-size="small"
          @click="resetFilters"
        />
      </div>

      <!-- Показать еще -->
      <BaseButton
        class="more-button"
        @click="showMore"
        v-if="filteredObjects.length > showCount && !isLoadingMore"
        :label="`Показать еще ${Math.min(4, Math.max(0, filteredObjects.length - showCount))}`"
        icon-color="#274D60"
        icon-name="arrow-down"
        icon-size="small"
        :disabled="isLoadingMore"
        mode="transparent"
      />
    </AppSection>
    <section class="map-section" v-appear>
      <div class="container">
        <YandexMap class="map" />
      </div>
    </section>
  </div>
</template>

<style scoped lang="scss">
.content__inner {
  position: relative;

  &:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    max-width: 280px;
    height: 100%;
    background: url('/images/pattern-blue.svg') no-repeat;
    background-size: contain;
    pointer-events: none;
    z-index: -1;

    @include tablet {
      left: initial;
      right: 0;
      transform: scaleX(-1);
    }
  }
}
.objects-section {
  padding-top: 0;

  :deep(.section__content) {
    padding-block: #{fluid-to-laptop(60, 40)};
  }
}

.map-section {
  padding-bottom: var(--section-padding-y);

  .map {
    border: 0.75px solid var(--color-primary);
  }
}

.filters {
  display: flex;
  flex-direction: column;
  gap: 20px;
  padding-bottom: 20px;

  &__regions {
    position: relative;
    width: 100%;
    border-radius: 4px;
    background-color: var(--color-gray-light);

    &-input {
      width: 100%;
      flex-grow: 1;
      padding: 10px 40px;
      border: none;
      background: transparent;
      outline: none;
      border-radius: 4px;
      transition: outline 0.2s;

      &::placeholder {
        font-size: 12px;
      }

      &:focus {
        background: var(--color-white);
        outline: 1px solid var(--primary-opacity-60);
        outline-offset: 1px;
        color: var(--color-primary);
      }
    }

    &-icon {
      @include square(16px);

      position: absolute;
      top: 50%;
      left: 0;
      translate: 10px -50%;
    }
  }

  &__reset-button {
    height: 100%;
    padding-inline: 10px;
    position: absolute;
    top: 50%;
    right: 0;
    translate: 0% -50%;
    background-color: transparent;
    border: none;
    color: var(--color-gray-60);
    font-size: 12px;
    line-height: 1;

    @include hover(true) {
      color: var(--color-primary);
    }
  }
}

.categories {
  display: flex;
  gap: 16px;
  overflow-x: scroll;
  scrollbar-width: none;

  &__item {
    padding: 8px 12px;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 4px;
    border: none;
    border-radius: 4px;
    background: none;
    cursor: pointer;
    flex-shrink: 0;

    &.active {
      background-color: var(--color-gray);
    }
  }

  &__icon {
    width: 32px;
    height: 32px;
  }

  &__name {
    font-size: 14px;
    font-weight: 400;
    color: var(--color-black);
  }
}

.more-button {
  margin-top: var(--section-padding-y);
  width: 100%;
  max-width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  padding-block: 20px;

  &:after,
  &:before {
    content: '';
    position: absolute;
    left: 0;
    width: 100%;
    height: 1px;
    background: var(--color-gray);
  }

  &:after {
    bottom: 0;
  }

  &:before {
    top: 0;
  }
}
</style>
