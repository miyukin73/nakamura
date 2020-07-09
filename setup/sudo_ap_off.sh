#AP化OFF(２回目以降)
#<<実行方法>>
#bash sudo_ap_off.sh

#/etc/network/interfacesの修正(削除)
sudo cat /etc/network/interfaces|tr -d source-directory /etc/network/interfaces.d
sudo cat /etc/network/interfaces|tr -d auto lo
sudo cat /etc/network/interfaces|tr -d iface lo inet loopback
sudo cat /etc/network/interfaces|tr -d iface eth0 inet manual
sudo cat /etc/network/interfaces|tr -d auto wlan0
sudo cat /etc/network/interfaces|tr -d allow-hotplug wlan0
sudo cat /etc/network/interfaces|tr -d iface wlan0 inet static
sudo cat /etc/network/interfaces|tr -d address 192.168.7.1
sudo cat /etc/network/interfaces|tr -d netmask 255.255.255.0
sudo cat /boot/cmdline.txt

sudo systemctl stop  hostapd
sudo systemctl disable  hostapd

sudo systemctl stop  dnsmasq
sudo systemctl disable  dnsmasq

sudo reboot