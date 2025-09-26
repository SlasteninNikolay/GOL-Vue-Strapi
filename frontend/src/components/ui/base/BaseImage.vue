<script setup>
import { generateSrcSet } from '@/utils/helpers.js'

defineProps({
  src: String,
  alt: String,
})
</script>

<template>
  <img
    class="image"
    :src="generateSrcSet(src, 'webp', true)"
    :srcset="generateSrcSet(src)"
    :alt="alt"
    :title="alt" />
</template>

<style scoped lang="scss">
.image {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
