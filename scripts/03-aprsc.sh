set -x
set -e

export LC_ALL=C

source /common.sh
install_cleanup_trap

apt-get install -y libevent-dev debhelper libssl-dev libcap-dev libsctp-dev libwww-perl libjson-xs-perl
apt --fix-broken install

wget http://he.fi/aprsc/down/aprsc-latest.tar.gz
tar xvfz aprsc-latest.tar.gz
cd aprsc-*/src
./configure
make make-deb
dpkg -i ../aprsc_*.deb


cat <<EOT > /opt/aprsc/etc/aprsc.conf
ServerId   AT0EST
PassCode   0
MyAdmin    "My Name, MYCALL"
MyEmail    email@example.com
RunDir data
LogRotate 10 5
UpstreamTimeout         15s
ClientTimeout           48h
Listen "Full feed"                                fullfeed tcp ::  10152 hidden
Listen ""                                         fullfeed udp ::  10152 hidden
Listen "Client-Defined Filters"                   igate tcp ::  14580
Listen ""                                         igate udp ::  14580
Listen "UDP submit"                               udpsubmit udp :: 8080
HTTPStatus 0.0.0.0 14501
HTTPUpload 0.0.0.0 8080
FileLimit        10000
EOT


systemctl enable aprsc
