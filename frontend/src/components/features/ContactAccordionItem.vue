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
  <div class="accordion-item">
    <h3  @click.stop="toggle" class="accordion-item__head h4" :class="{ 'accordion-item__head--active': show }">
      <span>{{ pretitle }}</span>
      {{ title }}
      <BaseIcon class="tick" name="tick" color="#5a5a5a" />
    </h3>
    <BaseGrid columns="1">
      <transition name="accordion">
      <div v-show="show" class="accordion-item__content">
        <ul class="accordion-item__list">
          <li  class="accordion-item__list-item" v-if="adress">
            <BaseIcon name="location" color="#5a5a5a" />
            {{adress}}
          </li>
          <li  class="accordion-item__list-item" v-if="phone">
            <BaseIcon name="phone" color="#5a5a5a" />
            <a :href="`tel:${phone.replace(/[\s()-]/g,'')}`">{{phone}}</a>
          </li>
          <li  class="accordion-item__list-item" v-if="email">
            <BaseIcon name="email" color="#5a5a5a" />
            <a :href="`mailto:${email}`">{{email}}</a>
          </li>
          <li  class="accordion-item__list-item" v-if="website">
            <BaseIcon name="website" color="#5a5a5a" />
            <a rel="nofollow noindex noopener" :href="website">{{website.replace(/https:\/\//g, '')}}</a>
          </li>
        </ul>
      </div>
      </transition>
    </BaseGrid>
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
    padding-block: 20px !important;

    &-item {
      display: flex;
      gap: 10px;

      :deep(.icon) {
        flex-shrink: 0;
        width: 18px;
        height: 18px;
      }
    }
  }

  &__head {
    padding-bottom: 10px;
    width: 100%;
    position: relative;
    cursor: pointer;
    user-select: none;
    text-transform:  uppercase;
    transition: var(--transition-duration-longer);

    span {
      @include fluid-text(12, 10);

      position: absolute;
      left: 0;
      top: -20px;
      font-weight: 300;

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
  width: fluid(14, 12);
  height: fluid(14, 12);
  transition-duration: var(--transition-duration-longer);
}

.accordion-enter-active, .accordion-leave-active {
  transition: max-height var(--transition-duration-eternity) cubic-bezier(0.4, 0, 0.2, 1), opacity var(--transition-duration-eternity);
  overflow: hidden;
}
.accordion-enter-from, .accordion-leave-to {
  max-height: 0;
  opacity: 0;
}
.accordion-enter-to, .accordion-leave-from {
  max-height: 500px;
  opacity: 1;
}
</style>
