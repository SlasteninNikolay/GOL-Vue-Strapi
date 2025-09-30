import { IMAGE_SIZES } from '@/utils/constants.js'

export const isMobile = (maxWidth = 992) => {
  const mediaQuery = window.matchMedia(`(max-width: ${maxWidth}px)`)
  return mediaQuery.matches
}

export const generateSrcSet = (imageSrc, imageFormat = 'webp', onlyDefault = false) => {
  if (!imageSrc || typeof imageSrc !== 'string') return '';

  const sizes = typeof IMAGE_SIZES !== 'undefined' ? IMAGE_SIZES : [320, 640, 960, 1200];

  // Извлекаем директорию
  const dirMatch = imageSrc.match(/(.*\/)[^\/]+$/);
  const directory = dirMatch ? dirMatch[1] : '';

  // Извлекаем имя файла без расширения
  const nameMatch = imageSrc.match(/\/([^\/]+)\.[^\/]+$/);
  const imageName = nameMatch ? nameMatch[1] : '';

  if (!imageName) return '';

  if (onlyDefault) {
    return `${directory}${imageName}-default.${imageFormat}`;
  }

  return sizes
    .map((size) => `${directory}${imageName}-${size}.${imageFormat} ${size}w`)
    .join(', ');
};

export const getAttrNameFromSelector = (attrSelector) => {
  return attrSelector.substring(1, attrSelector.length - 1)
}

export function getPageTitle(id, pages) {
  let page = pages.find((p) => p.slug === id)
  if (page) return page.title

  page = pages.find((p) => p.id === id)
  return page ? page.title : ''
}

export function getImage(image) {
  return new URL(`@/assets/images/${image}`, import.meta.url).href
}

export function childrenToHtml(children) {
  if (!Array.isArray(children)) return ''
  return children
    .map((child) => {
      if (child.type === 'text') {
        let text = child.text || ''
        if (child.bold) text = `<strong>${text}</strong>`
        if (child.italic) text = `<em>${text}</em>`
        if (child.underline) text = `<u>${text}</u>`
        return text
      }
      if (child.type === 'link') {
        // Очистка URL от дублирования
        let href = child.url || '#'

        // Удаление дублирующихся частей
        href = href.replace(/^(.*?)(mailto:)?/, 'mailto:')

        // Удаление дублирующихся доменов
        const cleanUrl = new URL(href)
        href = `mailto:${cleanUrl.pathname.replace(/^\//, '')}`

        // Получение текста ссылки
        const linkText = childrenToHtml(child.children) || href.replace('mailto:', '')

        return `<a href="${href}" target="_blank">${linkText}</a>`
      }
      return ''
    })
    .join('')
}

export function richTextToHtml(blocks) {
  if (!Array.isArray(blocks)) return ''

  return blocks
    .map((block) => {
      switch (block.type) {
        case 'paragraph':
          return `<p>${childrenToHtml(block.children)}</p>`
        case 'heading':
          // Обработка заголовков с учетом уровня
          const level = block.level || 1
          return `<h${level}>${childrenToHtml(block.children)}</h${level}>`
        case 'heading1':
          return `<h1>${childrenToHtml(block.children)}</h1>`
        case 'heading2':
          return `<h2>${childrenToHtml(block.children)}</h2>`
        case 'heading3':
          return `<h3>${childrenToHtml(block.children)}</h3>`
        case 'list':
          const listTag = block.format === 'unordered' ? 'ul' : 'ol'
          return `<${listTag}>${(block.children || [])
            .map((li) => `<li>${childrenToHtml(li.children)}</li>`)
            .join('')}</${listTag}>`
        case 'list-item':
          return `<li>${childrenToHtml(block.children)}</li>`
        default:
          console.warn('Неизвестный тип блока:', block.type)
          return ''
      }
    })
    .filter(item => item !== '') // Удаляем пустые блоки
    .join('')
}
export function getDomain (url, subdomain) {

  if(!url) {
    return ''
  }

  subdomain = subdomain || false;

  url = url.replace(/(https?:\/\/)?(www.)?/i, '');

  if (!subdomain) {
    url = url.split('.');

    url = url.slice(url.length - 2).join('.');
  }

  if (url.indexOf('/') !== -1) {
    return url.split('/')[0];
  }

  return url;
}
