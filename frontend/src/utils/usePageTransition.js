import { ref } from 'vue'

export const isTransitioning = ref(false)
export const loadingProgress = ref(0)

let timer

export const startTransition = () => {
  clearInterval(timer)
  isTransitioning.value = true
  loadingProgress.value = 0
  timer = setInterval(() => {
    if (loadingProgress.value < 90) {
      loadingProgress.value = Math.min(90, loadingProgress.value + 1)
    }
  }, 80)
}

export const endTransition = () => {
  clearInterval(timer)
  loadingProgress.value = 100
  setTimeout(() => {
    isTransitioning.value = false
  }, 450)
}
