<script setup>
import AppHeader from '@/components/ui/layout/AppHeader.vue'
import AppNavbar from '@/components/ui/navigation/AppNavbar.vue'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import AppFooter from '@/components/ui/layout/AppFooter.vue'
import AppFooterMenu from '@/components/ui/navigation/AppFooterMenu.vue'
import FeedbackSection from '@/components/ui/sections/FeedbackSection.vue'
import { watch } from 'vue'
import { isTransitioning, loadingProgress } from '@/utils/usePageTransition.js'

watch(isTransitioning, (val) => {
  document.body.classList.toggle('no-scroll', !!val)
})
</script>

<template>
  <AppHeader>
    <AppNavbar />
  </AppHeader>
  <main class="content">
    <transition name="overlay">
      <div class="overlay" v-if="isTransitioning">
        <div class="overlay__inner">
          <BaseIcon class="overlay__logo" name="logo" color="#fff" />
          <div class="overlay__loading-bar" :style="{ width: loadingProgress + '%' }"></div>
        </div>
      </div>
    </transition>
    <router-view v-slot="{ Component }">
      <transition name="overlay">
        <component :is="Component" />
      </transition>
    </router-view>
  </main>
  <FeedbackSection />
  <AppFooter>
    <AppFooterMenu />
  </AppFooter>
</template>

<style scoped lang="scss">
.content {
  margin-top: fluid-to-laptop(80, 60);
}
</style>
