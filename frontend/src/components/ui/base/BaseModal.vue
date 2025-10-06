<script setup>
import BaseButton from "@/components/ui/base/BaseButton.vue";

const props = defineProps({
  show: Boolean,
  // '' - modal, 'notification'
  mode: '',
})
</script>

<template>
  <Transition :name="mode === 'notification' ? 'cookie-popup' : 'modal' ">
    <div v-if="show" class="modal-mask" :class="mode">
      <div class="modal-container">
        <div class="modal-header">
          <slot name="header"></slot>
          <BaseButton style="font-size: 1.4rem" mode="transparent" tag="button" @click="$emit('close')" label="&times;" aria-label="Закрыть" />
        </div>

        <div class="modal-body">
          <slot name="body"></slot>
        </div>

        <div class="modal-footer">
          <slot name="footer">
          </slot>
        </div>
      </div>
    </div>
  </Transition>
</template>

<style lang="scss" scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  transition: opacity 0.3s ease;

  &.notification {
    top: initial;
    left: initial;
    right: 2rem;
    bottom: 2rem;
    width: auto;
    height: auto;

    @include tablet {
      right: 0;
      bottom: 0;
    }
  }
}

.modal-container {
  width: 100%;
  max-width: 480px;
  margin: 0;
  padding: 1.6rem 1rem;
  background-color: #fff;
  border-radius: 2px;
  transition: all 0.3s ease;
}

.modal-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.modal-header h3 {
  margin: 0;
  color: var(--color-primary);
  text-transform: uppercase;
}

.modal-body {
  margin: 20px 0 0;
}

.modal-default-button {
  float: right;
}

.modal-enter-from {
  opacity: 0;
}

.modal-leave-to {
  opacity: 0;
}

.modal-enter-from .modal-container,
.modal-leave-to .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

.cookie-popup-enter-active,
.cookie-popup-leave-active {
  transition: opacity 0.4s cubic-bezier(0.4, 0, 0.2, 1), transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.cookie-popup-enter-from {
  opacity: 0;
  transform: translateY(60px) scale(1.05);
}

.cookie-popup-enter-to {
  opacity: 1;
  transform: translateY(0) scale(1);
}

.cookie-popup-leave-from {
  opacity: 1;
  transform: translateY(0) scale(1);
}

.cookie-popup-leave-to {
  opacity: 0;
  transform: translateY(60px) scale(1.05);
}

</style>
