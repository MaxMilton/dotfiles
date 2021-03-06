function up_system --description 'Update system packages'
  switch (awk -F "=" '/^NAME/ {print $2}' /etc/os-release | tr -d '"')
    case "Alpine Linux"
      apk upgrade --update-cache
    case "Arch Linux"
      yay -Syu $argv
    case "Debian GNU/Linux" Ubuntu
      sudo apt update; and sudo apt upgrade -y; and sudo apt dist-upgrade -y
    case Fedora
      sudo dnf update --refresh -y
  end
end
