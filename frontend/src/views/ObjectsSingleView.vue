<script setup>
import { computed, onMounted, ref, shallowRef, watch, nextTick } from 'vue'
import { useRoute } from 'vue-router'
import { useHead } from '@vueuse/head'
import axios from 'axios'

import AppSection from '@/components/ui/layout/AppSection.vue'
import BaseButton from '@/components/ui/base/BaseButton.vue'
import BaseVideo from '@/components/ui/base/BaseVideo.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import VueEasyLightbox from 'vue-easy-lightbox'
import { API_URL, BACKEND_URL, TOKEN } from '@/utils/constants.js'
import { getDomain, richTextToHtml } from '@/utils/helpers.js'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import BaseCard from '@/components/ui/base/BaseCard.vue'

import {
  YandexMap as YMap,
  YandexMapDefaultSchemeLayer,
  YandexMapDefaultFeaturesLayer,
  YandexMapControls,
  YandexMapZoomControl,
  YandexMapScaleControl,
} from 'vue-yandex-maps'

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

const route = useRoute()
const slug = route.params.slug

const objectData = ref(null)
const featuresData = ref(null)
const roomsData = ref(null)

const loading = ref(false)
const error = ref('')
const htmlDescription = computed(() => richTextToHtml(objectData.value?.description))
const visibleRef = ref(false)
const indexRef = ref(0)
const showCount = ref(4)

const showMore = () => {
  showCount.value += 4
}


const imgsRef = computed(
  () =>
    objectData.value?.images?.map(
      (img) => BACKEND_URL + (img.url || img.formats?.thumbnail?.url),
    ) || [],
)

function openLightbox(index) {
  indexRef.value = index
  visibleRef.value = true
}

function onHide() {
  visibleRef.value = false
}

const mapSettings = shallowRef({
  location: {
    center: [0, 0],
    zoom: 15,
    maxZoom: 15,
  },
  behaviors: ['drag', 'dblClickZoom', 'rightMouseButtonMagnifier', 'multiTouch'],
})

const fetchObjectBySlug = async (slug) => {
  loading.value = true
  try {
    const objects = await axios.get(`${API_URL}/objects?filters[slug][$eq]=${slug}&populate=*`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })
    const features = await axios.get(
      `${API_URL}/objects?filters[slug][$eq]=${slug}&populate[features][populate]=icon`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      },
    )
    const rooms = await axios.get(
      `${API_URL}/rooms?filters[object][slug][$eq]=${slug}&populate=photos`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      },
    )
    objectData.value = objects.data.data[0] || null
    featuresData.value = features.data.data[0] || null
    roomsData.value = rooms.data.data || null
    mapSettings.value.location.center = [
      objectData.value?.coordinates[0],
      objectData.value?.coordinates[1],
    ]

    // Инициализируем Travelline после загрузки данных
    await nextTick()
    setTimeout(() => {
      initTravelline()
    }, 1000)
  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

// Инициализация Travelline для страницы объекта
const initTravelline = () => {
  const travellineId = objectData.value?.travelline_id

  if (!travellineId) {
    console.warn('No travelline_id found for this object')
    return
  }

  if (window.travelline && window.travelline.integration) {
    const containerId = `tl-search-form-${travellineId}`
    const element = document.getElementById(containerId)

    if (element) {
      try {
        const ti = window.travelline.integration

        // Вызываем embed напрямую
        if (typeof ti.embed === 'function') {
          ti.embed('search-form', {
            container: containerId,
            context: `TL-INT-legenda-hotels-ru_2025-10-28.${travellineId}`,
            language: 'ru'
          })

        } else {
          console.warn('embed method not found')
        }

        // Проверяем загрузку
        setTimeout(() => {
          const iframe = element.querySelector('iframe')
          if (iframe) {
            console.log('Travelline form loaded successfully!')
            element.classList.add('tl-initialized')
          } else {
            console.warn('Travelline form not loaded after 2 seconds')
          }
        }, 2000)
      } catch (error) {
        console.warn(`Ошибка инициализации Travelline:`, error)
      }
    } else if (!element) {
      console.warn(`Element ${containerId} not found in DOM`)
    } else {
      console.log(`Element ${containerId} already initialized`)
    }
  } else {
    console.warn('Travelline integration not available')
  }
}

// Используем computed для динамического обновления head
const headTitle = computed(() => {
  if (loading.value) return 'Загрузка...'
  return objectData.value?.title
    ? `${objectData.value.title} – Официальный сайт LEGENDA Hotels`
    : 'Страница не найдена – Официальный сайт LEGENDA Hotels'
})

const headMeta = computed(() => {
  if (!objectData.value) {
    return [
      { name: 'robots', content: 'noindex, nofollow' },
      { name: 'description', content: 'Страница не найдена' },
    ]
  }
  return [
    { name: 'description', content: objectData.value?.shortDescription ?? 'Объект компании LEGENDA Hotels' },
    { name: 'keywords', content: objectData.value?.keywords ?? 'LEGENDA, отели, горнолыжные курорты, туристические базы, отдых, бронирование отеля, spa' },
    { property: 'og:title', content: objectData.value?.title ?? 'Портфолио – Официальный сайт LEGENDA Hotels' },
    { property: 'og:description', content: objectData.value?.shortDescription ?? 'Объект компании LEGENDA Hotels' },
    { property: 'og:image', content: objectData.value?.images?.[0]?.url ? BACKEND_URL + objectData.value.images[0].url : '/default-image.jpg' },
    { property: 'og:type', content: 'article' },
    { property: 'og:url', content: typeof window !== 'undefined' ? window.location.href : '' },
    { property: 'og:site_name', content: 'Официальный сайт LEGENDA Hotels' },
    { name: 'twitter:card', content: 'summary_large_image' },
    { name: 'twitter:title', content: objectData.value?.title ?? 'Портфолио – Официальный сайт LEGENDA Hotels' },
    { name: 'twitter:description', content: objectData.value?.shortDescription ?? 'Объект компании LEGENDA Hotels' },
    { name: 'twitter:image', content: objectData.value?.images?.[0]?.url ? BACKEND_URL + objectData.value.images[0].url : '/default-image.jpg' },
    { name: 'author', content: objectData.value?.author ?? 'LEGENDA Hotels' },
  ]
})

useHead({
  title: headTitle,
  meta: headMeta,
  link: [
    { rel: 'icon', href: '/favicon.svg' },
  ],
})

onMounted(async () => {
  await fetchObjectBySlug(slug)
})
</script>

<template>
  <div v-if="objectData" class="content__inner">
    <AppSection class="object-section" :title="objectData?.title ?? ''" title-tag="h1">
      <div class="object-section__top-bio">
        <div>{{ objectData?.type ?? '' }}</div>
        <div>{{ objectData?.location ?? '' }}</div>
        <div>
          <BaseButton
            :href="objectData?.pdf ?? ''"
            label="Скачать презентацию"
            mode="transparent"
            icon-name="download"
            icon-size="tiny"
            icon-position="before"
          />
        </div>
      </div>
    </AppSection>
    <section class="video-section">
      <div class="container-fluid">
        <BaseVideo
          class="video-section__video"
          :src="objectData?.video_url"
          :poster="objectData?.video_poster"
        />

        <!-- Форма Travelline для объектов с travelline_id -->
        <div v-if="objectData?.travelline_id" class="video-section__booking">
          <div :id="`tl-search-form-${objectData.travelline_id}`" class="tl-container">
            <a href="https://www.travelline.ru/products/tl-hotel/" rel="nofollow" target="_blank">TravelLine</a>
          </div>
        </div>
      </div>
    </section>
    <AppSection class="bio-section _pattern" :title="objectData?.slogan">
      <BaseGrid class="bio-section__grid" columns="2">
        <div class="bio-section__col">
          <div class="bio-section__features">
            <div v-for="feature in featuresData?.features" :key="feature.id" class="feature">
              <img
                v-if="feature.icon"
                :src="BACKEND_URL + feature.icon.url"
                :alt="feature.title"
                class="feature__icon"
              />
              <span class="feature__label">{{ feature.title }}</span>
            </div>
          </div>
          <div class="bio-section__content" v-html="htmlDescription"></div>
          <div class="bio-section__buttons">
            <BaseButton v-if="objectData?.type !== 'Ресторан'" :href="`${objectData?.website}/booking`" label="Найти номер" />
            <BaseButton
              :href="objectData?.website"
              label="Сайт объекта"
              mode="transparent"
              icon-name="arrow-next"
            />
          </div>
        </div>
        <div class="bio-section__col">
          <div v-if="objectData?.images" class="bio-section__gallery">
            <teleport to="body">
              <vue-easy-lightbox
                :visible="visibleRef"
                :imgs="imgsRef"
                :index="indexRef"
                @hide="onHide"
              />
            </teleport>
            <div
              class="bio-section__gallery-item"
              v-for="(img, index) in objectData.images.slice(0, 3)"
              :key="index"
              style="cursor: pointer"
              @click="openLightbox(index)"
            >
              <div class="bio-section__gallery-item-overlay">
                <BaseIcon name="zoom" color="#FFF" />
                <div v-if="imgsRef.length > 3">+{{ imgsRef.length - 3 }} фото</div>
              </div>
              <picture>
                <source
                  v-if="img.url"
                  :srcset="BACKEND_URL + img.url"
                  media="(min-width: 1200px)"
                />
                <source
                  v-if="img.formats?.large"
                  :srcset="BACKEND_URL + img.formats.large.url"
                  media="(min-width: 992px)"
                />
                <source
                  v-if="img.formats?.medium"
                  :srcset="BACKEND_URL + img.formats.medium.url"
                  media="(min-width: 768px)"
                />
                <source
                  v-if="img.formats?.small"
                  :srcset="BACKEND_URL + img.formats.small.url"
                  media="(min-width: 375px)"
                />
                <img
                  class="object-card__image"
                  :src="BACKEND_URL + (img.formats?.thumbnail?.url || img.url)"
                  :alt="img.alternativeText"
                  loading="lazy"
                />
              </picture>
            </div>
          </div>
        </div>
      </BaseGrid>
    </AppSection>
    <AppSection
      class="rooms-section"
      v-if="roomsData?.length"
      title-color="#FFF"
      title-tag="h2"
      title="Варианты размещения"
    >
      <BaseGrid columns="4">
        <BaseCard
          class="rooms-section__card"
          v-for="room in roomsData.slice(0, showCount)"
          :key="room.id"
          :img="room?.photos[0]"
          :title="room?.title"
          :slug="`/objects/${slug}/rooms/${room.slug}`"
        />
      </BaseGrid>
      <BaseButton
        class="more-button"
        @click="showMore"
        v-if="roomsData?.length > showCount && !loading"
        label="Показать еще"
        icon-color="#FFF"
        icon-name="arrow-down"
        icon-size="small"
        :disabled="loading"
        mode="transparent"
      />
    </AppSection>
    <AppSection class="contacts-section" :title="`Контакты - ${objectData?.title}`" mode="gray">
      <BaseGrid class="contacts-section__grid" columns="2">
        <div class="contacts-section__col">
          <ul class="contacts-section__list">
            <li class="contacts-section__list-item">
              <img
                class="contacts-section__logo"
                :src="BACKEND_URL + objectData?.logo.url"
                :alt="objectData?.title"
              />
            </li>
            <li class="contacts-section__list-item">{{ objectData?.adress }}</li>
            <li class="contacts-section__list-item">
              <ul>
                <li class="contacts-section__list-subitem">
                  <a :href="`tel:${objectData?.phone}`">{{ objectData?.phone }}</a>
                </li>
                <li class="contacts-section__list-subitem">
                  <a :href="`mailto:${objectData?.email}`">{{ objectData?.email }}</a>
                </li>
                <li class="contacts-section__list-subitem">
                  <a target="_blank" rel="noopener noreferrer" :href="objectData?.website">{{
                    getDomain(objectData?.website)
                  }}</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="contacts-section__col">
          <YMap
            class="contacts-section__map"
            v-if="!loading"
            :settings="mapSettings"
            width="100%"
            height="430px"
          >
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
  </div>
</template>

<style scoped lang="scss">
#block-search,
#block-search * {
  box-sizing: border-box;
}

.tl-container {
  padding: 0 30px;
}

:deep(.section__header) {
  position: relative;

  &:after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: -0.75rem;
    width: calc(100% + 0.75rem);
    height: 100%;
    background-color: var(--gray-gradient);
    z-index: -1;
  }
}

.video-section {
  position: relative;

  &__booking {
    position: absolute;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    width: 90%;
    max-width: 1200px;
    z-index: 10;

    @include tablet {
      position: relative;
      bottom: auto;
      left: auto;
      transform: none;
      width: 100%;
      margin-top: 20px;
    }
  }
}

.object-section {
  padding-top: 0;

  :deep(.section__content),
  :deep(.section__top) {
    padding-block: 0;
    padding-bottom: 12px;
  }

  &__top-bio {
    width: 100%;
    position: relative;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    align-items: center;
    @include fluid-text(12, 8);
    text-transform: uppercase;

    @include mobile {
      display: flex;
      justify-content: space-between;
    }

    a {
      font-size: inherit;
    }

    div:nth-child(1) {
      justify-self: start;
    }

    div:nth-child(2) {
      justify-self: center;
    }

    div:nth-child(3) {
      justify-self: end;
    }
  }
}

.bio-section {
  :deep(.section__content) {
    padding-inline: fluid-to-laptop(80, 0);
  }

  :deep(.section__content) {
    background: var(--gray-gradient);

    @include tablet {
      background: transparent;
    }
  }

  &__content {
    :deep(ul) {
      padding: 0;
      display: flex;
      flex-wrap: wrap;
      gap: 7px;
    }

   :deep(ul > li) {
     flex-shrink: 0;
     padding: 2px 6px;
     list-style: none;
     background: var(--primary-opacity-10);
     border-radius: 1rem;

   }
  }

  &__grid {
    gap: fluid-to-laptop(120, 40);
  }

  &__col {
    display: flex;
    flex-direction: column;
    gap: 30px;
  }

  &__buttons {
    display: flex;
    align-items: center;
    gap: 20px;
  }

  &__features {
    position: relative;
    padding-block: var(--content-padding-y);
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    align-items: center;
    column-gap: 12px;

    &:after,
    &:before {
      content: '';
      position: absolute;
      left: 0;
      width: 100%;
      height: 1px;
      background: var(--color-gray);
    }

    &:after {
      top: 0;
    }

    &:before {
      bottom: 0;
    }
  }

  &__gallery {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: repeat(2, 1fr);
    gap: 14px;

    &-item {
      max-height: 195px;
      height: 100%;
      overflow: hidden;

      &-overlay {
        display: none;
        z-index: 2;
      }

      @include tablet() {
        max-height: 220px;
      }

      @include mobile() {
        max-height: 190px;
      }

      img {
        width: 100%;
        height: 100%;
        display: block;
        object-fit: cover;
        transform-origin: left bottom;
        transition: transform var(--transition-duration-eternity) ease-out;
      }

      @include hover(true) {
        cursor: pointer;
        img {
          transform: scale(1.05) translate(0, 0);
        }
      }

      &:nth-child(1) {
        grid-column-start: 1;
        grid-column-end: -1;
      }

      &:nth-child(3) {
        position: relative;

        .bio-section__gallery-item-overlay {
          position: absolute;
          inset: 0;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 5px;
          width: 100%;
          height: 100%;
          background: var(--black-opacity-30);
          color: var(--color-white);

          :deep(.icon) {
            width: 18px;
            height: 18px;
          }
        }
      }
    }
  }
}

.feature {
  position: relative;
  padding-block: fluid(12, 6);
  display: flex;
  gap: 6px;

  &__icon {
    width: 18px;
    height: 18px;
  }

  &__label {
    font-size: 12px;
    text-wrap: nowrap;
  }
}

.rooms-section {
  position: relative;
  background: var(--color-primary);

  &:after {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    transform: scaleX(-1);
    width: 100%;
    max-width: 340px;
    height: 100%;
    background: url('/images/pattern-white.svg') no-repeat;
    background-size: contain;
    z-index: 1;
    pointer-events: none;
  }

  :deep(.section__header) {
    color: var(--color-gray);
  }

  &__card {
    :deep(.card__title) {
      color: var(--color-white);
    }

    :deep(.icon use) {
      color: var(--color-white) !important;
    }

    z-index: 2;
  }
}

.more-button {
  margin-top: var(--section-padding-y);
  width: 100%;
  max-width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  padding-block: 20px;
  color: var(--color-white);
}

.contacts-section {
  @include tablet {
    :deep(.section__content) {
      padding-inline-start: 0;
      padding-bottom: fluid-to-laptop(60, 40);
    }
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
    display: flex;
    flex-direction: column;
    gap: fluid-to-laptop(40, 20);
    max-width: 300px;

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
    max-height: 420px;
    border: 1px solid var(--color-primary);
  }
}
</style>
