1. 下载[colemak](https://colemak.com/Windows)<BR>
	a. run `setup.exe`<BR>
	b. 自动生成`Colemak2.dll`链接库<BR>
2. 修改注册表<BR>
	a. `win+r --> regedit`<BR>
	b. 找到 `计算机\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\00000804`<BR>
	c. 修改`Layouts Files` 数据为`Colemak2.dll`
3. 设置>时间>语言和区域>选<BR>项
	a. 删除Colemak键盘<BR>
	b. 添加QWERTY键盘<BR>
4. 重启
