<script setup lang="ts">
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
</script>

<template>
<div class="footer-menu">
  <BaseGrid class="footer-menu__grid" columns="4">
    <div class="footer-menu__item">
      <h4 class="footer-menu__item-title h4">
        <a href="tel:+74952527297">+7 (495) 252-72-97</a>
      </h4>
      <ul class="footer-menu__list _small">
        <li class="footer-menu__list-item">129090, Москва, ул. Щепкина, д. 3</li>
        <li class="footer-menu__list-item">ИНН 7730292782</li>
        <li class="footer-menu__list-item">ОГРН 1227700795420</li>
        <li class="footer-menu__list-item">КПП 773001001</li>
      </ul>
      <div class="footer-menu__list-item">
        <a href="mailto:info@legenda-hotels.ru">info@legenda-hotels.ru</a>
      </div>
    </div>
    <div class="footer-menu__item">
      <h4 class="footer-menu__item-title h6">
        О компании
      </h4>
      <ul class="footer-menu__list">
        <li class="footer-menu__list-item"><RouterLink class="link" to="/about">О нас</RouterLink></li>
        <li class="footer-menu__list-item"><RouterLink class="link" to="/objects">Объекты</RouterLink></li>
        <li class="footer-menu__list-item"><RouterLink class="link" to="/vacancies">Карьера</RouterLink></li>
        <li class="footer-menu__list-item"><RouterLink class="link" to="/contacts">Контакты</RouterLink></li>
      </ul>
    </div>
    <div class="footer-menu__item">
      <h4 class="footer-menu__item-title h6">
        Блог
      </h4>
      <ul class="footer-menu__list">
        <li class="footer-menu__list-item"><RouterLink class="link" to="/blog">Новости</RouterLink></li>
      </ul>
    </div>
    <div class="footer-menu__item">
      <h4 class="footer-menu__item-title h6">
        Информация
      </h4>
      <ul class="footer-menu__list">
        <li class="footer-menu__list-item"><RouterLink class="link" to="/pages/polzovatelskoe-soglashenie">Пользовательское соглашение</RouterLink></li>
        <li class="footer-menu__list-item"><RouterLink class="link" to="/loyalty-program">Программа лояльности</RouterLink></li>
        <li class="footer-menu__list-item"><RouterLink class="link" to="/pages/politika-konfidencialnosti">Политика конфиденциальности</RouterLink></li>
      </ul>
    </div>
  </BaseGrid>
</div>
</template>

<style scoped lang="scss">
  .footer-menu {
    padding-block: var(--section-padding-y);

    &__item-title {
      margin-bottom: 10px;
    }

    &__item, &__item-title {
      color: var(--color-white);
      line-height: 1;
    }

    &__item {
      display: inline-flex;
      flex-direction: column;
      gap: 16px;
      cursor: pointer;
      line-height: 1.4;

      &:first-child {
        min-width: 420px;

        @include tablet() {
          min-width: initial;
        }
      }

      &-title {
        text-transform: uppercase;
      }
    }

    &__list {
      list-style: none;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      gap: 14px;

      &._small {
        gap: 3px;
        font-size: 12px;
      }

      &-item {
        color: var(--white-opacity-60);
      }
    }
  }
</style>
