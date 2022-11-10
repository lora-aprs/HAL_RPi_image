set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

cd /home/pi
sudo -u pi git clone https://github.com/lora-aprs/LoRa_APRS_iGate.git
cd LoRa_APRS_iGate
sudo -u pi pio pkg install -p "espressif32 @ 3.1.1"
sudo -u pi pio pkg install --tool "tool-mkspiffs"
