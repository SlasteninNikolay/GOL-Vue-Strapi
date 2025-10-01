<script setup>
import { Form, Field, ErrorMessage } from 'vee-validate';
import * as yup from 'yup';
import { ref } from 'vue';
import axios from 'axios';
import {API_URL, TOKEN} from "@/utils/constants.js";

const props = defineProps({
  // 'primary', 'light', 'dark'
  theme: {
    type: String,
    default: 'primary'
  },
  params: {
    type: Object,
    default: () => ({
      hidden: null,
      withMessage: false,
      endpoint: 'feedback'
    })
  }
})

const formRef = ref(null);
const loading = ref(false);
const message = ref('');
const messageType = ref('');

const schema = yup.object({
  user_name: yup.string().required('Укажите ваше имя').min(2, 'Минимум 2 символа').max(30, 'Максимум 30 символов'),
  user_phone: yup.string().required('Номер телефона обязателен').min(11, 'Номер введен не полностью'),
  user_message: yup.string().max(3000, 'Слишком большое сообщение. Сократите текст.'),
  user_city: yup.string(),
  user_vacancy: yup.string(),
  accept_terms: yup.boolean()
    .oneOf([true], 'Необходимо согласиться с условиями политики конфиденциальности')
    .required('Необходимо согласиться с условиями политики конфиденциальности')
});

const onSubmit = async (values) => {
  loading.value = true;
  message.value = '';

  const endpoints = {
    'feedback': '/form-submissions',
    'vacancy': '/otkliki-na-vakansiis',
  }

  try {
    const response = await axios.post(
      `${API_URL}${endpoints[props.params.endpoint]}`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
        data: {
          name: values.user_name,
          phone: values.user_phone,
          message: values.user_message,
          city: values.user_city,
          vacancy: values.user_vacancy,
          accept_terms: values.accept_terms === "true"
        }
      }
    );

    if (response.data.data) {
      message.value = 'Сообщение успешно отправлено!';
      messageType.value = 'success';

      // Очищаем форму
      if (formRef.value) {
        formRef.value.resetForm();
      }
    }

  } catch (error) {
    console.error('Полная ошибка:', error);
    console.error('Статус:', error.response?.status);
    console.error('Данные ошибки:', error.response?.data);

    message.value = 'Ошибка при отправке. Попробуйте еще раз.';
    messageType.value = 'error';
  } finally {
    loading.value = false;
  }
};
</script>

<template>
  <Form ref="formRef" :validation-schema="schema" @submit="onSubmit" class="contact-form" :class="theme">
    <div class="contact-form__group">
      <Field name="user_name" class="contact-form__field" placeholder="Ваше имя" />
      <ErrorMessage name="user_name" v-slot="{ message }">
        <span :class="['contact-form__message', { showed: message }]">{{ message }}</span>
      </ErrorMessage>
    </div>
    <div class="contact-form__group">
      <Field name="user_phone" v-slot="{ field, errorMessage }">
        <input class="contact-form__field" type="tel" v-imask="'{+7} (000) 000-00-00'" v-bind="field" placeholder="+7 (999) 123-45-67" />
        <span :class="['contact-form__message', { showed: errorMessage }]">{{ errorMessage }}</span>
      </Field>
    </div>
    <div v-if="params?.withMessage" class="contact-form__group">
      <Field
        as="textarea"
        name="user_message"
        class="contact-form__field"
        placeholder="Ваше сообщение"
        rows="4"
      />
      <ErrorMessage name="user_message" v-slot="{ message }">
        <span :class="['contact-form__message', { showed: message }]">{{ message }}</span>
      </ErrorMessage>
    </div>
    <div class="contact-form__group">
      <button
        class="contact-form__submit-button"
        type="submit"
        :disabled="loading"
      >
        {{ loading ? 'Отправка...' : 'Отправить сообщение' }}
      </button>
    </div>
    <div class="contact-form__group _flex">
      <label class="contact-form__label">
        <Field name="accept_terms" type="checkbox" value="true" class="contact-form__checkbox" />
        <span>Я соглашаюсь с условиями <a href="#">политики конфиденциальности</a></span>
      </label>
      <ErrorMessage name="accept_terms" v-slot="{ message }">
        <span :class="['contact-form__message', { showed: message }]">{{ message }}</span>
      </ErrorMessage>
    </div>

    <!-- Скрытые поля -->
    <div style="display:contents" v-if="Array.isArray(params?.hidden)">
      <Field
        v-for="field in params.hidden"
        :key="field.name"
        :name="`user_${field.name}`"
        type="hidden"
        :value="field.value"
      />
    </div>

    <!-- Сообщение об успехе/ошибке -->
    <div v-if="message" :class="['contact-form__status', messageType]">
      {{ message }}
    </div>
  </Form>
</template>

<style scoped lang="scss">
.contact-form {
  --formGap: #{fluid(36, 24)};
  --theme-color: var(--color-white);
  --theme-color-light: var(--white-opacity-90);
  --theme-bg-message: var(--white-opacity-90);
  --theme-color-message: var(--color-primary);
  --theme-bg-button: transparent;
  --theme-color-button: var(--color-white);
  --theme-bg-button-hover: var(--white-opacity-30);

  &.light {
    --theme-color: var(--color-primary);
    --theme-color-light: var(--primary-opacity-90);
    --theme-bg-message: var(--primary-opacity-60);
    --theme-color-message: var(--color-white);
    --theme-bg-button: var(--color-primary);
    --theme-color-button: var(--color-white);
    --theme-bg-button-hover: var(--primary-opacity-90);
  }

  display: flex;
  flex-direction: column;
  justify-content: space-between;
  gap: var(--formGap);

  &__group {
    position: relative;

    &._flex {
      display: flex;
      align-items: flex-start;
      gap: 5px;
    }
  }

  &__field {
    width: 100%;
    padding-bottom: 16px;
    font-size: 16px;
    color: var(--theme-color);
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: var(--border-width-s) solid var(--theme-color);
    background-color: transparent;
    outline: none;
    -webkit-appearance: none;
    appearance: none;

    &:user-invalid {
      border-bottom: var(--border-width-s) solid var(--color-red-60);
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }

    &::placeholder {
      color: var(--color-gray-75);
    }
  }

  &__message {
    position: absolute;
    left: 0;
    bottom: calc(var(--formGap) * -1);
    font-size: 12px;
    color: var(--theme-color-message);
    border-radius: 8px;
    z-index: 2;

    &:after {
      content: '';
      position: absolute;
      inset: 0;
      width: 100%;
      height: 100%;
      background-color: var(--theme-bg-message);
      filter: blur(1px);
      z-index: -1;
    }

    &.showed {
      padding: 2px 4px;
    }
  }

  &__submit-button {
    width: 100%;
    padding: 16px;
    border: 1px solid var(--theme-color-button);
    background-color: var(--theme-bg-button);
    font-size: 14px;
    text-transform: uppercase;
    color: var(--theme-color-button);
    cursor: pointer;

    &:hover {
      background-color: var(--theme-bg-button-hover);
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }
  }

  &__label {
    display: inline-flex;
    gap: 5px;
    font-size: 10px;
    line-height: 1.8;
    color: var(--theme-color);

    @include  mobile {
      align-items: flex-start;
    }
  }

  &__status {
    padding: 10px;
    border-radius: 4px;
    text-align: center;

    &.success {
      background-color: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
    }

    &.error {
      background-color: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
    }
  }
}
</style>
