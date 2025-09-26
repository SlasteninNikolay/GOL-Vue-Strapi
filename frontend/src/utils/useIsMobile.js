import { ref, onMounted, onUnmounted } from 'vue'
import { isMobile as checkIsMobile } from '@/utils/helpers.js'

export function useIsMobile() {
  const isMobile = ref(false)

  const handleResize = () => {
    isMobile.value = checkIsMobile()
  }

  onMounted(() => {
    window.addEventListener('resize', handleResize)
    handleResize()
  })

  onUnmounted(() => {
    window.removeEventListener('resize', handleResize)
  })

  return isMobile
}
