import { gsap } from 'gsap'

export const appear = {
  mounted(el, binding) {
    // Настройки по умолчанию
    const defaultOptions = {
      duration: 1,
      delay: 0,
      from: 'bottom', // направление появления
      distance: 50,   // расстояние смещения
      opacity: 0,
      ease: 'power2.out',
      once: true      // анимировать только один раз
    }

    // Объединяем настройки по умолчанию с переданными пользователем
    const options = { ...defaultOptions, ...binding.value }

    // Определяем начальные координаты в зависимости от направления
    const getStartCoords = () => {
      switch (options.from) {
        case 'top':
          return { y: -options.distance, x: 0 }
        case 'bottom':
          return { y: options.distance, x: 0 }
        case 'left':
          return { x: -options.distance, y: 0 }
        case 'right':
          return { x: options.distance, y: 0 }
        default:
          return { y: options.distance, x: 0 }
      }
    }

    // Начальное состояние элемента
    const { x, y } = getStartCoords()
    gsap.set(el, {
      opacity: options.opacity,
      x,
      y,
      visibility: 'visible'
    })

    // Создаем Intersection Observer
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            // Анимация появления
            gsap.to(el, {
              opacity: 1,
              x: 0,
              y: 0,
              duration: options.duration,
              delay: options.delay,
              ease: options.ease,
              onComplete: () => {
                // Отключаем наблюдение если указано однократное появление
                if (options.once) {
                  observer.unobserve(entry.target)
                }
              }
            })
          }
        })
      },
      {
        threshold: 0.1, // Порог видимости
        rootMargin: '0px' // Отступы от края viewport
      }
    )

    // Начинаем наблюдение за элементом
    observer.observe(el)

    // Сохраняем ссылку на observer для возможности отключения
    el._intersectionObserver = observer
  },

  // Очищаем observer при размонтировании
  unmounted(el) {
    if (el._intersectionObserver) {
      el._intersectionObserver.disconnect()
    }
  }
}
