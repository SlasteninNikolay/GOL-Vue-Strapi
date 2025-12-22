export const IMAGE_SIZES = [320, 480, 768, 1024, 1280, 1440, 1920]

export const emailRegex =
  /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

export const urlRegex =
  /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_+.~#?&/=]*)/

export const BACKEND_URL = import.meta.env.VITE_BACKEND_URL
export const API_URL = import.meta.env.VITE_API_URL
export const TOKEN = import.meta.env.VITE_TOKEN
export const UPLOAD_TOKEN = import.meta.env.VITE_UPLOAD_TOKEN || '';
