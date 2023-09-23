- Tags: #Linux #Network #网络工具

---

1. 打开网卡设备：`sudo ip link set interface up`
2. 配置Wi-Fi密码：`sudo wpa_passphrase ESSID password > internet.conf`
3. 联网：`sudo wpa_supplicant -c internet.conf -i interface &`
4. 手动获取IP地址：`sudo dhcpcd &`
