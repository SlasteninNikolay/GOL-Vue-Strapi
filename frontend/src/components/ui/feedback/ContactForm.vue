<template>
  <Form ref="formRef" :validation-schema="schema" @submit="onSubmit" class="contact-form">
    <div class="contact-form__group">
      <Field name="user_name" class="contact-form__field" placeholder="Ваше имя" />
      <ErrorMessage class="contact-form__message" name="user_name" />
    </div>
    <div class="contact-form__group">
      <Field name="user_phone" v-slot="{ field, errorMessage }">
        <input class="contact-form__field" type="tel" v-imask="'{+7} (000) 000-00-00'" v-bind="field" placeholder="+7 (999) 123-45-67" />
        <span class="contact-form__message">{{errorMessage}}</span>
      </Field>
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
      <Field name="accept_terms" type="checkbox" id="accept-terms" value="true" class="contact-form__checkbox" />
      <label class="contact-form__label" for="accept-terms">Я соглашаюсь с условиями <a href="#">политики конфиденциальности</a></label>
      <ErrorMessage class="contact-form__message" name="accept_terms" />
    </div>

    <!-- Сообщение об успехе/ошибке -->
    <div v-if="message" :class="['contact-form__status', messageType]">
      {{ message }}
    </div>
  </Form>
</template>

<script setup>
import { Form, Field, ErrorMessage } from 'vee-validate';
import * as yup from 'yup';
import { ref } from 'vue';
import axios from 'axios';

const formRef = ref(null);
const loading = ref(false);
const message = ref('');
const messageType = ref('');

const schema = yup.object({
  user_name: yup.string().required('Укажите ваше имя').min(2, 'Минимум 2 символа').max(30, 'Максимум 30 символов'),
  user_phone: yup.string().required('Номер телефона обязателен').min(11, 'Номер введен не полностью'),
  accept_terms: yup.boolean()
    .oneOf([true], 'Необходимо согласиться с условиями политики конфиденциальности')
    .required('Необходимо согласиться с условиями политики конфиденциальности')
});

const onSubmit = async (values) => {
  loading.value = true;
  message.value = '';

  try {
    // Правильный формат для Strapi 4+
    const response = await axios.post(
      'http://localhost:1337/api/form-submissions',
      {
        data: {
          name: values.user_name,
          phone: values.user_phone,
          accept_terms: values.accept_terms === "true"
        }
      }
    );

    console.log('Успешный ответ:', response.data);

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

<style scoped lang="scss">
.contact-form {
  --formGap: #{fluid(40, 34)};

  display: flex;
  flex-direction: column;
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
    color: var(--color-white);
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: var(--border-width-s) solid var(--color-white);
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
  }

  &__message {
    position: absolute;
    left: 0;
    bottom: calc(var(--formGap) / 2 * -1);
    font-size: 12px;
    color: var(--color-white);
  }

  &__submit-button {
    width: 100%;
    padding: 16px;
    border: 1px solid var(--color-white);
    background-color: transparent;
    font-size: 14px;
    text-transform: uppercase;
    color: var(--color-white);
    cursor: pointer;

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }
  }

  &__label {
    font-size: 12px;
    line-height: 1.8;
    color: var(--color-white);
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
