<script setup>
import { ref } from 'vue'
import { BACKEND_URL } from '@/utils/constants.js'

defineProps({
  firstName: String,
  lastName: String,
  bio: String,
  position: String,
  photo: [Object, String],
})

const show = ref(false)
</script>

<template>
  <div class="person-card" @mouseenter="show = true" @mouseleave="show = false">
    <figure class="person-card__figure">
        <img
          class="person-card__figure-image"
          :src="BACKEND_URL + photo?.url"
          :alt="photo?.alternativeText || 'Постер'"
          loading="lazy"
        />
      <Transition name="slide">
        <figcaption v-show="show" class="person-card__figure-caption">
          <h5 class="person-card__name">{{ firstName }} {{ lastName }}</h5>
          <p class="person-card__bio">{{ position }}</p>
        </figcaption>
      </Transition>
    </figure>
  </div>
</template>

<style scoped lang="scss">
.person-card {
  aspect-ratio: 3/4;

  @include hover(true) {
    cursor: pointer;
  }

  &__figure {
    width: 100%;
    height: 100%;
    position: relative;
    overflow: hidden;

    &-image {
      position: absolute;
      inset: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    &-caption {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      padding: fluid(12, 8);
      background-color: var(--black-opacity-30);
    }
  }

  &__name, &__bio {
    @include  fluid-text(10, 8);
  }

  &__name {
    color: var(--white-opacity-80);
  }

  &__bio {
    color: var(--white-opacity-60);
  }
}
</style>
