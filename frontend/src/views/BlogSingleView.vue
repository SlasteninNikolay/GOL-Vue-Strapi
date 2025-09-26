<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'
import { API_URL, TOKEN, BACKEND_URL } from '@/utils/constants.js'
import { richTextToHtml } from '@/utils/helpers.js'
import AppBreadcrumbs from '@/components/ui/navigation/AppBreadcrumbs.vue'
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
import BaseDivider from '@/components/ui/base/BaseDivider.vue'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'

const route = useRoute()
const router = useRouter()
const slug = route.params.slug

const article = ref(null)
const relatedArticles = ref([])
const loading = ref(true)
const error = ref(null)
const slideImages = ref([])

const htmlContent = computed(() => richTextToHtml(article.value?.content))

// Подготавливаем изображения для слайдера
const prepareImages = (articleData) => {
  if (!articleData.images || !Array.isArray(articleData.images)) {
    return []
  }

  return articleData.images.map(img => ({
    url: BACKEND_URL + (img.url || img.formats?.large?.url || ''),
    alt: img.alternativeText || article.value?.title || 'Изображение статьи'
  }))
}

const fetchArticle = async () => {
  loading.value = true
  try {
    const response = await axios.get(
      `${API_URL}/articles?filters[slug][$eq]=${slug}&populate=*`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )
    article.value = response.data.data[0]

    // Подготавливаем изображения для слайдера
    if (article.value) {
      slideImages.value = prepareImages(article.value)

      // После получения текущей статьи загружаем другие статьи
      await fetchRelatedArticles()
    }
  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

// Получаем другие статьи (исключая текущую)
const fetchRelatedArticles = async () => {
  try {
    const categoryFilter = article.value?.article_category?.data
      ? `&filters[article_category][name][$eq]=${article.value.article_category.name}`
      : ''

    const response = await axios.get(
      `${API_URL}/articles?filters[slug][$ne]=${slug}${categoryFilter}&populate=*&pagination[limit]=10`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )
    relatedArticles.value = response.data.data
  } catch (e) {
    console.error('Ошибка при загрузке других статей:', e)
  }
}

// Обработчик для перехода на другую статью
const navigateToArticle = (newSlug) => {
  router.push(`/blog/${newSlug}`)
}

onMounted(() => {
  fetchArticle()
})
</script>

<template>
  <div class="content__inner">
    <div v-if="loading" class="loading">Загрузка...</div>
    <div v-else-if="error" class="error">Ошибка при загрузке данных</div>
    <template v-else>
      <AppSection :title="article?.title" title-tag="h1" v-appear>
        <article class="article">
          <div class="article__meta">
            <div v-if="article?.publishedAt" class="article__date">
              <BaseIcon class="article__date-icon" name="time" color="#5a5a5a" />&nbsp;{{ new Date(article.publishedAt).toLocaleDateString('ru-RU') }}
            </div>
            <div v-if="article?.article_category?.data" class="article__category">
              {{ article.article_category.name }}
            </div>
          </div>
          <!-- Слайдер изображений -->
          <div v-if="slideImages.length > 0" class="article__slider-container">
            <Swiper
              class="article__slider"
              :modules="[Navigation, Autoplay, EffectFade]"
              :slides-per-view="1"
              :space-between="0"
              :autoplay="{ delay: 5000, disableOnInteraction: false }"
              effect="fade"
              :fadeEffect="{ crossFade: true }"
              :navigation="{
                enabled: true,
                prevEl: '.article__slider-prev',
                nextEl: '.article__slider-next'
              }"
            >
              <SwiperSlide
                v-for="(image, index) in slideImages"
                :key="index"
                class="article__slider-slide"
              >
                <img
                  :src="image.url"
                  :alt="image.alt"
                  class="article__slider-image"
                />
              </SwiperSlide>

              <!-- Кнопки навигации -->
              <div class="article__slider-navigation">
                <BaseButton
                  class="article__slider-prev"
                  mode="transparent"
                  icon-name="arrow-prev"
                  icon-color="#ccc"
                />
                <BaseButton
                  class="article__slider-next"
                  mode="transparent"
                  icon-name="arrow-next"
                  icon-color="#ccc"
                />
              </div>
            </Swiper>
          </div>

          <div class="article__content" v-html="htmlContent"></div>
        </article>
      </AppSection>
      <BaseDivider />
      <!-- Секция с другими статьями -->
      <AppSection
        v-if="relatedArticles.length > 0"
        title="Другие статьи"
        :is-slider="true"
        class="related-articles"
        v-appear
      >
        <Swiper
          class="related-articles__slider"
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
            v-for="item in relatedArticles"
            :key="item.id"
            class="related-articles__slide"
          >
            <BaseCard
              :img="item?.images[0]"
              :title="item?.title"
              :slug="`${item?.slug}`"
              @click="navigateToArticle(item?.slug)"
            />
          </SwiperSlide>
        </Swiper>
      </AppSection>
    </template>
  </div>
</template>

<style scoped lang="scss">
.loading,
.error {
  text-align: center;
  padding: 2rem;
}

.error {
  color: red;
}

:deep(.section__content) {
  padding-block: fluid-to-laptop(36, 20);
}

.article {
  &__slider {
    &-container {
      position: relative;
      margin-bottom: 2rem;
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
      position: relative;
      width: 44px;
      height: 44px;
      display: flex;
      align-items: center;
      justify-content: center;

      &:after {
        content: '';
        position: absolute;
        inset: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(51, 51, 51, 0.8);
        backdrop-filter: blur(10px);
        z-index: -1;
      }

      &.swiper-button-disabled {
        cursor: not-allowed;

        &:after {
          background-color: rgba(222, 222, 222, 0.1);
        }
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

  &__date {
    display: flex;
    align-items: center;
    font-size: 12px;
    color: var(--color-gray-70);

    &-icon {
      width: 14px;
      height: 14px;
    }
  }

  &__content {
    padding: fluid-to-laptop(40, 24);
    @include fluid-text(18, 14);
    line-height: 1.7;
    border: 1px solid var(--primary-opacity-10);
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

.related-articles {
  margin-top: 3rem;

  &__slider {
    width: 100%;
  }

  &__slide {
    height: auto;
  }
}

// Адаптивные стили для слайдера
@media (max-width: 768px) {
  .article {
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
