<script setup>
import axios from 'axios'
import { API_URL, BACKEND_URL, TOKEN } from '@/utils/constants.js'
import AppBreadcrumbs from '@/components/ui/navigation/AppBreadcrumbs.vue'
import AppSection from '@/components/ui/layout/AppSection.vue'
import { onMounted, ref } from 'vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
import {set404Status} from "@/utils/seo.js";

const loading = ref(false)
const error = ref('')
const systemData = ref(null)

const fetchSystem = async () => {
  loading.value = true

  try {
    const request = await axios.get(`${API_URL}/system?populate=*`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })

    systemData.value = request.data.data || null

  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

onMounted(async () => {
  set404Status()
  await fetchSystem()
})
</script>

<template>
  <AppSection title="Страница не найдена">
    <picture class="pb">
      <source
        v-if="systemData?.error.url"
        :srcset="BACKEND_URL + systemData?.error.url"
        media="(min-width: 1200px)"
      />
      <source
        v-if="systemData?.error.formats?.large"
        :srcset="BACKEND_URL + systemData?.error.formats.large.url"
        media="(min-width: 992px)"
      />
      <source
        v-if="systemData?.error.formats?.medium"
        :srcset="BACKEND_URL + systemData?.error.formats.medium.url"
        media="(min-width: 768px)"
      />
      <source
        v-if="systemData?.error.formats?.small"
        :srcset="BACKEND_URL + systemData?.error.formats.small.url"
        media="(min-width: 375px)"
      />
      <img
        class="object-card__image"
        :src="BACKEND_URL + (systemData?.error.formats?.thumbnail?.url || systemData?.error.url)"
        :alt="systemData?.error.alternativeText"
        loading="lazy"
      />
    </picture>
    <p class="description">Что-то пошло не так... Запрашиваемая страница не найдена.</p>
    <div class="navigation">
      <BaseButton class="return-button" href="/" tag="router-link" label="Главная страница" />
    </div>
  </AppSection>
</template>

<style scoped lang="scss">
.description {
  text-align: center;
}
.navigation {
  padding-block: var(--section-padding-y);
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;

  .return-button {
    margin: 0 auto;
  }
}
</style>
