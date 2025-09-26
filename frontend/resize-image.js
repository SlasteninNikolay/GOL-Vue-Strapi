import sharp from 'sharp'
import * as fs from 'node:fs'
import path from 'path'
import { IMAGE_SIZES } from './src/utils/constants.js';

const inputDir = 'src/assets/images'
const outputDir = 'public/images'

const sizes = IMAGE_SIZES
const supportedFormats = ['.jpg', '.jpeg', '.png', '.tiff', '.webp', '.gif']

function clearDirectory(directory) {
  if (fs.existsSync(directory)) {
    fs.readdirSync(directory).forEach((file) => {
      const fullPath = path.join(directory, file)
      if (fs.statSync(fullPath).isDirectory()) {
        clearDirectory(fullPath)
      } else {
        fs.unlinkSync(fullPath)
      }
    })
  }
}

function processDirectory(directory) {
  fs.readdirSync(directory).forEach((file) => {
    const fullPath = path.join(directory, file)
    if (fs.statSync(fullPath).isDirectory()) {
      processDirectory(fullPath)
    } else {
      const ext = path.extname(file).toLowerCase()
      if (!supportedFormats.includes(ext)) {
        console.warn(`Unsupported format: ${file}`)
        return
      }
      const relativePath = path.relative(inputDir, directory)
      const outputSubDir = path.join(outputDir, relativePath)

      if (!fs.existsSync(outputSubDir)) {
        fs.mkdirSync(outputSubDir, { recursive: true })
      } else {
        // Очистка директории перед сохранением новых файлов
        clearDirectory(outputSubDir)
      }

      // Конвертируем оригинальное изображение в webp с суффиксом -default
      const defaultOutputFile = path.join(outputSubDir, `${path.parse(file).name}-default.webp`)
      sharp(fullPath)
        .toFormat('webp')
        .toFile(defaultOutputFile, (err, info) => {
          if (err) {
            console.error(err)
          } else {
            console.log(`Created default: ${defaultOutputFile}`)
          }
        })

      // Обрабатываем изображение для изменения размеров
      sizes.forEach((size) => {
        const outputFile = path.join(outputSubDir, `${path.parse(file).name}-${size}.webp`)
        sharp(fullPath)
          .resize(size)
          .toFormat('webp')
          .toFile(outputFile, (err, info) => {
            if (err) {
              console.error(err)
            } else {
              console.log(`Created: ${outputFile}`)
            }
          })
      })
    }
  })
}

processDirectory(inputDir)
