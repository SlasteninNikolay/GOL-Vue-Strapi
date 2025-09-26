<script setup>
import { onMounted } from 'vue'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import PersonCard from '@/components/features/PersonCard.vue'

import { useStrapi } from '@/composables/useStrapi'

const { data: teamData, error, loading, query } = useStrapi()

onMounted(async () => {
  await query(`teams?sort=order&populate=*`)
})

console.log(teamData)


</script>
<template>
  <AppSection class="team-section" title="Лица компании" title-color="#FFF" v-appear>
    <div v-if="loading">Загрузка...</div>
    <div v-else-if="error">Ошибка: {{ error.message }}</div>
    <BaseGrid v-else-if="teamData" class="team-section__row" columns="2">
      <div></div>
      <BaseGrid class="team-section__grid" columns="3">
        <PersonCard
          v-for="person in teamData"
          :key="person.id"
          :firstName="person?.firstName"
          :lastName="person?.lastName"
          :bio="person?.bio"
          :position="person?.position"
          :photo="person?.photo"
        />
      </BaseGrid>
    </BaseGrid>
  </AppSection>
</template>

<style scoped lang="scss">

.team-section {
  position: relative;
  background-color: var(--color-primary);

  &:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url('/images/pattern-white.svg') no-repeat;
    background-size: contain;
    z-index: -1;
    pointer-events: none;

    @include tablet {
      left: initial;
      right: 0;
      transform: scaleX(-1);
    }
  }

  .h2 {
    color: var(--color-white);
  }

  &__row {
    gap: 80px;

    @include tablet() {
      gap: 0;
    }
  }

  &__grid {
    @include tablet() {
      grid-template-columns: repeat(3, 1fr);
    }

    @include mobile() {
      grid-template-columns: repeat(2, 1fr);
    }
  }
}
</style>
