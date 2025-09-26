<script setup>
import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
</script>

<template>
  <AppSection
    mode="gray"
    class="about-section pb"
    id="main-about-section"
    title="мы развиваем сферу гостеприимства
  и&nbsp;туризма россии"
    v-appear
  >
    <BaseGrid class="about-section__row" columns="2">
      <div class="about-section__col">
        <ul class="company-features">
          <BaseGrid columns="2">
            <li class="company-features__item">
              <span class="company-features__title h2">13</span>
              <span class="company-features__subtitle">регионов</span>
            </li>
            <li class="company-features__item">
              <span class="company-features__title h2">20</span>
              <span class="company-features__subtitle">объектов</span>
            </li>
            <li class="company-features__item">
              <span class="company-features__title h2">50</span>
              <span class="company-features__subtitle">проектов</span>
            </li>
            <li class="company-features__item">
              <span class="company-features__title h2">1500</span>
              <span class="company-features__subtitle">номеров</span>
            </li>
          </BaseGrid>
        </ul>
      </div>
      <div class="about-section__col">
        <div class="about-section__text">
          <p>
            Группа Отелей LEGENDA является ведущим российским девелопером в сфере гостеприимства и
            туризма, будучи дочерней компанией En+ Group.
          </p>
          <BaseButton
            class="about-section__more"
            icon-color="#274D60"
            mode="transparent"
            href="/about"
            label="О компании"
            icon-position="after"
            icon-name="arrow-next"
          />
        </div>
      </div>
    </BaseGrid>
  </AppSection>
</template>

<style scoped lang="scss">
.about-section {
  &__row {
    gap: fluid-to-laptop(120, 40);
  }

  &__text {
    display: flex;
    flex-direction: column;
    height: 100%;

    .button {
      margin-top: auto;
    }
  }

  &__more {
    font-weight: 500;
  }
}

.company-features {
  --item-gap: #{fluid(80, 40)};

  .grid {
    gap: var(--item-gap);

    @include tablet() {
      grid-template-columns: repeat(2, 1fr) !important;
    }
  }

  &__item {
    position: relative;
    display: flex;
    align-items: flex-end;
    gap: 7px;

    &:nth-child(1),
    &:nth-child(2) {
      &:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: calc(-1 * var(--item-gap) / 2);
        width: 100%;
        height: 1px;
        background-color: var(--color-gray);
      }
    }
  }

  &__title {
    line-height: 1;
  }

  &__subtitle {
    color: var(--color-primary);
    font-weight: 300;
    line-height: 1.2;
  }
}
</style>
