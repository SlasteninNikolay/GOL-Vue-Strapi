<script setup>
import { ref, provide } from 'vue'

const activeItemIndex = ref(null)

const setActiveItem = (index) => {
  activeItemIndex.value = activeItemIndex.value === index ? null : index
}

provide('accordionContext', {
  activeItemIndex,
  setActiveItem
})
</script>

<template>
  <ul class="accordion">
    <slot></slot>
  </ul>
</template>
