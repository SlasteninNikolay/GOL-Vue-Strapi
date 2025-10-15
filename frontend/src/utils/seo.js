export const set404Status = () => {
  document.title = '404 - Страница не найдена'

  // Обновляем description
  let metaDescription = document.querySelector('meta[name="description"]')
  if (metaDescription) {
    metaDescription.setAttribute('content', 'Страница не найдена')
  } else {
    metaDescription = document.createElement('meta')
    metaDescription.name = 'description'
    metaDescription.content = 'Страница не найдена'
    document.head.appendChild(metaDescription)
  }

  // Добавляем noindex для поисковиков
  let metaRobots = document.querySelector('meta[name="robots"]')
  if (metaRobots) {
    metaRobots.content = 'noindex, follow'
  } else {
    metaRobots = document.createElement('meta')
    metaRobots.name = 'robots'
    metaRobots.content = 'noindex, follow'
    document.head.appendChild(metaRobots)
  }

  // Для Google Analytics
  if (window.gtag) {
    window.gtag('event', 'page_view', {
      page_title: '404 - Страница не найдена',
      page_location: window.location.href
    })
  }

  // Для Yandex.Metrica
  // if (window.ym) {
  //   window.ym(XXXXXX, 'hit', window.location.href) // замените XXXXXX на ID счётчика
  // }
}
