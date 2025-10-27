<script setup lang="ts">
import HeroSection from '@/components/ui/sections/HeroSection.vue'
import AboutSection from '@/components/ui/sections/AboutSection.vue'
import ObjectMapSection from '@/components/ui/sections/ObjectMapSection.vue'
import ServicesSection from '@/components/ui/sections/ServicesSection.vue'
import NewsSection from '@/components/ui/sections/NewsSection.vue'
import JobSection from '@/components/ui/sections/JobSection.vue'
import BaseDivider from '@/components/ui/base/BaseDivider.vue'
import { useHead } from '@vueuse/head'

useHead({
  title: 'Гостиничная управляющая компания LEGENDA Hotels – официальный сайт',
  meta: [
    { name: 'description', content: 'Компания LEGENDA Hotels предоставляет профессиональные услуги по техническому сопровождению гостиничных объектов и занимается их управлением. Работаем в 13 регионах России.' },
    { name: 'keywords', content: 'legenda, гостиничные объекты, управление туристическим бизнесом, управление туристической деятельностью, туристический бизнес, развитие туристического бизнеса, туристический бизнес 2025, туристический бизнес в россии, гостиничный и туристический бизнес' },

    // Open Graph (социальные сети)
    { property: 'og:title', content: 'Гостиничная управляющая компания LEGENDA Hotels – официальный сайт' },
    { property: 'og:description', content: 'Компания LEGENDA Hotels предоставляет профессиональные услуги по техническому сопровождению гостиничных объектов и занимается их управлением. Работаем в 13 регионах России.' },
    { property: 'og:image', content: '/default-image.jpg' },
    { property: 'og:type', content: 'website' },
    { property: 'og:url', content: window.location.href },
    { property: 'og:site_name', content: 'Гостиничная управляющая компания LEGENDA Hotels' },

    // Twitter Card
    { name: 'twitter:card', content: 'summary_large_image' },
    { name: 'twitter:title', content: 'Гостиничная управляющая компания LEGENDA Hotels' },
    { name: 'twitter:description', content: 'Компания LEGENDA Hotels предоставляет профессиональные услуги по техническому сопровождению гостиничных объектов и занимается их управлением. Работаем в 13 регионах России.' },
    { name: 'twitter:image', content: '/default-image.jpg' },

    { name: 'author', content: 'Гостиничная управляющая компания LEGENDA Hotels' },
  ],
  link: [
    { rel: 'icon', href: '/favicon.svg' },
  ]
})
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
