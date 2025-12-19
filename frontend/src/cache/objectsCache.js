import axios from 'axios'
import { API_URL, TOKEN } from '@/utils/constants.js'

const objectsCache = new Map()
const roomsCache = new Map()
const loadingObjects = new Map() // Для отслеживания загрузки
const loadingRooms = new Map()

// Получение названия объекта по slug
export const getObjectNameBySlug = (slug) => {
  return objectsCache.get(slug) || null
}

// Получение названия комнаты по roomSlug
export const getRoomTitleBySlug = (roomSlug) => {
  return roomsCache.get(roomSlug) || null
}

// Загрузка конкретного объекта по slug (если его нет в кэше)
export const loadObjectBySlug = async (slug) => {
  // Если уже в кэше, возвращаем
  if (objectsCache.has(slug)) {
    return objectsCache.get(slug)
  }

  // Если уже загружается, ждём завершения
  if (loadingObjects.has(slug)) {
    return loadingObjects.get(slug)
  }

  // Создаём промис загрузки
  const loadingPromise = axios
    .get(`${API_URL}/objects?filters[slug][$eq]=${slug}&populate=*`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })
    .then((response) => {
      const object = response.data.data[0]
      if (object) {
        objectsCache.set(object.slug, object.title)
        return object.title
      }
      return null
    })
    .catch((error) => {
      console.error(`Error loading object ${slug}:`, error)
      return null
    })
    .finally(() => {
      loadingObjects.delete(slug)
    })

  loadingObjects.set(slug, loadingPromise)
  return loadingPromise
}

// Загрузка конкретной комнаты по roomSlug (если её нет в кэше)
export const loadRoomBySlug = async (roomSlug) => {
  // Если уже в кэше, возвращаем
  if (roomsCache.has(roomSlug)) {
    return roomsCache.get(roomSlug)
  }

  // Если уже загружается, ждём завершения
  if (loadingRooms.has(roomSlug)) {
    return loadingRooms.get(roomSlug)
  }

  // Создаём промис загрузки
  const loadingPromise = axios
    .get(`${API_URL}/rooms?filters[slug][$eq]=${roomSlug}&populate=photos`, {
      headers: { Authorization: `Bearer ${TOKEN}` },
    })
    .then((response) => {
      const room = response.data.data[0]
      if (room) {
        roomsCache.set(room.slug, room.title)
        return room.title
      }
      return null
    })
    .catch((error) => {
      console.error(`Error loading room ${roomSlug}:`, error)
      return null
    })
    .finally(() => {
      loadingRooms.delete(roomSlug)
    })

  loadingRooms.set(roomSlug, loadingPromise)
  return loadingPromise
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
