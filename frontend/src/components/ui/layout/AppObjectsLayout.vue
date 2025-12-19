<script setup>
import AppBreadcrumbs from '@/components/ui/navigation/AppBreadcrumbs.vue'
</script>

<template>
  <div>
    <AppBreadcrumbs />
    <router-view :key="$route.name" />
  </div>
</template>
