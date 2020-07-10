#AP化OFF(２回目以降)
#<<実行方法>>
#bash sudo_ap_off.sh

#/etc/network/interfacesの修正(削除)
#sudo sh -c "rm -rf /etc/create_ap.conf"
#sudo sh -c "rm -rf /etc/network/interfaces"
#sudo sh -c "rm -rf /etc/hostapd/hostapd.conf"
#sudo sh -c "rm -rf /etc/default/hostapd"
#sudo sh -c "rm -rf /etc/dnsmasq.conf"
cd create_ap
sudo sh -c "rm -rf /etc/create_ap.conf"

sudo systemctl stop create_ap
sudo systemctl disable create_ap

sudo systemctl stop  hostapd
sudo systemctl disable  hostapd

sudo systemctl stop  dnsmasq
sudo systemctl disable  dnsmasq

sudo reboot