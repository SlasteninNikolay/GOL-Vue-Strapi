<script setup>
defineProps({
  columns: {
    type: String,
    default: '1',
  },
})
</script>

<template>
  <div :class="`grid ${columns > 1 ? `grid--${columns}` : ''}`">
      <slot></slot>
  </div>
</template>

<style scoped lang="scss">
.grid {
  --gridColumns: 1;

  display: grid;
  grid-template-columns: repeat(var(--gridColumns), 1fr);
  gap: fluid-to-laptop(30, 20);

  &--2 {
    --gridColumns: 2;

    @include tablet {
      --gridColumns: 1;
    }
  }

  &--3 {
    --gridColumns: 3;

    @include tablet {
      --gridColumns: 2;

      .grid__item:nth-child(odd):last-child {
        grid-column: -1 / 1;
      }
    }
  }

  &--4 {
    --gridColumns: 4;

    @include tablet {
      --gridColumns: 2;

      .grid__item:nth-child(odd):last-child {
        grid-column: -1 / 1;
      }
    }
  }

  @include mobile {
    --gridColumns: 1;
  }
}
</style>
