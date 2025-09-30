<script setup>
import { BACKEND_URL } from '@/utils/constants.js'

defineProps({
  image: [String, Object],
  title: String,
  subtitle: String,
  slug: String,
})
</script>

<template>
  <div class="hero-card">
    <picture class="hero-card__picture">
      <source
        v-if="image?.formats?.large?.url"
        :srcset="BACKEND_URL + (image.formats.large.url || '')"
        media="(max-width: 1024px)"
      />
      <img
        class="hero-card__image"
        :src="BACKEND_URL + (image?.url || '')"
        :alt="image?.alternativeText || 'Фото объекта группы LEGENDA Hotels'"
        loading="eager"
      />
    </picture>
    <div class="hero-card__content container">
      <div class="hero-card__title">
        {{ title }}
        <RouterLink :to="`objects/${slug}`" class="hero-card__title-link" />
      </div>
      <div class="hero-card__subtitle h4">{{ subtitle }}</div>
      <RouterLink :to="`objects/${slug}`" class="hero-card__more">Подробнее</RouterLink>
    </div>
  </div>
</template>

<style scoped lang="scss">
.hero-card {
  position: relative;
  height: 100%;

  &__content {
    width: 100%;
    position: absolute;
    top: fluid-to-laptop(140, 80);
    left: 50%;
    translate: -50% -50%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: fluid-to-laptop(20, 12);
    z-index: 2;

    @include tablet() {
      top: 50%;
    }
  }

  &__title,
  &__subtitle,
  &__more {
    line-height: 1.2;
    color: var(--color-white);
    text-transform: uppercase;
  }

  &__title {
    @include  fluid-text(58, 28);
    font-weight: 500;
    text-wrap: balance;
  }

  &__subtitle {
    color: var(--white-opacity-90);
    font-weight: 400;
    line-height: 1.4;
  }

  &__more {
    @include fluid-text(14, 12);

    margin-top: 1rem;
    display: inline-block;
    position: relative;
    text-transform: uppercase;
    font-weight: 500;
    color: var(--white-opacity-90);

    &:after {
      content: '';
      position: absolute;
      left: 0;
      bottom: -7px;
      width: 60%;
      height: 0.75px;
      background-color: var(--color-gray);
    }
  }

  &__picture {
    display: block;
    position: relative;
    height: 100%;
  }

  &__image {
    width: 100%;
    height: 100%;
    max-height: 480px;
    object-fit: cover;
    filter: brightness(60%);
  }
}
</style>
