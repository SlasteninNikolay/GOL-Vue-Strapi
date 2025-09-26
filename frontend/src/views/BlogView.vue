<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import BaseCard from '@/components/ui/base/BaseCard.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
import AppBreadcrumbs from '@/components/ui/navigation/AppBreadcrumbs.vue'

const news = ref([])
const loading = ref(true)
const error = ref(null)
const visibleCount = ref(4)

const fetchNews = async () => {
  loading.value = true
  try {
    const response = await axios.get(
      `${API_URL}/articles?filters[article_category][name][$eq]=news&populate=*`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      },
    )
    news.value = response.data.data
    console.log(news.value)
  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

const visibleNews = computed(() => {
  return news.value.slice(0, visibleCount.value)
})

const hasMoreNews = computed(() => {
  return news.value.length > visibleCount.value
})

const showMoreNews = () => {
  visibleCount.value += 4
}

onMounted(() => {
  fetchNews()
})
</script>

<template>
  <div class="content__inner">
    <AppBreadcrumbs />
    <router-view v-if="$route.params.slug" />
    <AppSection
      class="pb"
      v-else title-tag="h1"
      title="Новости и события"
      with-divider="true"
      v-appear
    >
      <div v-if="loading" class="loading">Загрузка...</div>
      <div v-else-if="error" class="error">Ошибка при загрузке данных</div>
      <template v-else>
        <BaseGrid columns="4">
          <BaseCard
            v-for="item in visibleNews"
            :key="item?.id"
            :img="item?.images[0]"
            :title="item?.title"
            :slug="`/blog/${item?.slug}`"
          />
        </BaseGrid>
        <div v-if="hasMoreNews" class="more-button">
          <BaseButton
            tag="button"
            label="Показать еще"
            @click="showMoreNews"
            mode="transparent"
            icon-name="arrow-down"
            icon-size="small"
          />
        </div>
      </template>
    </AppSection>
  </div>
</template>

<style scoped lang="scss">
.content__inner {
  position: relative;

  &:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    max-width: 280px;
    height: 100%;
    background: url('/images/pattern-blue.svg') no-repeat;
    background-size: contain;
    pointer-events: none;
    z-index: -1;

    @include tablet {
      left: initial;
      right: 0;
      transform: scaleX(-1);
    }
  }
}

.loading,
.error {
  text-align: center;
  padding: 2rem;
}

.error {
  color: red;
}

.more-button {
  margin-top: var(--section-padding-y);
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  padding-block: 20px;

  &:after,
  &:before {
    content: '';
    position: absolute;
    left: 0;
    width: 100%;
    height: 1px;
    background: var(--color-gray);
  }

  &:after {
    bottom: 0;
  }

  &:before {
    top: 0;
  }
}

:deep(.section__content) {
  padding-block: fluid-to-laptop(60, 44);
}
</style>
