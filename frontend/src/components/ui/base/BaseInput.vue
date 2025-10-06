<script setup>
import { computed } from 'vue'

const props = defineProps({
  modelValue: {
    type: [String, Number],
    required: true,
  },
  type: {
    type: String,
    default: 'text',
    validator: (value) => {
      return ['text', 'email', 'number'].includes(value)
    }
  },
  name: {
    type: String,
    required: true,
  },
  placeholder: {
    type: String,
    default: '',
  },
  errorText: {
    type: String,
    default: '',
  },
  required: {
    type: Boolean,
    default: false,
  },
})

defineEmits(['update:modelValue'])

const showError = computed(() => {
  return !props.modelValue && !!props.errorText
})
</script>

<template>
  <div class="input-group">
    <input
      class="input-group__control"
      :class="{ 'input-group__control--error': showError }"
      :type="props.type"
      :value="modelValue"
      :name="props.name"
      :placeholder="props.placeholder"
      :required="props.required"
      @input="$emit('update:modelValue', $event.target.value)"
    />
    <span
      v-if="showError"
      class="input-group__text"
      :class="{ 'text-field__input--error': showError }"
      >{{ errorText }}</span
    >
  </div>
</template>
