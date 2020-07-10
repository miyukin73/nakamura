#AP化OFF(２回目以降)
#<<実行方法>>
#bash sudo_ap_off.sh

cd create_ap

#AP化のファイル削除
sudo sh -c "rm -rf /etc/create_ap.conf"
sudo sh -c "rm -rf /etc/network/interfaces"
sudo sh -c "rm -rf /etc/default/hostapd"

#stop, disable
sudo systemctl stop create_ap
sudo systemctl disable create_ap

sudo systemctl stop  hostapd
sudo systemctl disable  hostapd

sudo systemctl stop  dnsmasq
sudo systemctl disable  dnsmasq

sudo reboot