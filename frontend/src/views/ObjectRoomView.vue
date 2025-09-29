<script setup>
import axios from 'axios'
import { API_URL, BACKEND_URL, TOKEN } from '@/utils/constants.js'
import { computed, onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'
import AppSection from '@/components/ui/layout/AppSection.vue'
import VueEasyLightbox from 'vue-easy-lightbox'
import BaseIcon from '@/components/ui/base/BaseIcon.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import { richTextToHtml } from '@/utils/helpers.js'
import BaseButton from '@/components/ui/base/BaseButton.vue'

const route = useRoute()
const slug = route.params.roomSlug

const loading = ref(false)
const error = ref('')
const roomData = ref(null)

const visibleRef = ref(false)
const indexRef = ref(0)

const imgsRef = computed(
  () =>
    roomData.value?.photos?.map(
      (photo) => BACKEND_URL + (photo.url || photo.formats?.thumbnail?.url),
    ) || [],
)

const htmlDescription = computed(() => richTextToHtml(roomData.value?.description))

function openLightbox(index) {
  indexRef.value = index
  visibleRef.value = true
}

function onHide() {
  visibleRef.value = false
}

const fetchRoomBySlug = async (slug) => {
  loading.value = true

  try {
    const request = await axios.get(`${API_URL}/rooms?filters[slug][$eq]=${slug}&populate=*`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })

    roomData.value = request.data.data[0] || null

  } catch (e) {
    error.value = e
  } finally {
    loading.value = false
  }
}

onMounted(async () => {
  await fetchRoomBySlug(slug)
})

</script>

<template>
  <div class="content__inner">
    <AppSection class="bio-section" :title="roomData?.title" mode="gray">
        <BaseGrid class="bio-section__grid" columns="2">
          <div class="bio-section__col">
            <div class="bio-section__content" v-html="htmlDescription"></div>
            <div class="bio-section__buttons">
              <BaseButton :href="roomData?.booking_link" label="Забронировать" />
            </div>
          </div>
          <div class="bio-section__col">
            <div v-if="roomData?.photos" class="bio-section__gallery">
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
              v-for="(img, index) in roomData.photos.slice(0, 3)"
              :key="index"
              style="cursor: pointer"
              @click="openLightbox(index)"
            >
              <div class="bio-section__gallery-item-overlay">
                <BaseIcon name="zoom" color="#FFF" />
                <div v-if="imgsRef.length >= 3">+{{ Math.abs(imgsRef.length - 3) }} фото</div>
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
  </div>
</template>

<style scoped lang="scss">
.bio-section {
  :deep(.section__content) {
    padding-inline: fluid-to-laptop(80, 0);

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
    width: 100%;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    gap: 12px;

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
    grid-template-rows:  repeat(2, 1fr);
    gap: 14px;

    &-item {
      max-height: 195px;

      &-overlay {
        display: none;
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
      }

      &:nth-child(1) {
        grid-column-start: 1;
        grid-column-end: -1;
      }

      &:last-child {
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
</style>
