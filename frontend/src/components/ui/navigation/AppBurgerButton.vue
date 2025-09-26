<script setup>
import { ref, defineEmits, watch, defineProps } from 'vue'

const emit = defineEmits(['update:active'])
const props = defineProps({
  active: Boolean,
})
const isOpen = ref(props.active)

watch(
  () => props.active,
  (val) => {
    isOpen.value = val
  },
)

const toggleMenu = () => {
  isOpen.value = !isOpen.value
  emit('update:active', isOpen.value)
}
</script>

<template>
  <div @click="toggleMenu" class="burger-button" :class="{ active: isOpen }"></div>
</template>

<style scoped lang="scss">
.burger-button {
  width: fluid-to-laptop(80, 60);
  height: fluid-to-laptop(80, 60);
  position: relative;
  display: flex;
  flex-direction: column;
  aspect-ratio: 1 / 1;
  cursor: pointer;

  &::after,
  &::before {
    content: '';
    position: absolute;
    left: var(--container-padding-x);
    top: 50%;
    translate: 0 -50%;
    height: 2px;
    width: 50px;
    background-color: var(--color-primary);
    transition-duration: var(--transition-duration-longer);

    @include tablet() {
      background-color: var(--color-white);
    }
  }

  &::before {
    top: calc(50% - 3px);
  }

  &::after {
    top: calc(50% + 3px);
    width: 40px;
  }

  &.active {
    &::after {
      width: 30px;
      transform: rotate(45deg);
      translate: 0 -200%;
    }

    &::before {
      width: 30px;
      translate: 0 50%;
      transform: rotate(-45deg);
    }
  }
}
</style>
