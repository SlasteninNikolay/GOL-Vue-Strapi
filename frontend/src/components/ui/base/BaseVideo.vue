<script setup>
import { ref } from 'vue'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import { BACKEND_URL } from '@/utils/constants.js'

defineProps({
  src: { type: String, default: ''},
  poster: { type: Object, default: null },
})

const video = ref(null)
const isPlaying = ref(false)

function togglePlay(e) {
  e?.stopPropagation?.()
  if (!video.value) return
  if (!isPlaying.value) {
    isPlaying.value = true
    video.value.play()
  } else {
    video.value.pause()
    isPlaying.value = false
  }
}
</script>

<template>
  <div class="custom-video">
    <video
      v-show="isPlaying"
      ref="video"
      :src="src"
      @click="togglePlay"
      @play="isPlaying = true"
      @pause="isPlaying = false"
      class="custom-video__element"
    />
    <button v-if="src" class="custom-video__play-btn" @click="togglePlay">
      <BaseIcon class="play" v-if="!isPlaying" name="play" color="#fff" />
      <BaseIcon class="pause" v-else name="pause" color="#fff" />
    </button>

    <picture v-if="poster && !isPlaying">
      <source
        v-if="poster.url"
        :srcset="BACKEND_URL + poster.url"
        media="(min-width: 1600px)"
      />
      <source
        v-if="poster.formats?.large"
        :srcset="BACKEND_URL + poster.formats.large.url"
        media="(min-width: 1400px)"
      />
      <source
        v-if="poster.formats?.medium"
        :srcset="BACKEND_URL + poster.formats.medium.url"
        media="(min-width: 992px)"
      />
      <source
        v-if="poster.formats?.small"
        :srcset="BACKEND_URL + poster.formats.small.url"
        media="(min-width: 375px)"
      />
      <img
        class="custom-video__poster"
        :src="BACKEND_URL + (poster.formats?.thumbnail?.url || poster.url)"
        :alt="poster?.alternativeText || 'Постер'"
        loading="lazy"
      />
    </picture>
  </div>
</template>

<style scoped lang="scss">
.custom-video {
  position: relative;
  display: inline-block;
  width: 100%;
  height: 100%;
  max-height: 560px;
  object-fit: cover;
  aspect-ratio: 16 / 9;

  &__element {
    width: 100%;
    display: block;
    cursor: pointer;
    height: 100%;
    object-fit: cover;
  }

  &__play-btn {
    width: fluid(64, 44);
    height: fluid(64, 44);
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    background: var(--white-opacity-30);
    border: none;
    border-radius: 50%;
    cursor: pointer;
    z-index: 2;
    transition-duration: var(--transition-duration-longer);

    @include hover(true) {
      transform: translate(-50%, -50%) scale(1.1);
    }

    .play,
    .pause {
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      width: fluid(24, 16);
      height: fluid(24, 16);
    }

    .play {
      padding-left: 4px;
    }
  }

  &__poster {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: 1;
  }
}
</style>
