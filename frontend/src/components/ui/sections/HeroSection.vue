<script setup>
import { Autoplay, EffectFade, Pagination, Navigation, Manipulation } from 'swiper/modules'
import { Swiper, SwiperSlide } from 'swiper/vue'
import { onMounted, ref, computed, nextTick } from 'vue'
import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'

import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/effect-fade'
import HeroCard from '@/components/features/HeroCard.vue'

const bannerData = ref([])
const swiperRef = ref(null)

const error = ref(null)
const loading = ref(false)

const fetchData = async () => {
  try {
    const response = await axios.get(
      `${API_URL}/banners?populate[object][fields][0]=slug&populate[object][fields][1]=travelline_id&populate[image][fields][0]=url&populate[image][fields][1]=formats`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )
    bannerData.value = response.data.data
  } catch (e) {
    error.value = e
    console.error('Ошибка при загрузке:', e)
  } finally {
    loading.value = false
  }
}

// Инициализация Travelline для динамически созданных элементов
const initTravelline = () => {
  if (window.travelline && window.travelline.integration) {
    const ti = window.travelline.integration
    
    bannerData.value.forEach((slide) => {
      const travellineId = slide.object?.travelline_id
      
      if (travellineId) {
        const containerId = `tl-search-form-${travellineId}`
        const element = document.getElementById(containerId)
        
        if (element && !element.classList.contains('tl-initialized')) {
          try {
            if (!ti.__cq) ti.__cq = []
            
            ti.__cq.push(["setContext", `TL-INT-legenda-hotels-ru_2025-10-28.${travellineId}`, "ru"])
            ti.__cq.push(["embed", "search-form", { container: containerId }])
            
            if (window.TL && window.TL.integration) {
              window.TL.integration.run()
            } else if (ti.run) {
              ti.run()
            }
            
            element.classList.add('tl-initialized')
          } catch (error) {
            console.warn(`Ошибка инициализации Travelline для объекта ${travellineId}:`, error)
          }
        }
      }
    })
  }
}

const swiperOptions = {
  modules: [Pagination, Autoplay, EffectFade, Navigation, Manipulation],
  slidesPerView: 1,
  spaceBetween: 0,
  effect: 'fade',
  fadeEffect: { crossFade: true },
  autoplay: {
    delay: 5000,
    disableOnInteraction: false
  },
  navigation: {
    enabled: true,
    prevEl: '.arrow-prev',
    nextEl: '.arrow-next'
  },
  pagination: {
    el: '.hero-slider__pagination',
    clickable: true
  },
  on: {
    slideChange: () => {
      // Инициализируем Travelline при смене слайда
      setTimeout(() => {
        initTravelline()
      }, 100)
    }
  }
}

onMounted(async () => {
  await fetchData()
  
  // Ждем отрисовки DOM и инициализируем Travelline
  await nextTick()
  
  // Задержка для полной загрузки скрипта Travelline
  setTimeout(() => {
    initTravelline()
  }, 500)
})
</script>

<template>
  <section aria-labelledby="hero-section-title" class="hero-section">
    <Swiper
      ref="swiperRef"
      class="hero-slider"
      v-bind="swiperOptions"
    >
      <SwiperSlide
        v-for="(slide, idx) in bannerData"
        :key="slide.id || idx"
      >
        <HeroCard
          class="hero-slider__item"
          :image="slide.image"
          :title="slide.title"
          :subtitle="slide.subtitle"
          :slug="slide.object.slug"
          :travelline-id="slide.object.travelline_id"
        />
      </SwiperSlide>

      <div class="hero-slider__pagination" />

      <div class="hero-slider__navigation">
        <button
          class="hero-slider__nav-btn hero-slider__nav-btn--prev arrow-prev"
        >
          <BaseIcon name="arrow-prev" />
        </button>
        <!-- <div id="block-search">
          <div id="tl-search-form" class="tl-container">
            <a href="https://www.travelline.ru/products/tl-hotel/" rel="nofollow" target="_blank">TravelLine</a>
          </div>
        </div> -->
        <button
          class="hero-slider__nav-btn hero-slider__nav-btn--next arrow-next"
        >
          <BaseIcon name="arrow-next" />
        </button>
      </div>
    </Swiper>
  </section>
</template>

<style scoped lang="scss">
#block-search,
#block-search * {
  box-sizing: border-box;
}

#block-search {
  width: 100%;
  pointer-events: all;
}

.tl-container {
  padding: 0 30px;
}

.hero-section {
  position: relative;
}

.hero-slider {
  --navbarHeight: #{fluid(80, 60)};
  height: 100%;

  @include tablet() {
    height: 40vh;
  }

  &__item {
    height: 100%;
  }

  &__pagination {
    position: absolute;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: center;

    @include tablet-above() {
      padding: fluid(34, 24);
      flex-direction: column;
      align-items: flex-end;
      justify-content: center;
      gap: 12px;
      right: 0;
      top: 50%;
      transform: translateY(-50%);
      pointer-events: none;
    }
  }

  &__navigation {
    position: absolute;
    z-index: 20;
    bottom: 30px;
    left: 0;
    right: 0;
    display: flex;
    justify-content: space-between;
    pointer-events: none;

    @include tablet() {
      display: none;
    }
  }

  &__nav-btn {
    border: none;
    width: fluid(60, 40);
    height: fluid(60, 40);
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    cursor: pointer;
    pointer-events: auto;
    transition: background 0.3s ease;
    background: transparent;

    svg {
      width: fluid(24, 16);
      height: fluid(24, 16);
      color: var(--color-white);
    }
  }
}
</style>
