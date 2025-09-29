<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import FloatingWords from '@/components/features/FloatingWords.vue'
import { useIsMobile } from '@/utils/useIsMobile.js'
import BaseAccordionItem from '@/components/ui/base/BaseAccordionItem.vue'
import BaseAccordion from '@/components/ui/base/BaseAccordion.vue'

const isMobile = useIsMobile()
const services = ref([])
const loading = ref(true)
const error = ref(null)

const wordsArray = ['девелопмент', 'консалтинг', 'управление']

const fetchServices = async () => {
  loading.value = true
  try {
    const response = await axios.get(
      `${API_URL}/services?populate=*`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      }
    )
    services.value = response.data.data
  } catch (e) {
    error.value = e
    console.error('Ошибка при загрузке услуг:', e)
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchServices()
})
</script>

<template>
  <app-section id="services-section" class="services-section" title="Наши услуги">
    <BaseGrid class="services-section__row" columns="2">
      <div v-if="!isMobile" class="services-section__col">
        <FloatingWords size="h0" :words="wordsArray" />
      </div>
      <div class="services-section__col">
        <div v-if="loading" class="services-list__loading">Загрузка...</div>
        <div v-else-if="error" class="services-list__error">Ошибка при загрузке услуг</div>
          <BaseAccordion v-else class="services-list">
            <BaseAccordionItem
              v-for="(service, index) in services"
              :key="service.id"
              :index="index"
              :title="service?.name"
              :content="service?.description"
              content-position="left"
            />
          </BaseAccordion>
        </div>
    </BaseGrid>
  </app-section>
</template>

<style scoped lang="scss">
:deep(.accordion-item__head) {
  padding-block: 20px;
  text-transform: uppercase;
  font-weight: 400;
}

:deep(.accordion-item) {
  &:last-child {
    &:after {
      display: none;
    }
  }
}

.services-section {
  position: relative;

  &:after {
    content: '';
    position: absolute;
    top: 0;
    transform: translateY(10%);
    left: 0;
    width: 100%;
    height: fluid(1300, 600);
    background: url('/images/pattern-blue.svg') no-repeat;
    background-size: contain;
    z-index: -1;
    pointer-events: none;

    @include tablet {
      left: initial;
      right: 0;
      transform: scaleX(-1);
    }
  }

  &__row {
    gap: fluid-to-laptop(120, 60);
  }

  &__col {
    width: 100%;
    @include flex-center;
  }
}

.services-list {
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: fluid-to-laptop(18, 12);

  @include tablet {
    width: 100%;
  }

  &__loading,
  &__error {
    width: 100%;
    text-align: center;
    padding: 1rem;
  }

  &__error {
    color: var(--color-danger, red);
  }

  &__item {
    @include fluid-text(16, 12);

    width: 100%;
    position: relative;
    line-height: 1;
    text-transform: uppercase;

    &:hover {
      transform: translateY(-2px);
    }

    @include tablet {
      &:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: calc(var(--mobileGap) / 2 * -1);
        width: 100%;
        height: 1px;
        background-color: var(--color-gray);
      }
    }
  }
}
</style>
