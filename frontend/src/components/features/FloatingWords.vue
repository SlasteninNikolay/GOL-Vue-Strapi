<script setup>
import { onMounted } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

defineProps({
  words: {
    type: Array,
    default: () => [],
  },
  size: {
    type: String,
    default: 'h1',
    validator: (value) => {
      return ['h0', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'].includes(value)
    },
  },
})

onMounted(() => {
  const spans = document.querySelectorAll('.floating-words__item')
  spans.forEach((span, index) => {
    gsap.fromTo(
      span,
      { x: index % 2 === 0 ? -120 : 120 },
      {
        x: 0,
        scrollTrigger: {
          trigger: span,
          start: 'top bottom',
          end: 'bottom top',
          scrub: true,
        },
      },
    )
  })
})
</script>

<template>
  <div class="floating-words" :class="size" v-if="words.length">
    <span class="floating-words__item" v-for="(word, index) in words" :key="index">{{ word }}</span>
  </div>
</template>

<style scoped lang="scss">
.floating-words {
  position: relative;
  display: flex;
  flex-direction: column;

  &__item {
    position: relative;
    display: block;
    top: 0;
    font-weight: 600;
    line-height: 1.4;
    color: var(--color-gray);
    text-transform: uppercase;

    &:nth-child(even) {
      padding-left: 15%;
    }
  }
}
</style>
