<script setup>
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import BaseImage from '@/components/ui/base/BaseImage.vue'
</script>

<template>
  <AppSection class="bio-section" title="О нас" mode="gray" v-appear>
    <BaseGrid class="bio-section__row" columns="2">
      <div class="bio-section__col">
        <p>
          «Группа Отелей LEGENDA» занимает лидирующие позиции на российском туристическом рынке,
          благодаря уникальному портфолио активов и широчайшему спектру направлений деятельности.
          Под управлением компании находится впечатляющая сеть из более, чем 20 разноформатных
          объектов, включая:
        </p>
        <ul>
          <li>современные гостиничные комплексы</li>
          <li>развитую инфраструктуру для детского отдыха</li>
          <li>глэмпинги</li>
          <li>горнолыжные курорты</li>
          <li>рестораны высокой кухни</li>
          <li>бизнес-центр</li>
          <li>собственный туристический оператор</li>
        </ul>
        <p>
          Мы активно развиваем туристическую инфраструктуру в самых отдаленных регионах нашей
          великой страны, внедряя лучшие мировые стандарты гостеприимства и адаптируя их под
          уникальные особенности каждого места в любой точке России.
        </p>
      </div>
      <div class="bio-section__col">
        <figure class="bio-section__figure">
          <BaseImage
            class="bio-section__figure-image"
            src="/images/about/about-legenda.jpg"
            alt=""
          />
        </figure>
      </div>
    </BaseGrid>
  </AppSection>
</template>

<style scoped lang="scss">

</style>
