<script setup>
import { BACKEND_URL } from '@/utils/constants.js'
import { computed } from 'vue'

const props = defineProps({
  object: {
    type: Object,
    required: true,
  },
})

console.log(props.object)

// const img = computed(() => props.object.images[0] || null)
// const alt = computed(() => props.object.title || 'Объект')
</script>

<template>
  <RouterLink class="promo-card" :to="url" @click="$emit('closeMenu')">
<!--    <figure class="promo-card__figure">-->
<!--      <img-->
<!--        class="promo-card__figure-image"-->
<!--        :src="BACKEND_URL + (img.formats?.medium?.imageSrc || img.imageSrc)"-->
<!--        :alt="alt"-->
<!--        loading="lazy"-->
<!--      />-->
<!--      <figcaption class="promo-card__figure-caption">{{ imageCaption }}</figcaption>-->
<!--    </figure>-->
  </RouterLink>
</template>

<style scoped lang="scss">
.promo-card {
  width: 100%;
  height: 100%;
  cursor: pointer;
  &__figure {
    position: relative;
    display: inline-block;
    margin: 0;

    &:after {
      content: '';
      position: absolute;
      inset: 0;
      width: 100%;
      height: 100%;
      background: var(--bottom-dark-gradient);
      pointer-events: none;
      z-index: 1;
    }

    &-image {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    &-caption {
      @include fluid-text(26, 18);

      width: 100%;
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      color: var(--color-white);
      background-color: transparent;
      padding: fluid(20, 10) fluid(40, 20);
      z-index: 2;
    }
  }
}
</style>
