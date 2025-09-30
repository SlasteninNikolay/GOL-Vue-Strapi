<script setup>
import { API_URL, TOKEN } from '@/utils/constants.js'
import AppBreadcrumbs from '@/components/ui/navigation/AppBreadcrumbs.vue'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseAccordion from '@/components/ui/base/BaseAccordion.vue'
import BaseAccordionItem from '@/components/ui/base/BaseAccordionItem.vue'
import { onMounted, ref, computed } from 'vue'
import axios from 'axios'

const vacanciesData = ref([])
const error = ref(null)
const loading = ref(true)
const activeLocation = ref('all')

const fetchData = async () => {
  try {
    const response = await axios.get(
      `${API_URL}/vacancies?populate=*`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )
    vacanciesData.value = response.data.data.map(item => {
      const cityName = item.vacancy_location?.name || 'Без города'

      return {
        id: item.id,
        name: item.name,
        cityName: cityName,
        content: item.description,
      }
    })
  } catch (e) {
    error.value = e
    console.error('Ошибка при загрузке:', e)
  } finally {
    loading.value = false
  }
}

const vacanciesByCity = computed(() => {
  if (!vacanciesData.value || vacanciesData.value.length === 0) return {}

  // Группируем вакансии по городам
  const grouped = vacanciesData.value.reduce((acc, vacancy) => {
    const city = vacancy.cityName
    if (!acc[city]) {
      acc[city] = []
    }
    acc[city].push(vacancy)
    return acc
  }, {})

  // Сортируем ключи (названия городов) по алфавиту
  const sorted = {}
  Object.keys(grouped)
    .sort((a, b) => a.localeCompare(b, 'ru'))
    .forEach(city => {
      sorted[city] = grouped[city]
    })

  return sorted
})

// Список городов для навигации
const cities = computed(() => Object.keys(vacanciesByCity.value))

const selectLocation = ((city) => {
    activeLocation.value = city || 'all'
})

onMounted(async () => {
  await fetchData()
})
</script>

<template>
  <div class="content__inner">
    <AppBreadcrumbs />
    <AppSection
      class="accordion-section"
      title="Карьера"
      title-tag="h1"
      subtitle="Мы стремимся привлечь вовлечённых, инициативных и компетентных сотрудников, предлагая им условия для постоянного развития, социальные гарантии и достойную мотивацию."
      with-divider="true"

    >
      <nav v-if="cities.length" class="accordion-navigation">
        <ul class="accordion-navigation__list">
          <li class="accordion-navigation__list-item" :class="{active: 'all' === activeLocation}"><a href="#" @click="selectLocation('all')">Все вакансии</a></li>
          <li
            v-for="(city, index) in cities"
            :key="city"
            class="accordion-navigation__list-item"
            :class="{active: city === activeLocation}"
          >
            <a href="#" @click="selectLocation(city)">{{ city }}</a>
          </li>
        </ul>
      </nav>

      <BaseAccordion v-if="!loading">
        <template v-for="(cityVacancies, city, index) in vacanciesByCity" :key="city">
          <div v-if="city === activeLocation || 'all' === activeLocation">
            <div :id="`city-${index}`" class="accordion-counter">
              <div class="accordion-counter__output">
                {{ cityVacancies.length }}
              </div>
              <div class="accordion-counter__label">{{ city }}</div>
            </div>

            <BaseAccordionItem
              v-for="vacancy in cityVacancies"
              :key="vacancy.id"
              :title="vacancy.name"
              :content="vacancy.content"
              :index="vacancy.id"
            />
          </div>
        </template>
      </BaseAccordion>

      <div v-if="loading">Загрузка вакансий...</div>
      <div v-if="error">Ошибка загрузки: {{ error }}</div>
    </AppSection>
  </div>
</template>

<style lang="scss" scoped>
:deep(.section__content) {
  padding-block: fluid(80, 40);
}

:deep(.accordion-item__head) {
  text-wrap: balance;
}

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
    transition-duration: var(--transition-duration);

    @include tablet {
      left: initial;
      right: 0;
      transform: scaleX(-1);
    }
  }
}

.accordion-counter {
  position: relative;
  left: 50%;
  transform: translateX(-10%);
  padding: fluid-to-laptop(80, 40) 0 20px;
  display: flex;
  align-items: center;
  gap: 12px;

  @include tablet {
    left: 0;
    transform: translateX(0);
  }

  &__output {
    width: fluid(34, 24);
    height: fluid(34, 24);
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--color-white);
    background-color: var(--color-primary);
    border-radius: 50%;
    font-weight: 500;
  }

  &__label {
    @include fluid-text(18,14)
  }
}

.accordion-navigation {
  &__list {
    display: flex;
    flex-wrap: wrap;
    overflow-x:  auto;
    padding-block: 10px;
    gap: 0.5rem;

    &-item {
      padding: 4px 8px;
      border-radius: 1rem;
      color: var(--color-gray-75);
      background-color: var(--primary-opacity-10);

      &.active {
        color: var(--color-primary);
      }

      a {
        color: inherit;
        font-weight: 400;
        transition-duration: var(--transition-duration);

        &:hover {
          color: var(--color-primary);
        }
      }
    }
  }
}
</style>
