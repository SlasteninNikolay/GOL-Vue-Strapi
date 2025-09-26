<script setup>
import { computed } from 'vue'
import { richTextToHtml } from '@/utils/helpers.js'
import { BACKEND_URL } from '@/utils/constants.js'

const props = defineProps({
  title: String,
  subtitle: String,
  description: Array,
  img: Object,
})

const htmlPageContent = computed(() => richTextToHtml(props.description))
</script>

<template>
  <div class="loyalty-card">
    <div class="loyalty-card__inner">
      <div class="loyalty-card__head">
        <picture class="loyalty-card__image">
          <source v-if="img?.url" :srcset="BACKEND_URL + img?.url" media="(min-width: 1200px)" />
          <source
            v-if="img?.formats?.large"
            :srcset="BACKEND_URL + img?.formats?.large?.url"
            media="(min-width: 992px)"
          />
          <source
            v-if="img?.formats?.medium"
            :srcset="BACKEND_URL + img?.formats?.medium?.url"
            media="(min-width: 768px)"
          />
          <source
            v-if="img?.formats?.small"
            :srcset="BACKEND_URL + img?.formats?.small?.url"
            media="(min-width: 375px)"
          />
          <img
            class="card__figure-image"
            :src="BACKEND_URL + (img?.formats?.thumbnail?.url || img?.url)"
            :alt="img?.alternativeText"
            loading="lazy"
          />
        </picture>
      </div>
      <div class="loyalty-card__body">
        <h2 class="loyalty-card__title h3">{{ title }}</h2>
        <span class="loyalty-card__subtitle">{{ subtitle }}</span>
        <p v-if="description" v-html="htmlPageContent" class="loyalty-card__description" />
      </div>
    </div>
  </div>
</template>

<style lang="scss">
.loyalty-card {
  color: var(--color-primary);

  @include hover(true) {
    .loyalty-card__image{
      transform: translateY(-10px);
    }
  }

  @include tablet {
    &:not(:last-child) {
      padding-bottom: 40px;
    }
  }

  &__title {
    margin-top: fluid(30, 24);
    line-height: 1;
    color: var(--color-primary);
    text-transform: uppercase;
  }

  &__subtitle {
    @include fluid-text(16, 12);

    display: inline-block;
    margin-bottom: fluid(30, 10);
    color: var(--color-black);
  }

  &__image {
    width: 100%;
    height: 100%;
    display: block;
    object-fit: cover;
    transition-duration: var(--transition-duration);
  }

  &__decription b {
    @include fluid-text(20, 16);
    font-weight: 500;
    text-transform: uppercase;
  }
}
</style>
