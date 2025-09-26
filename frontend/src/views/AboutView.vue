<script setup>
import AppBreadcrumbs from '@/components/ui/navigation/AppBreadcrumbs.vue'
import TeamSection from '@/components/ui/sections/About/TeamSection.vue'
import ServicesSection from '@/components/ui/sections/About/ServiceSection.vue'
import BioSection from '@/components/ui/sections/About/BioSection.vue'
import NewsSection from '@/components/ui/sections/NewsSection.vue'
</script>

<template>
  <div class="content__inner">
    <AppBreadcrumbs />
    <BioSection />
    <ServicesSection />
    <TeamSection />
    <NewsSection />
  </div>
</template>

<style scoped lang="scss">
.bio-section {
  gap: 120px !important;

  &__row {
    gap: 60px;

    @include tablet() {
      display: flex;
      flex-direction: column-reverse;
      gap: 40px;
    }
  }

  &__col {
    @include fluid-text(16, 12);
    position: relative;
  }

  &__figure {
    position: absolute;
    height: 100%;
    top: -80px;

    &-image {
      width: 100%;
      height: calc(100% + 80px);
    }

    @include tablet() {
      position: initial;
      top: initial;

      &-image {
        height: auto;
      }
    }
  }
}
</style>
