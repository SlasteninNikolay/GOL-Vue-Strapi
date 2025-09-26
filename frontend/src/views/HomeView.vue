<script setup lang="ts">
import HeroSection from '@/components/ui/sections/HeroSection.vue'
import AboutSection from '@/components/ui/sections/AboutSection.vue'
import ObjectMapSection from '@/components/ui/sections/ObjectMapSection.vue'
import ServicesSection from '@/components/ui/sections/ServicesSection.vue'
import NewsSection from '@/components/ui/sections/NewsSection.vue'
import JobSection from '@/components/ui/sections/JobSection.vue'
import BaseDivider from '@/components/ui/base/BaseDivider.vue'
</script>

<template>
  <div class="content__inner">
    <HeroSection />
    <AboutSection />
    <ObjectMapSection />
    <ServicesSection />
    <BaseDivider />
    <NewsSection />
    <BaseDivider />
    <JobSection />
  </div>
</template>

<style scoped>

</style>
