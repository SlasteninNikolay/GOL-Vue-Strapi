<script setup>
import LoyaltyCard from '@/components/features/LoyaltyCard.vue'
import axios from 'axios'
import { onMounted, ref } from 'vue'
import { API_URL, TOKEN } from '@/utils/constants.js'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import LoyaltyObject from '@/components/features/LoyaltyObject.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'

const loyaltyData = ref([])
const loyaltyPrograms = ref([])
const loyaltyMembers = ref([])

const error = ref(null)
const loading = ref(false)

const fetchData = async () => {
  try {
    const response = await axios.get(
      `${API_URL}/loyalty-programs?populate[program][populate]=image&populate[objects][populate]=*`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )
    loyaltyData.value = response.data.data[0]
    loyaltyPrograms.value = response.data.data[0].program.map((program) => ({ ...program }))
    loyaltyMembers.value = response.data.data[0].objects.map((member) => ({
      title: member.title,
      slug: member.slug,
      type: member.type
    }))
  } catch (e) {
    error.value = e
    console.error('Ошибка при загрузке:', e)
  } finally {
    loading.value = false
  }
}

onMounted(async () => {
  await fetchData()
})
</script>

<template>
  <div class="content__inner">
    <AppSection
      class="loyalty-section"
      :title="loyaltyData?.title"
      title-tag="h1"
      :subtitle="loyaltyData?.subtitle"
      with-divider="true"
    >
     <BaseGrid class="loyalty-section__grid" columns="4">
       <LoyaltyCard
         v-for="card in loyaltyPrograms"
         :key="card?.id"
         :title="card?.title"
         :subtitle="card?.subtitle"
         :description="card?.description"
         :img="card?.image"
       />
     </BaseGrid>
      <div class="loyalty-section__navigation">
        <base-button
          tag="router-link"
          href="/lk/?gp-params=area%3Dprofile%26page%3Dregister"
          label="Регистрация в программе лояльности"
        />
        <base-button
          tag="router-link"
          href="/lk"
          label="Личный кабинет"
          mode="outlined"
          icon-name="link"
          icon-size="small"
        />

      </div>
    </AppSection>
    <AppSection class="member-section" title="Программа лояльности доступна:" title-tag="h2" with-divider="true" >
      <div class="member-section__inner">
        <LoyaltyObject
          v-for="member in loyaltyMembers"
          :key="member.id"
          :title="member.title"
          :type="member.type"
          :slug="member.slug"
        />
      </div>
      <p>
        До конца 2025 года к программе присоединятся все объекты «Группа Отелей Legenda»
      </p>
    </AppSection>
  </div>
</template>

<style lang="scss">
:deep(.button--outlined) {
  border: 1px solid var(--color-black) !important;
}

.member-section{
  &__inner {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    margin-bottom: 30px;
  }
}

.loyalty-section {
  &__grid {
    padding-block: fluid(60, 30);
  }

  &__navigation {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 1rem;

    @include mobile {
      flex-direction: column;
      justify-content: flex-start;
      align-items: flex-start;
    }
  }

  &__travel-buttons {
    margin-block: fluid-to-laptop(60, 40);
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: fluid(60, 20);

    @include tablet {
      justify-content: flex-start;
    }

    @include mobile {
      flex-direction: column;
    }
  }

  &__travel-button {
    @include fluid-text(20, 16);

    padding: fluid(14, 10);
    font-weight: 400;
    line-height: 1;
    text-transform: uppercase;

    @include mobile {
      width: 100%;
      text-align: center;
      line-height: 1.2;
    }
  }
}
</style>
