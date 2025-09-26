<script setup>
defineProps({
  title: String,
  description: String,
  index: [Number, String]
})
</script>

<template>
<div class="service-card">
  <div class="service-card__header">
    <h3 class="service-card__title h4">{{ title }}</h3>
    <span class="service-card__num h1">{{ index }}</span>
  </div>
  <div class="service-card__body">
    <p class="service-card__text">
      {{ description }}
    </p>
  </div>
</div>
</template>

<style scoped lang="scss">
.service-card {
  display: flex;
  flex-direction: column;
  gap: 12px;
  padding: 34px 30px;
  border: 1px solid var(--color-gray);
  color: var(--color-primary);

  &:nth-child(3n+2):not(:nth-child(5)),
  &:nth-child(3n+3) {
    background-color: var(--color-primary);
    color: var(--color-white);

    .service-card__num {
      color: var(--white-opacity-10);
    }
  }

  &__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  &__title, &__text {
    max-width: 90%;
    color: inherit;
  }

  &__title {
    text-transform: uppercase;
  }

  &__text {

  }

  &__num {
    font-weight: 500;
    color: var(--color-gray);

    @include  mobile() {
      font-size: 34px;
    }
  }
}
</style>
