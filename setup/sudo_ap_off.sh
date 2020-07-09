#AP化OFF(２回目以降)
#<<実行方法>>
#bash sudo_ap_off.sh
#network/interfacesファイルに以下の項目を追加
sudo echo "source-directory /etc/network/interfaces.d\nauto lo\niface lo inet loopback\niface eth0 inet manual\nauto wlan0\nallow-hotplug wlan0\niface wlan0 inet static\naddress 192.168.7.1\nnetmask 255.255.255.0\n">>/etc/network/interfaces
sudo systemctl stop  hostapd
sudo systemctl disable  hostapd

sudo systemctl stop  dnsmasq
sudo systemctl disable  dnsmasq

sudo reboot