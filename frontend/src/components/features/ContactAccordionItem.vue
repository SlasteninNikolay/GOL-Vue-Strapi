<script setup>
import { ref } from 'vue'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'

defineProps({
  title: {
    type: String,
    default: '',
  },
  pretitle: {
    type: String,
    default: '',
  },
  adress: {
    type: String,
    default: '',
  },
  phone: {
    type: String,
    default: '',
  },
  email: {
    type: String,
    default: '',
  },
  website: {
    type: String,
    default: '',
  }
})

const show = ref(false)

const toggle = () => {
  show.value = !show.value
}
</script>
<template>
  <div @click="toggle" class="accordion-item">

    <h3 class="accordion-item__head h4" :class="{ 'accordion-item__head--active': show }">
      <span>{{ pretitle }}</span>
      {{ title }}
      <BaseIcon class="tick" name="tick" color="#5a5a5a" />
    </h3>
    <transition name="slide">
      <BaseGrid columns="1">
        <div v-show="show" class="accordion-item__content">
          <ul class="accordion-item__list">
            <li  class="accordion-item__list-item" v-if="adress">
              <BaseIcon name="location" color="#5a5a5a" />
              {{adress}}
            </li>
            <li  class="accordion-item__list-item" v-if="phone">
              <BaseIcon name="phone" color="#5a5a5a" />
              {{phone}}
            </li>
            <li  class="accordion-item__list-item" v-if="email">
              <BaseIcon name="email" color="#5a5a5a" />
              {{email}}
            </li>
            <li  class="accordion-item__list-item" v-if="website">
              <BaseIcon name="website" color="#5a5a5a" />
              {{website}}
            </li>
          </ul>
        </div>
      </BaseGrid>
    </transition>
  </div>
</template>
<style lang="scss" scoped>
.accordion-item {
  position: relative;

  &:after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 1px;
    background: var(--color-gray-95);
  }

  &__list {
    display: flex;
    flex-direction: column;
    gap: 12px;
    padding-bottom: 20px !important;

    &-item {
      display: flex;
      gap: 10px;

      :deep(.icon) {
        width: 18px;
        height: 18px;
      }
    }
  }

  &__head {
    width: 100%;
    position: relative;
    cursor: pointer;
    user-select: none;
    text-transform:  uppercase;

    span {
      position: absolute;
      left: 0;
      top: -4px;
      font-weight: 300;
      @include fluid-text(12, 10);
      color: var(--color-gray-60);
      text-transform:  capitalize;
    }


    &--active {
      .tick {
        transform: translateY(-50%) rotate(180deg);
      }
    }
  }

  &__content {
    padding-block: 0;

    ul {
      list-style-type: none;
      padding: 0;
    }
  }

}

.tick {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  right: 20px;
  width: fluid(24, 12);
  height: fluid(24, 12);
  transition-duration: var(--transition-duration);
}

.slide-enter-active,
.slide-leave-active {
  transition: height var(--transition-duration) ease;
}

.slide-enter,
.slide-leave-to {
}
</style>
