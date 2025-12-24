<script setup>
import BaseButton from '@/components/ui/base/BaseButton.vue'
import BaseGrid from '@/components/ui/base/BaseGrid.vue'
import { ref, onMounted } from 'vue'
import { gsap } from 'gsap'
import { useRouter } from 'vue-router'

const router = useRouter()
const svgRef = ref(null)

const categories = [
  {
    id: 1,
    categoryId: 5,
    title: 'Отели 3*',
    slug: 'hotels-3',
    link: '/objects?category=5',
    icon: "hotels-3",
    x: 430,
    y: 80
  },
  {
    id: 2,
    categoryId: 6,
    title: 'Отели 4*',
    slug: 'hotels-4',
    link: '/objects?category=6',
    icon: "hotels-4",
    x: 930,
    y: 80
  },
  {
    id: 3,
    categoryId: 8,
    title: 'Рестораны',
    slug: 'restaurants',
    link: '/objects?category=8',
    icon: "restaurants",
    x: 1410,
    y: 80
  },
  // Нижние категории
  {
    id: 4,
    categoryId: 21,
    title: 'Горнолыжные курорты',
    slug: 'ski',
    link: '/objects?category=21',
    icon: "ski",
    x: 360,
    y: 385
  },
  {
    id: 5,
    categoryId: 22,
    title: 'Санатории',
    slug: 'sanatorium',
    link: '/objects?category=22',
    icon: "sanatorium",
    x: 910,
    y: 385
  },
  {
    id: 6,
    categoryId: 23,
    title: 'Другое',
    slug: 'other',
    link: '/objects?category=23',
    icon: "others",
    x: 1420,
    y: 385
  }
  ]

const navigateToCategory = (category) => {
  router.push({
    path: '/objects',
    query: {
      category: category.categoryId
    }
  })
}

onMounted(() => {
  const paths = svgRef.value.querySelectorAll('path')

  paths.forEach(path => {
    gsap.fromTo(path,
      {
        strokeDasharray: path.getTotalLength(),
        strokeDashoffset: path.getTotalLength()
      },
      {
        strokeDashoffset: 0,
        duration: 2,
        ease: 'power1.inOut'
      }
    )
  })
})
</script>

<template>
  <section class="object-map-section section" id="object-map-section" v-appear>
    <div class="container">
      <h2 class="section__header h2">Объекты группы Legenda</h2>
    </div>
    <div class="section__content">
      <div class="object-categories">
        <div class="container">
          <svg
            ref="svgRef"
            :style="{ color: '#fff' }"
            viewBox="0 0 1908 454"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path d="M960 351.903L960 280.903" stroke="white" stroke-width="3"/>
            <rect x="845.5" y="353.403" width="230.301" height="51" stroke="white" stroke-width="3"/>
            <rect x="1295.39" y="353.403" width="314.686" height="51" stroke="white" stroke-width="3"/>
            <rect x="310.5" y="353.403" width="314.686" height="51" stroke="white" stroke-width="3"/>
            <path d="M626.994 376.903C830.326 376.903 830.702 376.903 830.702 291.812" stroke="white" stroke-width="3"/>
            <path d="M1294.27 376.903C1090.94 376.903 1090.56 376.903 1090.56 291.812" stroke="white" stroke-width="3"/>
            <path d="M960 102L960 173" stroke="white" stroke-width="3"/>
            <rect x="845.5" y="49.5" width="230.301" height="51" stroke="white" stroke-width="3"/>
            <rect x="1295.39" y="49.5" width="314.686" height="51" stroke="white" stroke-width="3"/>
            <rect x="310.5" y="49.5" width="314.686" height="51" stroke="white" stroke-width="3"/>
            <path d="M626.994 77C830.326 77 830.702 77 830.702 162.091" stroke="white" stroke-width="3"/>
            <path d="M1294.27 77C1090.94 77 1090.56 77 1090.56 162.091" stroke="white" stroke-width="3"/>
            <path d="M785.646 250V205.2H790.382V245.904H815.47V250H785.646ZM831.398 225.232H855.078V229.264H831.398V225.232ZM831.91 245.904H858.854V250H827.174V205.2H857.894V209.296H831.91V245.904ZM893.349 250.384C889.936 250.384 886.779 249.829 883.877 248.72C881.019 247.568 878.523 245.968 876.389 243.92C874.299 241.872 872.656 239.461 871.461 236.688C870.309 233.915 869.733 230.885 869.733 227.6C869.733 224.315 870.309 221.285 871.461 218.512C872.656 215.739 874.32 213.328 876.453 211.28C878.587 209.232 881.083 207.653 883.941 206.544C886.843 205.392 890 204.816 893.413 204.816C896.827 204.816 899.941 205.349 902.757 206.416C905.616 207.483 908.048 209.104 910.053 211.28L907.109 214.288C905.232 212.411 903.163 211.067 900.901 210.256C898.64 209.445 896.208 209.04 893.605 209.04C890.832 209.04 888.272 209.509 885.925 210.448C883.621 211.344 881.595 212.645 879.845 214.352C878.139 216.016 876.795 217.979 875.813 220.24C874.875 222.459 874.405 224.912 874.405 227.6C874.405 230.245 874.875 232.699 875.813 234.96C876.795 237.221 878.139 239.205 879.845 240.912C881.595 242.576 883.621 243.877 885.925 244.816C888.272 245.712 890.811 246.16 893.541 246.16C896.101 246.16 898.512 245.776 900.773 245.008C903.077 244.24 905.189 242.939 907.109 241.104L909.797 244.688C907.664 246.565 905.168 247.995 902.309 248.976C899.451 249.915 896.464 250.384 893.349 250.384ZM905.253 244.112V227.6H909.797V244.688L905.253 244.112ZM931.265 225.232H954.945V229.264H931.265V225.232ZM931.777 245.904H958.721V250H927.041V205.2H957.761V209.296H931.777V245.904ZM973.694 250V205.2H977.598L1008.51 244.112H1006.46V205.2H1011.13V250H1007.23L976.382 211.088H978.43V250H973.694ZM1029.6 250V205.2H1047.84C1052.62 205.2 1056.8 206.16 1060.38 208.08C1064.01 209.957 1066.82 212.581 1068.83 215.952C1070.83 219.323 1071.84 223.205 1071.84 227.6C1071.84 231.995 1070.83 235.877 1068.83 239.248C1066.82 242.619 1064.01 245.264 1060.38 247.184C1056.8 249.061 1052.62 250 1047.84 250H1029.6ZM1034.33 245.904H1047.58C1051.55 245.904 1054.98 245.136 1057.88 243.6C1060.83 242.021 1063.11 239.867 1064.73 237.136C1066.35 234.363 1067.16 231.184 1067.16 227.6C1067.16 223.973 1066.35 220.795 1064.73 218.064C1063.11 215.333 1060.83 213.2 1057.88 211.664C1054.98 210.085 1051.55 209.296 1047.58 209.296H1034.33V245.904ZM1078.52 250L1099 205.2H1103.67L1124.15 250H1119.16L1100.34 207.952H1102.26L1083.45 250H1078.52ZM1086.58 238.032L1087.99 234.192H1114.04L1115.45 238.032H1086.58Z" fill="white"/>
            <line x1="758.267" y1="227.5" x2="0.000549273" y2="227.5" stroke="white"/>
            <line x1="1907.09" y1="227.5" x2="1140.68" y2="227.5" stroke="white"/>
            <text
              v-for="(category) in categories"
              :key="category.slug"
              :x="category.x"
              :y="category.y"
              fontSize="18"
              fontWeight="500"
              fill="white"
              textAnchor="middle"
              dominantBaseline="middle"
              @click="navigateToCategory(category)"
              style="cursor: pointer;"
            >
              {{ category.title }}
            </text>
          </svg>
        </div>
      </div>
      <div class="object-categories-mobile container">
        <ul class="object-categories-mobile__list">
          <BaseGrid class="object-categories-mobile__grid" columns="2">
            <li
              v-for="category in categories"
              :key="category.id"
              class="object-categories-mobile__item"
            >
              <BaseButton
                tag="router-link"
                class="object-categories-mobile__link h4"
                :href="category?.link"
                :label="category?.title"
                icon-color="#FFF"
                :icon-name="category?.icon"
                icon-position="before"
              />
            </li>
          </BaseGrid>
        </ul>
      </div>
    </div>
  </section>
</template>

<style scoped lang="scss">
text {
  text-transform: uppercase;
}
.section {
  padding-block: var(--section-padding-y);
  background-color: var(--color-primary);

  &__header {
    max-width: 75%;
    text-transform: uppercase;
    color: var(--color-white);

    @include tablet() {
      max-width: 100%;
    }
  }

  &__content {
    padding-top: var(--container-padding-y);

    &--gray {
      padding-inline: fluid(110, 25);
      background: var(--gray-gradient);
    }
  }
}

.object-categories {
  @include tablet() {
    display: none;
  }

  &-mobile {

    @include tablet-above() {
      display: none;
    }

    &__grid {
      @include tablet() {
        grid-template-columns: repeat(3, 1fr);
      }

      @include mobile() {
        grid-template-columns: repeat(2, 1fr);
      }
    }

    &__link {
      display: flex;
      flex-direction: column;
      @include flex-center;

      text-align: center;
      color: var(--white-opacity-80);
      font-weight: 300;
    }
  }
}

svg text {
  transition: fill 0.3s ease;
}

svg text:hover {
  fill: rgba(255, 255, 255, 0.7);
  cursor: pointer;
}
</style>
