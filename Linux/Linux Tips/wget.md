- Tags: #Linux 

---

weget是Linux世界中最常用的网络下载工具，支持HTTP和FTP协议。
### 1. 下载单个文件
`wget http://demo.com/demo.zip`

### 2. 下载多个文件
`wget -i url.txt` 
``` txt
http://demo.com/demo1.zip
https://demo.com/demo2.zip
http://demo.com/demo3.zip
```

### 3. 断点续传
wget命令支持断点续传功能，只需要加上 -c选项即可
`wget -c http://demo.com/demo.zip`

当然如果遇到网络不好的情况，我们希望wget可以多尝试几次，可以通过-t n来设置，n表示尝试的次数，n取0时表示一直尝试。
`wget -c -t 10 http://demo.com/demo.zip`

我们有时可能需要对下载的文件重命名，可以使用-O选项
`wget http://demo.com/demo.zip -O demo.download.zip`

### 4. 下载限速
当你执行wget的时候，它默认会占用全部可能的宽带下载。但是当你准备下载一个大文件，而你还需要下载其它文件时就有必要限速了。

`wget --limit-rate=300k http://demo.com/demo.zip`

### 5. 后台执行
有时需要wget下载在后台执行，可以添加 -b选项，这时执行该命令的回显信息都会自动存储在wget.log文件中

`wget -b http://demo.com/demo.zip`
### 6. 从FTP服务器上下载文件
从FTP服务器上下载文件时一般需要输入用户名和密码

`wget --ftp-user username --ftp-password xxxx ftp://demo.com/demo.zip`
对于需要验证的HTTP也可以用类似的选项

`wget --http-user username --http-password xxxx http://demo.com/demo.zip`

