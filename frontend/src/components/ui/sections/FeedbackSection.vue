<script setup>
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import ContactForm from '@/components/ui/feedback/ContactForm.vue'
</script>

<template>
 <section class="feedback-section" v-appear>
   <div class="container">
     <BaseGrid class="feedback-section__row" columns="2" aria-labelledby="feedback-section-title">
       <div class="feedback-section__col">
         <h2 class="feedback-section__title h2" id="feedback-section-title">У вас есть<br>вопросы?</h2>
         <h3 class="feedback-section__subtitle">Пожалуйста, заполните форму обратной связи. Наши менеджеры свяжутся с вами в ближайшее время, проконсультируют и ответят на интересующие вас вопросы.</h3>
       </div>
       <div class="feedback-section__col">
         <ContactForm :params="{endpoint: 'feedback'}" />
       </div>
     </BaseGrid>
   </div>
 </section>
</template>

<style scoped lang="scss">
.feedback-section {
  padding-block: var(--section-padding-y);
  background-color: var(--color-primary);

  &__title, &__subtitle {
    padding-bottom: var(--section-padding-y);
    color: var(--color-white);
  }

  &__title {
    text-transform: uppercase;
  }

  &__subtitle {
    max-width: 320px;
    font-size: 12px;
    font-weight: 300;
    color: var(--white-opacity-60);
  }
}
</style>
