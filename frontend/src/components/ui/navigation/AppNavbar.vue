<script setup>
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
import AppBurgerButton from '@/components/ui/navigation/AppBurgerButton.vue'
import { onMounted, onUnmounted, ref, useTemplateRef } from 'vue'
import AppMenu from '@/components/ui/navigation/AppMenu.vue'
import { useIsMobile } from '@/utils/useIsMobile.js'

onMounted(() => {
  window.addEventListener('scroll', handleNavbarOnScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleNavbarOnScroll)
})

const isMobile = useIsMobile()

const isMenuActive = ref(false)
let navbarElement = useTemplateRef('navbar')

const menuToggle = (active) => {
  isMenuActive.value = active

  if (isMenuActive.value) {
    document.body.classList.add('menu-is-open')
    setTimeout(() => {
      document.body.classList.add('navbar-is-shown')
    }, 500)
  } else {
    document.body.classList.remove('menu-is-open')
    setTimeout(() => {
      document.body.classList.remove('navbar-is-shown')
    }, 500)
  }
}

const handleNavbarOnScroll = () => {
  const viewportHeight = window.innerHeight
  let navbarHeight = navbarElement.value.clientHeight

  if (window.scrollY > navbarHeight) {
    document.body.classList.add('navbar-is-hidden')
  } else {
    document.body.classList.remove('navbar-is-hidden')
  }

  if (window.scrollY > viewportHeight) {
    document.body.classList.add('navbar-is-fixed')
  } else {
    document.body.classList.remove('navbar-is-fixed')
  }
}
</script>

<template>
  <div class="navbar" ref="navbar">
    <AppBurgerButton :active="isMenuActive" @update:active="menuToggle" />
    <div class="container">
      <nav class="navbar__menu">
        <RouterLink v-if="!isMobile" class="navbar__menu-link link" to="/" @click="menuToggle(false)">Главная</RouterLink>
        <RouterLink v-if="!isMobile" class="navbar__menu-link link" to="/objects" @click="menuToggle(false)"
          >Портфолио</RouterLink
        >
        <RouterLink class="navbar__menu-link" to="/" @click="menuToggle(false)">
          <BaseIcon class="navbar__logo" name="logo" :color="isMobile ? '#FFF' : '#244C60'" />
        </RouterLink>
        <RouterLink v-if="!isMobile" class="navbar__menu-link link" to="/vacancies" @click="menuToggle(false)"
          >Карьера</RouterLink
        >
        <RouterLink v-if="!isMobile" class="navbar__menu-link link" to="/contacts" @click="menuToggle(false)"
          >Контакты</RouterLink
        >
      </nav>
    </div>
    <RouterLink to="/objects" @click="menuToggle(false)">
      <BaseButton class="navbar__objects-button button--square" icon-name="objects" />
    </RouterLink>
  </div>
  <AppMenu :isActive="isMenuActive" @closeMenu="menuToggle(false)" />
</template>

<style scoped lang="scss">
.navbar {
  position: relative;
  width: 100%;
  height: fluid-to-laptop(80, 60);
  display: flex;
  background: var(--color-white);

  &:after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 1px;
    background-color: var(--color-gray-light);
  }

  @include tablet() {
    background: var(--color-primary);

    &:after {
      display: none;
    }
  }

  &__logo {
    width: fluid(160, 120);
    height: fluid(32, 24);
  }

  &__menu {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;

    @include tablet() {
      justify-content: center;
    }

    &-link {
      @include fluid-text(16, 12);

      font-weight: 400;
      color: var(--color-primary);
      line-height: 1;
      text-transform: uppercase;
    }
  }

  &__objects-button {
    width: fluid-to-laptop(80, 60);
    height: fluid-to-laptop(80, 60);
    display: flex;
    align-items: center;
    justify-content: center;
  }
}
</style>
