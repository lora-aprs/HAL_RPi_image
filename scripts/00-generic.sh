set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

apt-get install -y zsh git vim
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo -u pi sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

apt-get install -y pigpio python3-pigpio
systemctl enable pigpiod
