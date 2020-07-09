#RPiのAP化初回セットアップ
#<<実行方法>>
#bash setup_ap.sh

#network/interfacesファイルに以下の項目を追加
sudo echo "source-directory /etc/network/interfaces.d\nauto lo\niface lo inet loopback\niface eth0 inet manual\nauto wlan0\nallow-hotplug wlan0\niface wlan0 inet static\naddress 192.168.7.1\nnetmask 255.255.255.0\n">>/etc/network/interfaces


#hostapdのインストール
sudo apt-get install hostapd
#hostapd/hostapd.confファイルに以下の項目を追加
sudo echo "interface=wlan0\ndriver=nl80211\nssid=wolvez2020\nhw_mode=g\nchannel=6\nieee80211n=1\nwmm_enabled=1\nht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]\nmacaddr_acl=0\nauth_algs=1\nignore_broadcast_ssid=0\nwpa=2\nwpa_key_mgmt=WPA-PSK\nwpa_passphrase=wolvez2020\nrsn_pairwise=CCMP">>/etc/hostapd/hostapd.conf
#↑ssidとpassphraseは適当に変えてください
#/etc/default/hostapd を編集
DAEMON_CONF="/etc/hostapd/hostapd.conf"


#dnsmasqのインストール
sudo apt-get install dnsmasq
#オリジナル設定ファイルのバックアプ
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
#dnsmasq.confファイルに以下の項目を追加
sudo echo "interface=wlan0\nlisten-address=192.168.7.1\nbind-interfaces\nserver=8.8.8.8\nserver=8.8.4.4\ndomain-needed\nbogus-priv\ndhcp-range=192.168.7.100,192.168.7.199,24h">>/etc/dnsmasq.conf






#設定完了の喜びの舞
echo -e "<<設定完了のおしらせ>>\nおめでとう！設定完了だ！ともに高みへゆこう\n10秒後にラズパイを再起動します。"

#reboot after 10s
sudo shutdown -r +10