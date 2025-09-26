<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'

import { BACKEND_URL } from '@/utils/constants'

const props = defineProps({
  object: {
    type: Object,
    required: true,
  },
})

const img = computed(() => props.object.images[0] || null)
const alt = computed(() => props.object.title || 'Объект')

const router = useRouter()
</script>

<template>
  <div class="object-card" @click="router.push(`/objects/${object.slug}`)">
    <div class="object-card__head">
      <picture v-if="img">
        <img
          class="object-card__image"
          :src="BACKEND_URL + (img.formats?.medium?.url || img.url)"
          :alt="alt"
          loading="lazy"
        />
      </picture>
      <div v-else class="object-card__no-image">Нет изображения</div>
    </div>
    <div class="object-card__body">
      <h3 class="object-card__title h5">{{ object.title }}</h3>
      <p class="object-card__location">{{ object.location }} · {{ object.type }}</p>
    </div>
  </div>
</template>

<style scoped lang="scss">
.object-card {
  display: flex;
  flex-direction: column;
  gap: 12px;
  overflow: hidden;
  cursor: pointer;

  &__title {
    text-transform: uppercase;
  }

  &__image {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    aspect-ratio: 4 / 3;
    transform-origin: left bottom;
    transition: transform var(--transition-duration-eternity) ease-out;
  }

  &__body {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 6px;
  }

  &__location {
    font-size: 12px;
  }

  @include hover(true) {
    cursor: pointer;
    .object-card__image {
      transform: scale(1.05) translate(0, 0);
    }
  }
}
</style>
