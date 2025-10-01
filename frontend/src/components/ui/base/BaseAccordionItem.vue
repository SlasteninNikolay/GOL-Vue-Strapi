<script setup>
import { computed, ref, inject } from 'vue'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import { richTextToHtml } from '@/utils/helpers.js'

const props = defineProps({
  title: {
    type: String,
    default: '',
  },
  content: {
    type: Object
  },
  contentPosition: {
    type: String,
    default: 'right',
  },
  index: {
  type: Number,
    required: true
}
})

const { activeItemIndex, setActiveItem } = inject('accordionContext')

const show = computed(() => activeItemIndex.value === props.index)

const toggle = () => {
  setActiveItem(props.index)
}

const htmlContent = computed(() => richTextToHtml(props.content))
</script>

<template>
  <li @click="toggle" class="accordion-item">
    <h3
      class="accordion-item__head h4"
      :class="{ 'accordion-item__head--active': show }"
    >
      {{ title }}
      <BaseIcon class="tick" name="tick" color="#5a5a5a" />
    </h3>
    <div
      class="accordion-item__content-wrapper"
      :class="{ 'is-open': show }"
    >
      <BaseGrid
        v-if="contentPosition === 'right'"
        columns="2"
        class="accordion-item__content-grid"
      >
        <div></div>
        <div class="accordion-item__content" >
          <div v-html="htmlContent" />
          <slot name="modal-button"></slot>
        </div>
      </BaseGrid>
      <BaseGrid
        v-else-if="contentPosition === 'left'"
        columns="1"
        class="accordion-item__content-grid"
      >
        <div class="accordion-item__content" >
          <div v-html="htmlContent" />
          <slot class="accordion-item__modal-button" name="modal-button"></slot>
        </div>
      </BaseGrid>

    </div>
  </li>
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

  &__head {
    padding-block: fluid-to-laptop(40, 18);
    width: 100%;
    position: relative;
    cursor: pointer;
    user-select: none;

    &--active {
      .tick {
        transform: translateY(-50%) rotate(180deg);
      }
    }
  }

  &__content-wrapper {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease-out, opacity 0.3s ease-out;
    opacity: 0;
  }

  &__content-wrapper.is-open {
    max-height: 1000px; // Большое значение для плавного раскрытия
    opacity: 1;
  }

  &__content {
    padding-top: 0;
    padding-bottom: fluid(30, 10);

    :deep(.button ) {
      margin-block: fluid-to-laptop(40, 20);
    }
  }
}

.tick {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  right: 0;
  width: fluid(16, 12);
  height: fluid(16, 12);
  transition-duration: var(--transition-duration);
}
</style>
