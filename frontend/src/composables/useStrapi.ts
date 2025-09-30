import { ref } from 'vue'
import axios from 'axios'
import { TOKEN, API_URL } from '@/utils/constants'

export function useStrapi<T = any>() {
  const data = ref<T | null>(null)
  const error = ref<any>(null)
  const loading = ref(false)

  const query = async (endpoint: string) => {
    loading.value = true
    error.value = null

    try {
      const response = await axios.get(`${API_URL}/${endpoint}`, {
        headers: { Authorization: `Bearer ${TOKEN}` }
      })
      data.value = response.data.data
    } catch (err: any) {
      error.value = err?.response?.data?.message || err.message || 'Ошибка запроса'
    } finally {
      loading.value = false
    }
  }

  return {
    data,
    error,
    loading,
    query
  }
}
