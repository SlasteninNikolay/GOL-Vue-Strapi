<script setup>
import axios from 'axios'
import { API_URL, BACKEND_URL, TOKEN } from '@/utils/constants.js'
import AppBreadcrumbs from '@/components/ui/navigation/AppBreadcrumbs.vue'
import AppSection from '@/components/ui/layout/AppSection.vue'
import {
  YandexMap as YMap,
  YandexMapDefaultSchemeLayer,
  YandexMapDefaultFeaturesLayer,
  YandexMapControls,
  YandexMapZoomControl,
  YandexMapScaleControl,
} from 'vue-yandex-maps'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import { onMounted, ref, shallowRef } from 'vue'
import ContactAccordionItem from '@/components/features/ContactAccordionItem.vue'

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
        color: '#d9d6d6',
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

const mapSettings = shallowRef({
  location: {
    center: [0, 0],
    zoom: 15,
    maxZoom: 15,
  },
  behaviors: ['drag', 'dblClickZoom', 'rightMouseButtonMagnifier', 'multiTouch'],
})


const loading = ref(false)
const error = ref('')
const infoData = ref(null)
const objectsData = ref(null)

const fetchInfo = async () => {
  loading.value = true

  try {
    const request = await axios.get(`${API_URL}/info`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })

    infoData.value = request.data.data || null
    mapSettings.value.location.center = [infoData.value?.coordinates[0],  infoData.value?.coordinates[1]]

  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

const fetchObjects = async () => {
  loading.value = true
  try {
    // Получаем объекты
    const requestObjects = await axios.get(`${API_URL}/objects`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })
    objectsData.value = requestObjects.data.data
  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}


onMounted(async () => {
  await fetchInfo()
  await fetchObjects()
})
</script>

<template>
  <div class="content__inner">
    <AppBreadcrumbs />
    <AppSection class="contacts-section" mode="gray" title="Контакты" title-tag="h1" v-appear>
      <BaseGrid class="contacts-section__grid" columns="2">
        <div class="contacts-section__col">
          <ul class="contacts-section__list">
            <li class="contacts-section__list-item">
              <h2 class="contacts-section__title h3">{{ infoData?.title }}</h2>
            </li>
            <li class="contacts-section__list-item">{{ infoData?.adress }}</li>
            <li class="contacts-section__list-item">
              <ul>
                <li class="contacts-section__list-subitem">
                  <a :href="`tel:${infoData?.phone}`">{{ infoData?.phone }}</a>
                </li>
                <li class="contacts-section__list-subitem">
                  <a :href="`mailto:${infoData?.email}`">{{ infoData?.email }}</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="contacts-section__col">
          <YMap class="contacts-section__map" v-if="!loading" :settings="mapSettings" width="100%" height="430px">
            <YandexMapDefaultSchemeLayer :settings="{ customization }" />
            <YandexMapDefaultFeaturesLayer />
            <yandex-map-controls :settings="{ position: 'right' }">
              <yandex-map-zoom-control />
            </yandex-map-controls>
            <yandex-map-controls :settings="{ position: 'bottom' }">
              <yandex-map-scale-control />
            </yandex-map-controls>
          </YMap>
        </div>
      </BaseGrid>
    </AppSection>
    <AppSection class="hotels-section" title="Контакты отелей" title-tag="h2" v-appear>
      <BaseGrid columns="2">
        <ContactAccordionItem
          v-for="object in objectsData"
          :key="object.id"
          :title="object?.title"
          :pretitle="object?.type"
          :adress="object?.adress"
          :phone="object?.phone"
          :email="object?.email"
          :website="object?.website"
        />
      </BaseGrid>
    </AppSection>
  </div>
</template>

<style scoped lang="scss">

.hotels-section {
  :deep(.grid) {
    gap: 40px;
  }
}

.content__inner {
  position: relative;

  &:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    max-width: 280px;
    height: 100%;
    background: url('/images/pattern-blue.svg') no-repeat;
    background-size: contain;
    pointer-events: none;
    z-index: -1;

    @include tablet {
      left: initial;
      right: 0;
      transform: scaleX(-1);
    }
  }
}
.contacts-section {

  @include tablet {
    :deep(.section__content) {
      padding-inline: 0;
      padding-bottom: fluid-to-laptop(60 , 40);
      background: transparent;
    }
  }

  &__title {
    font-weight: 500;
    text-transform:  uppercase;
  }

  &__grid {

    @include tablet {
      gap: 40px;
    }
  }

  &__logo {
    width: 100%;
    max-width: 240px;
  }

  &__list {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: fluid-to-laptop(40, 10);

    @include tablet {
      max-width: 100%;
      background: var(--gray-gradient);
    }

    &-item {
      @include fluid-text(14, 12);
    }

    ul {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    &-subitem,
    ul {
      padding: 0;
      margin: 0;
      list-style: none;
      @include fluid-text(16, 12);
      font-weight: 500;
    }
  }

  &__map {
    width: 100%;
    max-height: 248px;
    border: 1px solid var(--color-primary);
  }
}


</style>
