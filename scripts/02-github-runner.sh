set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

sudo -u pi mkdir /home/pi/actions-runner
cd /home/pi/actions-runner
sudo -u pi curl -o actions-runner-linux-arm-2.298.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.298.2/actions-runner-linux-arm-2.298.2.tar.gz
sudo -u pi tar xzf ./actions-runner-linux-arm-2.298.2.tar.gz
./bin/installdependencies.sh
