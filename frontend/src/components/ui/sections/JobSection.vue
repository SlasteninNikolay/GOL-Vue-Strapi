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
        <p>Наш главный приоритет - развитие каждого члена команды, ведь именно их профессиональный рост определяет прогресс всей компании.</p>
        <p>Многие выбирают нас как стартовую площадку для трудоустройства, но остаются надолго, потому что находят здесь возможности для самореализации и карьерного роста. В основе наших ценностей лежит атмосфера взаимопомощи, уважения и искренней заботы о коллегах.</p>
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
