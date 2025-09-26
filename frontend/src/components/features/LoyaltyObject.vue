<script setup>
import BaseButton from '@/components/ui/base/BaseButton.vue'

defineProps({
  title: {
    type: String,
    default: ''
  },
  type: {
    type: String,
    default: ''
  },
  slug: {
    type: String,
    default: ''
  }
})
</script>

<template>
  <div class="loyalty-object">
    <span class="loyalty-object__type">{{ type }}</span>
    <div class="loyalty-object__inner">
      <base-button
        class="loyalty-object__button"
        tag="router-link"
        :href="`objects/${slug}`"
        :label="title"
        mode="transparent"
        icon-name="link"
      />
    </div>
  </div>
</template>

<style lang="scss" scoped>
.loyalty-object {
 padding: 10px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 10px;
  border: 1px solid var(--color-black);

  &__inner {
    display: flex;
  }

  &__type {
    font-weight: 500;
    color: var(--secondary-color);
  }

  &__button {
    display: flex;
    align-items: center;
    gap: 10px;
    @include fluid-text(20, 16);
    font-weight: 600;
    text-transform: uppercase;
  }
}
</style>
