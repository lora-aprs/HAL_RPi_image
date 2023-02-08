set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

apt-get install -y python3-pip python3-dev libffi-dev libssl-dev

pip install -U platformio

curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules

sudo usermod -a -G dialout pi
sudo usermod -a -G plugdev pi
