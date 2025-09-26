<template>
  <header class="header">
    <div class="header__inner">
      <slot />
    </div>
  </header>
</template>
<style scoped lang="scss">
  .header {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;

    &__inner {
      display: flex;
      align-items: center;
      width: 100%;
      padding-block: 0;
    }
  }
</style>

