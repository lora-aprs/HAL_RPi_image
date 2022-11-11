set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

apt-get install -y zsh git vim pigpio python3-pigpio
chsh -s /bin/zsh
systemctl start pigpiod
