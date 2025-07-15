if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias mount_backup='sudo mount /dev/sda3 /mnt/linux-backup'
alias umount_backup='sudo umount /mnt/linux-backup'

alias sync='rsync -av --ignore-existing /home/vitaly/Документы/ /run/media/vitaly/linux-backup/myBackup/'

alias ll 'ls -l'

alias inst="sudo dnf install"
alias check="sudo dnf check-update"
alias up="sudo dnf up --refresh && echo 'Checking Flatpak...' && flatpak update -y"   # dnf up не требует sudo, т.к. добавлен в sudoers

alias pgstart='sudo systemctl start postgresql'
alias pgstop='sudo systemctl stop postgresql'
alias pgstatus='sudo systemctl status postgresql'
