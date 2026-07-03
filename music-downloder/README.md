# Скрипт для запуска yandex-music-downloader
Скрипт удаляет рекламные треки и запускает [yandex-music-downloader](https://github.com/llistochek/yandex-music-downloader).
Для работы скрипта нужно скачать [yandex-music-downloader](https://github.com/llistochek/yandex-music-downloader).

# Как пользоваться
1) открываем скрипт, вписываем свой токен. (получение токена: https://ym.marshal.dev/token/#implicit-oauth)2
2) указываем url на альбом, испольнителя или трек
3) указываем путь, куда будут скачиваться треки

## Пример, скачать альбом 7Б - Молодые ветра
TOKEN="токен"
URL="https://music.yandex.ru/album/3359372"  # url на альбом
MIN_SIZE=3145728  # для определения рекламных тректов. рекламные треки весят примерно 2,8 Мб
DOWNLOAD_DIR="/home/vitaly/Документы/яндекс-муз/7Б-Молодые-ветра/"  # директория должна быть уже созданой

# Запуск скрипта
Скрипт работает бесконечно, треубет ручной остановки или таймера:
```shell
timeout 30m bash /home/vitaly/music-downloder/music-downloader.sh
```
