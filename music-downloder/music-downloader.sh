#!/usr/bin/env bash

# используется yandex-music-downloader от llistochek
# получение токена: https://ym.marshal.dev/token/#implicit-oauth

TOKEN="Токен яндекс музыки"
URL="ссылка на альбом, трек, артиста"
MIN_SIZE=3145728  # 3 MiB в байтах - рекламные треки весят примерно 2,8 Мб
DOWNLOAD_DIR="/home/vitaly/Документы/яндекс-муз"  # директория должна быть уже созданой

iteration=0

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Цикл бесконечный, требует ручной остановки !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
while (( 1 )); do
    ((iteration++))
    echo "=== Цикл #$iteration ==="

    cd "$DOWNLOAD_DIR"

    echo "Удаление файлов меньше 3 МБ..."
    deleted_count=$(find . -type f \( -name "*.flac" -o -name "*.mp3" -o -name "*.m4a" \) -size -${MIN_SIZE}c -print -delete | wc -l)
    echo "Удалено файлов: $deleted_count"

    # Скачивает треки в наивысшем качестве, пропуская сущестуюшие, обложку встравивает, скаичвает в '.' все треки без деления на папки с альбомами и артистами
    yandex-music-downloader --token "$TOKEN" --quality 2 --skip-existing --embed-cover --path-pattern "#title" --url "$URL"

    # Проверка на новые файлы
    good_track=$(find . -type f \( -name "*.flac" -o -name "*.mp3" -o -name "*.m4a" \) -size +${MIN_SIZE}c -mmin -60 | wc -l)
    echo "Новых треков: $good_track"

    if (( good_track == 0 && deleted_count == 0 )); then
        echo "Нет новых файлов"
        break
    fi
done

echo "Готово. Всего итераций: $iteration"
