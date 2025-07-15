#!/bin/bash

  DEV=/dev/sda3
  MNT=/mnt/linux-backup
  SRC=/home/vitaly/Документы/
  DST=/mnt/linux-backup/myBackup/

  # Монтирование
  if mountpoint -q "$MNT"
  then
      echo "Диск уже смонтирован"
  else
      echo "Монтирование..."
      sudo mount "$DEV" "$MNT"
  fi

  # синхронизация
  rsync -av --ignore-existing "$SRC" "$DST"  # основной бэкап докуметов
  rsync -av --ignore-existing "/home/vitaly/PortProton/data/prefixes/DEFAULT/drive_c/users/vitaly/Documents/The Witcher 3" "$DST"  # сохранения ведьмак 3

  rsync -av --ignore-existing /home/vitaly/scripts "$DST/Shell"  # мои скрипты -> hdd
  rsync -av --ignore-existing /home/vitaly/scripts "$SRC/GitHub/Shell/"  # скрипты -> гит

  rsync -av --ignore-existing /home/vitaly/.config/fish/config.fish "$DST/Shell/alias"  # алиас -> hdd
  rsync -av --ignore-existing /home/vitaly/.config/fish/config.fish "$SRC/GitHub/Shell/alias"  # алиас -> гит



  echo "✅ rsync завершён"

  # Размонтирование
  sudo umount "$MNT"
  if mountpoint -q "$MNT"
  then
      echo "❌ Диск не размонтирован"
  else
      echo "✅ Диск размонтирован"
  fi

