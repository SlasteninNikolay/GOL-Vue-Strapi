<script setup>
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Navigation, Autoplay, EffectFade } from 'swiper/modules'

import 'swiper/css'
import 'swiper/css/effect-fade';
import 'swiper/css/navigation'
import 'swiper/css/pagination'
import MenuPromoCard from '@/components/features/MenuPromoCard.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
import { useIsMobile } from '@/utils/useIsMobile.js'
import { onMounted, ref } from 'vue'

defineProps({
  isActive: Boolean,
})

const isMobile = useIsMobile()

import { useStrapi } from '@/composables/useStrapi'

const { data: promoCards, error, loading, query } = useStrapi()

onMounted(async () => {
  try {
    await query(`articles?populate=*&filters[article_category][slug][$eq]=novosti&sort=publishedAt:desc&pagination[limit]=5`);
  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
})

</script>

<template>
  <div class="menu" :class="{ active: isActive }">
    <div class="menu__col">
      <h1 class="menu__title">Группа Отелей LEGENDA</h1>
      <Transition name="slide">
        <nav v-show="isActive" class="menu__nav">
          <RouterLink v-if="isMobile" class="menu__nav-link link" to="/" @click="$emit('closeMenu')"
            >Главная</RouterLink
          >
          <RouterLink class="menu__nav-link link" to="/about" @click="$emit('closeMenu')"
            >О нас</RouterLink
          >
          <RouterLink class="menu__nav-link link" to="/objects" @click="$emit('closeMenu')"
            >Портфолио</RouterLink
          >
          <RouterLink class="menu__nav-link link" to="/vacancies" @click="$emit('closeMenu')"
            >Карьера</RouterLink
          >
          <RouterLink class="menu__nav-link link" to="/blog" @click="$emit('closeMenu')"
            >Блог</RouterLink
          >
          <RouterLink class="menu__nav-link link" to="/contacts" @click="$emit('closeMenu')"
            >Контакты</RouterLink
          >
        </nav>
      </Transition>
      <div class="menu__footer">
        <div class="menu__footer-item">
          <BaseIcon class="menu__footer-icon" name="phone" color="#FFF" />
          <a class="menu__phone link" href="tel:+74952527297">8 (495) 252-72-97</a>
        </div>
        <div class="menu__footer-item">
          <BaseIcon class="menu__footer-icon" name="email" color="#FFF" />
          <a class="menu__email link" href="mailto:info@legenda-hotels.ru"
            >info@legenda-hotels.ru</a
          >
        </div>
      </div>
    </div>
    <div v-if="!isMobile" class="menu__col">
      <Swiper
        class="menu__slider"
        :modules="[Navigation, Autoplay, EffectFade]"
        :slides-per-view="1"
        :space-between="20"
        :autoplay="{ delay: 3000, disableOnInteraction: false }"
        :navigation="{ enabled: true, prevEl: '.menu__slider-prev', nextEl: '.menu__slider-next' }"
        effect="fade"
        :fade-effect="{ crossFade: true }"
      >
        <SwiperSlide class="menu__slider" v-for="(slide, idx) in promoCards" :key="idx">
          <MenuPromoCard :object="slide" @closeMenu="$emit('closeMenu')" />
        </SwiperSlide>
      </Swiper>
      <div class="menu__slider-navigation">
        <BaseButton class="menu__slider-prev" icon-name="arrow-prev" icon-color="#244C60" />
        <BaseButton class="menu__slider-next" icon-name="arrow-next" icon-color="#244C60" />
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.menu {
  --padding-x: #{fluid(180, 60)};
  --padding-y: #{fluid(60, 40)};

  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 100vh;
  display: flex;
  pointer-events: none;
  z-index: 999;

  &__col {
    position: absolute;
    width: 50%;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: var(--padding-y) var(--padding-x);
    transition-duration: var(--transition-duration-longer);

    &:nth-child(1) {
      left: -100%;
      background-color: var(--color-primary);
      background-image: url('/images/pattern.svg');
      background-repeat: no-repeat;
      background-position: left top;
      background-size: contain;

      @include tablet() {
        width: 100%;
      }
    }

    @include tablet() {
      padding-top: 0;
    }

    &:nth-child(2) {
      padding-top: fluid(140, 40);
      right: -100%;
      background-color: var(--color-gray);

      @include tablet() {
        display: none;
      }
    }
  }

  &.active {
    pointer-events: all;

    .menu__col {
      &:nth-child(1) {
        left: 0;
      }

      &:nth-child(2) {
        right: 0;
      }
    }
  }

  &__nav {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: space-between;
    gap: fluid(20, 12);

    &-link {
      @include fluid-text(32, 24);

      font-weight: 400;
      color: var(--color-white);
    }
  }

  &__title {
    position: absolute;
    top: calc(var(--padding-y) * 2);
    left: var(--container-padding-x);
    @include fluid-text(32, 20);

    color: var(--color-white);
    font-weight: 500;
  }

  &__footer {
    position: absolute;
    bottom: 60px;
    left: var(--container-padding-x);
    display: flex;
    gap: 30px;

    @include tablet() {
      flex-direction: column;
    }

    &-item {
      @include fluid-text(20, 16);

      display: inline-flex;
      align-items: center;
      gap: 12px;
      color: var(--color-white);
      font-weight: 400;
    }

    &-icon {
      width: 24px;
      height: 24px;
    }
  }

  &__slider {
    position: relative;
    width: 100%;
    height: 100%;
    aspect-ratio: 3 / 4;

    &-item {
      width: 100%;
    }

    &-next,
    &-prev {
      padding: 0;
      width: fluid(64, 44);
      height: fluid(64, 44);
      background-color: transparent;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      z-index: 2;

      &:hover {
        background-color: transparent;

        .icon {
          transform: scale(1.05);
        }
      }
    }

    &-navigation {
      margin-top: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
    }
  }
}

.slide-enter-active,
.slide-leave-active {
  transition: transform var(--transition-duration-eternity) ease;
}

.slide-enter,
.slide-leave-to {
  transform: translateX(-100%);
}
</style>
