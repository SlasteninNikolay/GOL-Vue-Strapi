<script setup>
import BaseButton from '@/components/ui/base/BaseButton.vue'
import { BACKEND_URL } from '@/utils/constants.js'

defineProps({
  img: {
    type: [Array, Object],
    default: () => null,
  },
  slug: {
    type: String,
    default: '',
  },
  title: {
    type: String,
    default: '',
  },
  excerpt: {
    type: String,
    default: '',
  },
})
</script>

<template>
  <div class="card">
    <div class="card__head">
      <div class="card__figure">
        <picture>
          <source v-if="img.url" :srcset="BACKEND_URL + img.url" media="(min-width: 1200px)" />
          <source
            v-if="img.formats?.large"
            :srcset="BACKEND_URL + (img.formats.large.url || '')"
            media="(min-width: 992px)"
          />
          <source
            v-if="img.formats?.medium"
            :srcset="BACKEND_URL + (img.formats.medium.url || '')"
            media="(min-width: 768px)"
          />
          <source
            v-if="img.formats?.small"
            :srcset="BACKEND_URL + (img.formats.small.url || '')"
            media="(min-width: 375px)"
          />
          <img
            class="card__figure-image"
            :src="BACKEND_URL + (img.formats?.thumbnail?.url || img.url || '')"
            :alt="img.alternativeText"
            loading="lazy"
          />
        </picture>
      </div>
      <BaseButton tag="router-link" mode="abs" class="card__figure-link" :href="`${slug}`" />
    </div>
    <div class="card__content">
      <h3 class="card__title">{{ title }}</h3>
      <p v-if="excerpt">
        {{ excerpt }}
      </p>
      <div v-if="!excerpt" class="card__links">
        <BaseButton
          tag="router-link"
          :href="`${slug}`"
          mode="transparent"
          icon-name="arrow-next"
          icon-color="#244c60"
        />
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.card {
  flex: 1;
  display: flex;
  flex-direction: column;
  height: 100%;

  &__head {
    position: relative;
  }

  &__figure {
    width: 100%;
    height: 184px;
    overflow: hidden;
    position: relative;
  }

  &__links {
    button {
      width: auto;
    }
  }

  &__figure-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
    transform-origin: left bottom;
    transition: transform var(--transition-duration-eternity) ease-out;
  }

  &__content {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    gap: 20px;
    padding: fluid(30, 20) fluid(24, 20) 10px;
    height: 100%;

    border-right: 0.75px solid var(--color-gray);
    border-bottom: 0.75px solid var(--color-gray);
    border-left: 0.75px solid var(--color-gray);
  }

  &__title {
    @include fluid-text(18, 16);
    font-weight: 400;
    text-transform: uppercase;
  }

  @include hover(true) {
    cursor: pointer;
    .card__figure-image {
      transform: scale(1.05) translate(0, 0);
    }
  }
}
</style>
