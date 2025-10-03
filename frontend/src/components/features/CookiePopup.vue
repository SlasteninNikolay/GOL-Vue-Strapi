<script setup>

import BaseModal from "@/components/ui/base/BaseModal.vue";
import BaseButton from "@/components/ui/base/BaseButton.vue";
import { ref, onMounted } from 'vue'

const showModal = ref(false)

onMounted(() => {
  if (!localStorage.getItem('cookieAccepted')) {
    setTimeout(() => {
      showModal.value = true
    }, 1000)
  }
})

function acceptCookies() {
  localStorage.setItem('cookieAccepted', 'true')
  showModal.value = false
}

</script>

<template>
  <Teleport to="body">
    <BaseModal mode="notification" :show="showModal" @close="showModal = false">
      <template #body>
        <p>Мы используем файлы cookie для улучшения работы сайта. Продолжая использовать этот сайт, вы соглашаетесь с нашей политикой использования файлов cookie.</p>
      </template>
      <template #footer>
        <BaseButton @click="acceptCookies" mode="primary" label="Принять и закрыть" />
      </template>
    </BaseModal>
  </Teleport>
</template>

<style scoped lang="scss">
  :deep(.modal) {
    border: 1px var(--color-primary) solid;
  }

  :deep(.modal-header) {
    display: none;
  }

  :deep(.modal-container) {
    max-width: 320px;
    display: flex;
    flex-direction: column;
    gap: 1rem;
    border: 1px var(--color-primary) solid;
  }

  :deep(.modal-body) {
    margin: 0;
    font-size: 0.725rem;
  }

  :deep(.button) {
    @include fluid-text(12, 10);
  }
</style>
