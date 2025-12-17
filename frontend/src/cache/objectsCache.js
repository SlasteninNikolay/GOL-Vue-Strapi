import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'

const objectsCache = new Map()
const roomsCache = new Map()

// Получение названия объекта по slug
export const getObjectNameBySlug = (slug) => {
  return objectsCache.get(slug) || null
}

// Получение названия комнаты по roomSlug
export const getRoomTitleBySlug = (roomSlug) => {
  return roomsCache.get(roomSlug) || 'Номер'
}

// Предзагрузка объектов и комнат при инициализации приложения
export const preloadObjects = async () => {
  try {
    // Сначала загружаем объекты
    const objectsResponse = await axios.get(
      `${API_URL}/objects?populate=*`,
      {
        headers: { Authorization: `Bearer ${TOKEN}` },
      },
    )

    // Кэшируем объекты
    objectsResponse.data.data.forEach(object => {
      objectsCache.set(object.slug, object.title)
    })

    const objectSlugs = Array.from(objectsCache.keys())

    for (const slug of objectSlugs) {
      try {
        const roomsResponse = await axios.get(
          `${API_URL}/rooms?filters[object][slug][$eq]=${slug}&populate=photos`,
          {
            headers: { Authorization: `Bearer ${TOKEN}` },
          },
        )

        // Кэшируем комнаты
        roomsResponse.data.data.forEach(room => {
          roomsCache.set(room.slug, room.title)
        })

      } catch (error) {
        console.error(`Error loading rooms for object ${slug}:`, error)
      }
    }

  } catch (error) {
    console.error('Error preloading objects:', error)
  }
}

// Очистка кэша
export const clearCache = () => {
  objectsCache.clear()
  roomsCache.clear()
}

// Получение всех кэшированных данных (для отладки)
export const getCacheStats = () => {
  return {
    objects: objectsCache.size,
    rooms: roomsCache.size,
    objectsCache: Array.from(objectsCache.entries()),
    roomsCache: Array.from(roomsCache.entries())
  }
}
