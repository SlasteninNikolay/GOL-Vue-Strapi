<template>
  <footer class="footer" v-appear>
    <div class="footer__inner container">
      <RouterLink to="/">
        <BaseIcon class="footer__logo" name="logo" />
      </RouterLink>
      <slot />
      <FooterCopyright />
    </div>
  </footer>
</template>
<style scoped lang="scss">
  .footer {
    padding-block: var(--section-padding-y);
    width: 100%;
    background-color: var(--color-primary);
    border-top: 1px solid var(--white-opacity-30);

    &__inner {
      display: flex;
      flex-direction: column;
      width: 100%;
    }

    &__logo {
      width: 200px;
      height: 40px;
    }
  }
</style>

<script setup lang="ts">
import FooterCopyright from '@/components/features/FooterCopyright.vue'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
</script>
