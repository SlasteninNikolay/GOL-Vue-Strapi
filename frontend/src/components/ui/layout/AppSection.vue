<script setup>
import BaseButton from '@/components/ui/base/BaseButton.vue'

defineProps({
  id: String,
  title: String,
  titleTag: {
    type: String,
    default: 'h2',
    validator: (value) => {
      return ['h1', 'h2', 'h3'].includes(value)
    },
  },
  subtitle: {
    type: String,
    default: '',
  },
  mode: {
    type: String,
    default: '',
    validator: (value) => {
      return ['', 'gray'].includes(value)
    },
  },
  container: {
    type: String,
    default: '',
    validator: (value) => {
      return ['', 'fluid'].includes(value)
    },
  },
  isSlider: {
    type: Boolean,
    default: false,
  },
  sliderArchive: {
    type: Object,
    default: ()  => {
      return {link: '', label: ''}
    },
  },
  titleColor: {
    type: String,
    default: 'var(--color-primary)',
  },
  withDivider: {
    type: String,
    default: null,
  },
})
</script>
<template>
  <section class="section" :aria-labelledby="id">
    <div :class="container === 'fluid' ? 'container-fluid' : 'container'">
      <div class="section__top" :class="{ _divider: withDivider }">
        <div class="section__top-wrapper">
          <component class="section__header" :is="titleTag" :style="{ color: titleColor }" :id="id">{{
              title
            }}</component>
          <div v-if="isSlider" class="section__slider-navigation">
            <BaseButton mode="transparent" tag="router-link" :href="sliderArchive?.link" :label="sliderArchive?.label" />
            <div class="section__slider-navigation-inner">
              <BaseButton
                tag="button"
                mode="transparent"
                class="section__slider-prev"
                icon-name="arrow-prev"
                icon-color="#244C60"
                icon-size="large"
              />
              <BaseButton
                tag="button"
                mode="transparent"
                class="section__slider-next"
                icon-name="arrow-next"
                icon-color="#244C60"
                icon-size="large"
              />
            </div>
          </div>
        </div>
        <p v-if="subtitle">{{ subtitle }}</p>
      </div>

      <div class="section__content" :class="[mode === 'gray' ? 'section__content--gray' : '']">
        <slot></slot>
      </div>
    </div>
  </section>
</template>

<style scoped lang="scss">
.section {
  padding-top: var(--section-padding-y);

  &.pb {
    padding-bottom: var(--section-padding-y);
  }

  &__top {
    margin-bottom: fluid-to-laptop(10, 4);
    display: flex;
    flex-direction: column;
    gap: var(--gap);

    &-wrapper {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    &._divider {
      position: relative;

      &:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: #{calc(fluid-to-laptop(30, 20) * -1)};
        width: 100%;
        height: 1px;
        background-color: var(--color-gray);
      }
    }
  }

  &__header {
    max-width: 75%;
    text-transform: uppercase;

    @include tablet() {
      max-width: 100%;
    }
  }

  &__slider-navigation {
    display: flex;
    flex-direction: column;

    a {
      @include fluid-text(14, 8);
      text-transform: uppercase;
    }


    &-inner {
      display: flex;
      justify-content: center;
      gap: fluid-to-laptop(12, 6);
    }
  }

  &__content {
    padding-block: var(--section-padding-y);

    &--gray {
      padding-inline: fluid-to-laptop(80, 25);
      background: var(--gray-gradient);
    }
  }
}

.no-services {
  text-align: center;
  padding: 2rem;
  color: var(--color-gray);
}
</style>
