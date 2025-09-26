<script setup>
import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'
import { computed, onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'
import AppSection from '@/components/ui/layout/AppSection.vue'
import { richTextToHtml } from '@/utils/helpers.js'

const route = useRoute()
const slug = route.params.slug

const loading = ref(false)
const error = ref('')
const pageData = ref(null)

const htmlPageContent = computed(() => richTextToHtml(pageData.value?.content))

const fetchPage = async (slug) => {
  loading.value = true

  try {
    const request = await axios.get(`${API_URL}/pages?filters[slug][$eq]=${slug}&populate=*`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })

    pageData.value = request.data.data[0] || null

    console.log(pageData.value)

  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

onMounted(async () => {
  await fetchPage(slug)
})

</script>

<template>
  <div class="content__inner">
    <AppSection title-tag="h1" class="bio-section" :title="pageData?.title">
      <div class="bio-section__content" v-html="htmlPageContent"></div>
    </AppSection>
  </div>
</template>

<style scoped lang="scss">
</style>
