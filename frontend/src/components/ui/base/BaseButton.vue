<script>
import BaseIcon from '@/components/ui/base/BaseIcon.vue'

export default {
  components: { BaseIcon },
  props: {
    tag: {
      type: String,
      default: 'a',
    },
    href: {
      type: String,
      required: false,
    },
    mode: {
      type: String,
      default: '',
    },
    iconName: {
      type: String,
      default: null,
    },
    iconColor: {
      type: String,
      default: '',
    },
    iconPosition: {
      type: String,
      default: 'after',
    },
    iconSize: {
      type: String,
      default: 'medium',
    },
    label: {
      type: String,
      default: '',
    },

  },
  computed: {
    computedTag() {
      if (this.isButton) return 'button'
      if (this.isRouterLink) return 'router-link'
      return this.tag
    },
    isRouterLink() {
      return this.tag === 'router-link'
    },
    isExternalLink() {
      return this.tag === 'a'
    },
    isButton() {
      return this.tag === 'button'
    },
    linkAttributes() {
      if (this.isExternalLink) {
        return { target: '_blank', rel: 'noindex noopener noreferrer' }
      }
      if (this.isButton) {
        return { type: 'button' }
      }
      return {}
    },
  },
  methods: {
    handleClick(event) {
      if (this.isButton) {
        this.$emit('click', event)
      }
    },
  },
}
</script>

<template>
  <component
    :is="computedTag"
    :href="isExternalLink ? href : null"
    :to="isRouterLink ? href : null"
    :class="['button', mode && `button--${mode}`]"
    v-bind="linkAttributes"
    @click="handleClick"
  >
    <span v-if="iconName && iconPosition === 'before'">
      <BaseIcon :name="iconName" :color="iconColor" :class="`icon--${iconSize}`" />
    </span>
    {{ label }}
    <span v-if="iconName && iconPosition === 'after'">
      <BaseIcon :name="iconName" :color="iconColor" :class="`icon--${iconSize}`" />
    </span>
  </component>
</template>

<style scoped lang="scss">
.button {
  @include fluid-text(16, 14);

  padding: fluid(18, 14) fluid(32, 24);
  width: 100%;
  max-width: 320px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: fluid(12, 5);
  line-height: 1;
  color: var(--color-white);
  border: none;
  background-color: var(--color-primary);
  cursor: pointer;
  text-align: center;

  @include mobile() {
    max-width: 100%;
  }

  @include hover(true) {
    background-color: var(--color-primary-50);

    .icon {
      transform: scale(1.2);
    }
  }

  .icon {
    display: flex;
    transition-duration: var(--transition-duration-longer);

    &--tiny {
      @include square(10px);
    }

    &--small {
      @include square(14px);
    }

    &--medium {
      @include square(26px);
    }

    &--large {
      @include square(34px);
    }
  }

  &--square {
    aspect-ratio: 1 / 1;

    .icon {
      @include square(30px);
    }
  }

  &--transparent {
    padding: 0;
    background-color: transparent;
    color: currentColor;
    line-height: 1;

    &:hover {
      background-color: transparent;
    }
  }

  &--outlined {
    background-color: transparent !important;
    border: 0.75px solid var(--color-primary);
    color: var(--color-primary);
    line-height: 1;
    padding: 12px 10px;

    @include hover(true) {
      background-color: transparent;
    }
  }

  &--abs {
    display: block;
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
    z-index: 2;
    background-color: transparent;
    border: none;
    cursor: pointer;

    @include hover(true) {
      background-color: transparent;
    }
  }
}
</style>
