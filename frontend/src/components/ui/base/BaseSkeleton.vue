<template>
  <div class="object-card skeleton">
    <div class="skeleton-image"></div>
    <div class="skeleton-title"></div>
    <div class="skeleton-text"></div>
  </div>
</template>

<style scoped>
.skeleton-image,
.skeleton-title,
.skeleton-text {
  position: relative;
  overflow: hidden;
  background: #e0e0e0;
}

/* Размеры */
.skeleton-image {
  width: 100%;
  height: 180px;
  margin-bottom: 16px;
}
.skeleton-title {
  width: 70%;
  height: 22px;
  margin: 12px 0 8px 0;
}
.skeleton-text {
  width: 50%;
  height: 16px;
}

/* Шиммер */
.skeleton-image::after,
.skeleton-title::after,
.skeleton-text::after {
  content: '';
  position: absolute;
  inset: 0;
  transform: translateX(-100%);
  background: linear-gradient(
    90deg,
    rgba(255, 255, 255, 0) 0%,
    rgba(255, 255, 255, 0.6) 50%,
    rgba(255, 255, 255, 0) 100%
  );
  animation: shimmer 1.2s linear infinite;
  pointer-events: none;
}

/* Анимация */
@keyframes shimmer {
  100% {
    transform: translateX(100%);
  }
}

/* Без «мигания» */
.skeleton {
  /* оставлено пустым намеренно */
}

/* Доступность */
@media (prefers-reduced-motion: reduce) {
  .skeleton-image::after,
  .skeleton-title::after,
  .skeleton-text::after {
    animation: none;
  }
}
</style>
