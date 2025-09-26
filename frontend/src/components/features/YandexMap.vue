<script setup>
import {
  YandexMap as YMap,
  YandexMapDefaultSchemeLayer,
  YandexMapDefaultFeaturesLayer,
  YandexMapMarker,
  YandexMapControls,
  YandexMapZoomControl,
  YandexMapScaleControl,
} from 'vue-yandex-maps'
import geoData from '@/mocks/geoData.json'
import { ref, shallowRef } from 'vue'

const mapSettings = {
  location: {
    center: geoData.features[6].geometry.coordinates,
    zoom: 6,
    maxZoom: 8,
  },
  behaviors: ['drag', 'dblClickZoom', 'rightMouseButtonMagnifier', 'multiTouch'],
}

const objects = geoData.features.map((f) => ({
  id: f.id,
  coordinates: f.geometry.coordinates,
  name: f.properties.iconCaption || '',
  description: f.properties.description || '',
}))

const openMarker = ref(null)

const customization = shallowRef([
  {
    tags: {
      any: ['water'],
    },
    elements: 'geometry',
    stylers: [
      {
        color: '#C8C8C8',
      },
    ],
  },
  {
    tags: {
      any: ['landscape', 'admin', 'land', 'transit'],
    },
    elements: 'geometry',
    stylers: [
      {
        color: '#ccc',
        opacity: 0.2,
      },
    ],
  },
  {
    tags: {
      any: ['road'],
    },
    elements: 'geometry',
    stylers: [
      {
        color: '#B7B7B7',
      },
    ],
  },
  {
    tags: {
      any: ['building'],
    },
    elements: 'geometry',
    stylers: [
      {
        color: '#E5E5E5',
      },
    ],
  },
])
</script>

<template>
  <YMap :settings="mapSettings" width="100%" height="480px">
    <YandexMapDefaultSchemeLayer :settings="{ customization }" />
    <YandexMapDefaultFeaturesLayer />
    <YandexMapMarker
      v-for="(obj, index) in objects"
      :key="obj.id"
      :settings="{
        coordinates: obj.coordinates,
        onClick: () => (openMarker = index),
        zIndex: openMarker === index ? 1 : 0,
      }"
    >
      <div class="marker">
        <div v-if="openMarker === obj.id" class="popup" @click.stop="openMarker = null">
          <button
            class="popup__close"
            @click.stop="openMarker = null"
            aria-label="Закрыть"
          ></button>
          <h6 class="popup__title">{{ obj.name }}</h6>
          <p class="popup__description">{{ obj.description }}</p>
        </div>
      </div>
    </YandexMapMarker>
    <yandex-map-controls :settings="{ position: 'right' }">
      <yandex-map-zoom-control />
    </yandex-map-controls>
    <yandex-map-controls :settings="{ position: 'bottom' }">
      <yandex-map-scale-control />
    </yandex-map-controls>
  </YMap>
</template>
<style scoped>
.marker {
  position: relative;
  width: 32px;
  height: 40px;
  background:var(--color-white) url('/images/map_logo.svg') no-repeat;
  background-size: contain;
  cursor: pointer;
  transition-duration: var(--transition-duration-longer);

  &:hover {
    transform: scale(1.05);
  }
}

.popup {
  position: absolute;
  left: 50%;
  bottom: 110%;
  transform: translateX(-50%);
  min-width: 240px;
  max-width: 340px;
  padding: 14px 24px 14px 24px;
  background: #fff;
  color: #222;
  border-radius: 12px;
  box-shadow:
    0 6px 24px rgba(0, 0, 0, 0.18),
    0 1.5px 6px rgba(0, 0, 0, 0.1);
  font-size: 15px;
  z-index: 10;
  border: 1.5px solid var(--color-primary);

  &__title {
    @include fluid-text(14,12);
    margin-bottom: 12px;
  }

  &__description {
    @include fluid-text(12,12);
  }
}

.popup__close {
  position: absolute;
  top: 10px;
  right: 10px;
  width: 20px;
  height: 20px;
  background: transparent;
  border: none;
  cursor: pointer;
  padding: 0;
  z-index: 2;
}

.popup__close::before,
.popup__close::after {
  content: '';
  position: absolute;
  left: 9px;
  top: 3px;
  width: 2px;
  height: 14px;
  background: var(--color-primary);
  border-radius: 1px;
}

.popup__close::before {
  transform: rotate(45deg);
}

.popup__close::after {
  transform: rotate(-45deg);
}

.popup__close:hover::before,
.popup__close:hover::after {
  background: var(--color-primary);
}
</style>
