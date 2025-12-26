<template>
    <div ref="containerRef" class="block-search">
    </div>
</template>

<style scoped>
.block-search {
  position: absolute;
  padding-inline: var(--container-padding-x);
  left: 50%;
  transform: translateX(-50%);
  bottom: 20px;
  width: 100%;
  max-width: 1440px;
  margin: 0 auto;
}
</style>

<script setup>
import { onMounted, onUnmounted, ref } from 'vue'

const props = defineProps({
  travellineId: {
    type: String,
    required: true,
  }
})

const containerRef = ref()
const containerId = `tl-search-form-${Math.random().toString(36).substr(2, 9)}`

const initTravelLine = () => {
  console.log('🚀 Direct DOM TravelLine:', containerId);

  if (!containerRef.value) {
    setTimeout(initTravelLine, 100);
    return;
  }

  // Создаем контейнер напрямую в DOM
  const container = document.createElement('div');
  container.id = containerId;
  container.className = 'tl-container';

  // Очищаем Vue-контейнер и добавляем наш
  containerRef.value.innerHTML = '';
  containerRef.value.appendChild(container);

  // Загружаем TravelLine напрямую
  const script = document.createElement('script');
  script.textContent = `
    (function(w){
      var q=[
        ["setContext","TL-INT-legenda-hotels-ru_2025-10-28.${props.travellineId}","ru"],
        ["embed","search-form",{container:"${containerId}"}]
      ];
      var h=["ru-ibe.tlintegration.ru","ibe.travelline.ru","ibe.tlintegration.com"];
      var t=w.travelline=(w.travelline||{});
      var ti=t.integration=(t.integration||{});
      ti.__cq=ti.__cq?ti.__cq.concat(q):q;
      if(!ti.__loader){
        ti.__loader=true;
        var d=w.document,c=d.getElementsByTagName("head")[0]||d.getElementsByTagName("body")[0];
        function l(hosts){
          if(hosts.length===0)return;
          var host=hosts[0];
          var s=d.createElement("script");
          s.type="text/javascript";
          s.async=true;
          s.src="https://"+host+"/integration/loader.js";
          s.onload=function(){console.log("TravelLine loaded from "+host);};
          s.onerror=function(){l(hosts.slice(1));};
          c.appendChild(s);
        }
        l(h);
      }
    })(window);
  `;

  document.head.appendChild(script);

  // Проверяем результат
  setTimeout(() => {
    if (container.querySelector('.tl-widget')) {
      console.log('✅ TravelLine widget loaded successfully!');
    } else {
      console.log('⚠️ Checking container...');
      console.log('Container HTML:', container.innerHTML.substring(0, 300));
    }
  }, 2000);
}

const cleanup = () => {
  if (containerRef.value) {
    containerRef.value.innerHTML = '';
  }
}

onMounted(() => {
  setTimeout(initTravelLine, 300);
});

onUnmounted(() => {
  cleanup();
});
</script>
