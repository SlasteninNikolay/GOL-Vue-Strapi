<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseCard from '@/components/ui/base/BaseCard.vue'
import { Autoplay, Navigation } from 'swiper/modules'
import { Swiper, SwiperSlide } from 'swiper/vue'
import 'swiper/css'
import 'swiper/css/navigation'

const news = ref([])
const loading = ref(true)
const error = ref(null)

const fetchNews = async () => {
  loading.value = true
  try {
    const {data: response} = await axios.get(
      `${API_URL}/articles?populate=*&filters[article_category][slug][$eq]=novosti&sort=publishedAt:desc&pagination[limit]=10`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    );
    news.value = response.data;

  } catch (error) {
    console.error('Error:', error.response?.data || error.message);
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchNews()
})

// Настройки слайдера
const swiperModules = [Navigation, Autoplay]
const swiperBreakpoints = {
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
  1024: {
    slidesPerView: 4,
    spaceBetween: 20,
  }
}
</script>

<template>
  <app-section
    id="news-section"
    class="news-section"
    title="Новости и события"
    :is-slider="true"
    :slider-archive="{
      link: '/blog',
      label: 'Все новости'
    }"
    v-appear
  >
    <div class="news-section__inner">
      <div v-if="loading" class="news-section__loading">
        Загрузка новостей...
      </div>

      <div v-else-if="error" class="news-section__error">
        Не удалось загрузить новости. Попробуйте обновить страницу.
      </div>

      <div v-else-if="news.length === 0" class="news-section__empty">
        Пока нет доступных новостей
      </div>

      <Swiper
        v-else
        class="news-section__slider"
        :modules="swiperModules"
        :slides-per-view="4"
        :space-between="20"
        :navigation="{
          enabled: true,
          prevEl: '.section__slider-prev',
          nextEl: '.section__slider-next'
        }"
        :autoplay="{
          delay: 5000,
          disableOnInteraction: false
        }"
        :breakpoints="swiperBreakpoints"
        :a11y="{
          enabled: true,
          prevSlideMessage: 'Предыдущая новость',
          nextSlideMessage: 'Следующая новость'
        }"
      >
        <SwiperSlide
          v-for="newsItem in news"
          :key="newsItem.id"
          class="news-section__slide"
        >
          <BaseCard
            :img="newsItem?.images[0]"
            :slug="`/blog/${newsItem?.slug}`"
            :title="newsItem?.title"
            :date="newsItem?.publishedAt"
          />
        </SwiperSlide>
      </Swiper>
    </div>
  </app-section>
</template>

<style scoped lang="scss">
.news-section {
  &__inner {
    position: relative;
  }

  &__loading,
  &__error,
  &__empty {
    text-align: center;
    padding: 2rem;
    color: var(--color-gray);
  }

  &__error {
    color: var(--color-danger, red);
  }

  &__slider {
    width: 100%;
    padding: 1rem 0;
  }
}

// Стили навигации слайдера
:deep(.swiper-button-prev),
:deep(.swiper-button-next) {
  color: var(--color-primary);

  &:after {
    font-size: 2rem;
  }
}
</style>
