- Tags: #Linux #Network 

---
[https://unix.stackexchange.com/questions/420640/unable-to-connect-to-any-wifi-with-networkmanager-due-to-error-secrets-were-req](https://unix.stackexchange.com/questions/420640/unable-to-connect-to-any-wifi-with-networkmanager-due-to-error-secrets-were-req)
   
1. `nmcli con delete <SSID>` 
2. `nmcli dev wifi connect <SSID> password <password>`
