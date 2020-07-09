#AP化ON(２回目以降)　参考→http://norikyu.blogspot.com/p/raspberry-pi3-lan-ap.html
#<<実行方法>>
#bash sudo_ap_on.sh


#network/interfacesファイルに以下の項目を追加
sudo sh -c "echo 'source-directory /etc/network/interfaces.d\nauto lo\niface lo inet loopback\niface eth0 inet manual\nauto wlan0\nallow-hotplug wlan0\niface wlan0 inet static\naddress 192.168.7.1\nnetmask 255.255.255.0'>>/etc/network/interfaces"
#echoだけだと'許可がありません'のエラーが発生した　参考→https://linuxfan.info/post-1818

sudo systemctl enable  hostapd
sudo systemctl start  hostapd

sudo systemctl enable  dnsmasq
sudo systemctl start  dnsmasq

sudo reboot