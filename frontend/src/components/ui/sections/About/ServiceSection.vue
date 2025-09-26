<script setup lang="ts">

import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'

import ServiceCard from '@/components/features/ServiceCard.vue'
import servicesJSON from '@/mocks/services.json'
</script>

<template>
  <AppSection class="services-section" title="Берем на себя" v-appear>
    <BaseGrid class="services-section__grid" columns="2">
      <ServiceCard
        v-for="(service, index) in servicesJSON"
        :key="service.id"
        :title="service.name"
        :description="service.description"
        :index="(index + 1 < 10 ? '0' : '') + (index + 1)"
      />
    </BaseGrid>
  </AppSection>
</template>
