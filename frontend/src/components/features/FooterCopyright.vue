<script setup>
const currentDate = new Date();
const currentYear = currentDate.getFullYear();
</script>

<template>
<div class="footer-copyright">
  <span>{{currentYear}}, LEGENDA</span>
</div>
</template>

<style scoped lang="scss">
.footer-copyright {
  padding-top: fluid-to-laptop(40, 20);
  border-top: 1px solid var(--white-opacity-30);
  color: var(--white-opacity-30);
}
</style>
