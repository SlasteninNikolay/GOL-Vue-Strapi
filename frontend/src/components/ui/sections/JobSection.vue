<script setup>
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import FloatingWords from '@/components/features/FloatingWords.vue'
import { useIsMobile } from '@/utils/useIsMobile.js'
import BaseButton from '@/components/ui/base/BaseButton.vue'

const isMobile = useIsMobile()

const wordsArray = ['коллега', 'друг', 'амбассадор']
</script>

<template>
  <AppSection
    mode="gray"
    class="job-section pb"
    id="job-section"
    title="Карьера"
    v-appear
  >
    <BaseGrid class="about-section__row" columns="2">
      <div class="about-section__col">
        <FloatingWords v-if="!isMobile" size="h2" :words="wordsArray" />
        <BaseButton tag="router-link" class="about-section__link" label="Найти вакансию" mode="transparent" href="/vacancies" icon-name="arrow-next" icon-color="#244C60" />
      </div>
      <div class="about-section__col">
        <p>Мы твердо уверены, что успех компании – это успех ее сотрудников.</p>
        <p>Многие из наших сотрудников приходят получить работу, а остаются, чтобы построить карьеру, ведь наша корпоративная культура построена на вовлеченности и понимании забот окружающих людей.</p>
      </div>
    </BaseGrid>
  </AppSection>
</template>
<style scoped lang="scss">
  .about-section {
    &__col {
      display: flex;
      flex-direction: column;
      gap: 12px;

      @include mobile() {
        &:first-child {
          order: 1;
        }
      }
    }

    &__link {
      @include fluid-text(16, 14);
      font-weight: 500;
    }
  }
</style>
