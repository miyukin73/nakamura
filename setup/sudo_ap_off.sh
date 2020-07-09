#AP化OFF(２回目以降)
#<<実行方法>>
#bash sudo_ap_off.sh

#/etc/network/interfacesの修正(削除)
sudo sh -c "rm -rf /etc/network/interfaces"


sudo systemctl stop  hostapd
sudo systemctl disable  hostapd

sudo systemctl stop  dnsmasq
sudo systemctl disable  dnsmasq

sudo reboot