<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'
import { API_URL, TOKEN, BACKEND_URL } from '@/utils/constants.js'
import { richTextToHtml } from '@/utils/helpers.js'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
import BaseCard from '@/components/ui/base/BaseCard.vue'
// Импортируем компоненты Swiper
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Navigation, Autoplay, EffectFade } from 'swiper/modules'
// Импортируем стили Swiper
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/effect-fade'

const route = useRoute()
const router = useRouter()
const slug = route.params.slug

const service = ref(null)
const relatedServices = ref([])
const loading = ref(true)
const error = ref(null)
const slideImages = ref([])

const htmlDescription = computed(() => richTextToHtml(service.value?.description))

// Подготавливаем изображения для слайдера
const prepareImages = (serviceData) => {
  if (!serviceData.images || !Array.isArray(serviceData.images)) {
    return []
  }

  return serviceData.images.map(img => ({
    url: BACKEND_URL + (img.url || img.formats?.large?.url || ''),
    alt: img.alternativeText || service.value?.name || 'Изображение услуги'
  }))
}

const fetchService = async () => {
  loading.value = true
  try {
    const response = await axios.get(
      `${API_URL}/services?filters[slug][$eq]=${slug}&populate=*`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )

    if (response.data.data && response.data.data.length > 0) {
      service.value = response.data.data[0]

      // Подготавливаем изображения для слайдера
      if (service.value) {
        slideImages.value = prepareImages(service.value)

        // Обновляем метаданные для breadcrumbs
        const currentRoute = router.currentRoute.value
        const matchedRoute = currentRoute.matched.find(r => r.name === 'services-single')
        if (matchedRoute && matchedRoute.meta) {
          matchedRoute.meta.breadcrumb = () => service.value.name
        }

        // После получения текущей услуги загружаем другие услуги
        await fetchRelatedServices()
      }
    } else {
      error.value = 'Услуга не найдена'
    }
  } catch (e) {
    error.value = e
    console.error('Ошибка при загрузке услуги:', e)
  } finally {
    loading.value = false
  }
}

// Получаем другие услуги (исключая текущую)
const fetchRelatedServices = async () => {
  try {

    const response = await axios.get(
      `${API_URL}/services?populate=*&pagination[limit]=10`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )
    relatedServices.value = response.data.data
    console.log(relatedServices.value)
  } catch (e) {
    console.error('Ошибка при загрузке других услуг:', e)
  }
}

// Обработчик для перехода на другую услугу
const navigateToService = (newSlug) => {
  router.push(`/services/${newSlug}`)
}

onMounted(() => {
  fetchService()
})
</script>

<template>
  <div class="content__inner">
    <!-- Кастомный breadcrumbs -->
    <div class="breadcrumbs-wrapper container">
      <nav aria-label="breadcrumbs">
        <ol class="breadcrumbs">
          <li class="breadcrumbs-item">
            <router-link to="/">Главная</router-link>
          </li>
          <li class="breadcrumbs-item">
            <router-link to="/services">Услуги</router-link>
          </li>
          <li class="breadcrumbs-item active">
            <span>{{ service ? service.name : 'Загрузка...' }}</span>
          </li>
        </ol>
      </nav>
    </div>

    <div v-if="loading" class="loading">Загрузка...</div>
    <div v-else-if="error" class="error">Ошибка при загрузке данных</div>
    <template v-else>
      <AppSection mode="gray" :title="service?.name" title-tag="h1">
        <div class="service">
          <!-- Слайдер изображений -->
          <div v-if="slideImages.length > 0" class="service__slider-container">
            <Swiper
              class="service__slider"
              :modules="[Navigation, Autoplay, EffectFade]"
              :slides-per-view="1"
              :space-between="0"
              :autoplay="{ delay: 5000, disableOnInteraction: false }"
              effect="fade"
              :fadeEffect="{ crossFade: true }"
              :navigation="{
                enabled: true,
                prevEl: '.service__slider-prev',
                nextEl: '.service__slider-next'
              }"
            >
              <SwiperSlide
                v-for="(image, index) in slideImages"
                :key="index"
                class="service__slider-slide"
              >
                <img
                  :src="image.url"
                  :alt="image.alt"
                  class="service__slider-image"
                />
              </SwiperSlide>

              <!-- Кнопки навигации -->
              <div class="service__slider-navigation">
                <BaseButton
                  class="service__slider-prev"
                  mode="transparent"
                  icon-name="arrow-prev"
                  icon-color="#244C60"
                />
                <BaseButton
                  class="service__slider-next"
                  mode="transparent"
                  icon-name="arrow-next"
                  icon-color="#244C60"
                />
              </div>
            </Swiper>
          </div>

          <div class="service__meta">
            <div v-if="service?.service_category?.data" class="service__category">
              {{ service.service_category.name }}
            </div>
          </div>

          <div class="service__content" v-html="htmlDescription"></div>
        </div>
      </AppSection>

      <!-- Секция с другими услугами -->
      <AppSection
        v-if="relatedServices.length > 0"
        title="Другие услуги"
        :is-slider="true"
        class="related-services"
      >
        <Swiper
          class="related-services__slider"
          :modules="[Navigation, Autoplay]"
          :slides-per-view="4"
          :space-between="20"
          :navigation="{
            enabled: true,
            prevEl: '.section__slider-prev',
            nextEl: '.section__slider-next'
          }"
          :breakpoints="{
            320: {
              slidesPerView: 1,
              spaceBetween: 10,
            },
            480: {
              slidesPerView: 2,
              spaceBetween: 15,
            },
            768: {
              slidesPerView: 3,
              spaceBetween: 20,
            },
            1200: {
              slidesPerView: 4,
              spaceBetween: 20,
            }
          }"
        >
          <SwiperSlide
            v-for="item in relatedServices"
            :key="item.id"
            class="related-services__slide"
          >
            <BaseCard
              :img="item?.images[0]"
              :title="item?.name"
              :slug="`${item?.slug}`"
              @click="navigateToService(item?.slug)"
            />
          </SwiperSlide>
        </Swiper>
      </AppSection>
    </template>
  </div>
</template>

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
  font-size: 10px;
  font-weight: 400;
  text-transform: uppercase;
  color: var(--color-primary);

  &.active {
    color: var(--color-gray-75);
  }
}

.loading,
.error {
  text-align: center;
  padding: 2rem;
}

.error {
  color: var(--color-danger, red);
}

.service {
  &__slider {
    &-container {
      position: relative;
      margin-bottom: 2rem;
      border-radius: 8px;
      overflow: hidden;
    }

    &-slide {
      width: 100%;
      aspect-ratio: 16 / 9;
      overflow: hidden;
    }

    &-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    &-navigation {
      position: absolute;
      bottom: 20px;
      right: 20px;
      display: flex;
      gap: 10px;
      z-index: 10;
    }

    &-prev,
    &-next {
      width: 44px;
      height: 44px;
      border-radius: 50%;
      background-color: rgba(255, 255, 255, 0.8);
      display: flex;
      align-items: center;
      justify-content: center;

      &:hover {
        background-color: rgba(255, 255, 255, 1);
      }
    }
  }

  &__meta {
    display: flex;
    gap: 1rem;
    margin-bottom: 1.5rem;
    color: var(--color-gray-40);
    font-size: 0.9rem;
  }

  &__content {
    line-height: 1.7;
    margin: 0 auto;

    :deep(h2) {
      margin-top: 2rem;
      margin-bottom: 1rem;
      font-size: 1.5rem;
    }

    :deep(p) {
      margin-bottom: 1.5rem;
    }

    :deep(ul), :deep(ol) {
      margin-bottom: 1.5rem;
      padding-left: 1.5rem;

      li {
        margin-bottom: 0.5rem;
      }
    }

    :deep(a) {
      color: var(--color-primary);
      text-decoration: underline;

      &:hover {
        text-decoration: none;
      }
    }
  }
}

.related-services {
  margin-top: 3rem;

  &__slider {
    width: 100%;
  }

  &__slide {
    height: auto;
  }
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

    @include tablet {
      left: initial;
      right: 0;
      transform: scaleX(-1);
    }
  }
}

// Адаптивные стили для слайдера
@media (max-width: 768px) {
  .service {
    &__slider {
      &-navigation {
        bottom: 10px;
        right: 10px;
      }

      &-prev,
      &-next {
        width: 36px;
        height: 36px;
      }
    }
  }
}
</style>
