- Tags: #Linux #CLI #GRUB

---

### 修改grub主题

1. Modify the `/etc/default/grub`
2. Download theme file, and mv it to`/boot/grub/theme/`
3. Found "GRUB_THEME=", add the `theme.txt` file whice in the frist step's path
4. Update grub,use `sudo update-grub` command
5. change `GRUB_GFXMODE=“1920x1080”` in `/etc/default/grub`

### grub探测其他系统

1. add`GRUB_DISABLE_OS_PROBER=false` to `/etc/default/grub`
2. `sudo update-grub`
3. `sudo os-prober`
4. `sudo grub-mkconfig`

### 修复引导

1. 挂载主目录 `mount /dev/mmcblk1q2 /mnt`
2.  挂在引导目录`mount /dev/mmcblk1q1 /mnt/boot`
3. 切换到原来的系统：`arch-chroot /mnt`
4. grub 重写引导，`grub-install —target=x86_64-efi —efi-directory=/boot`
5. 重新生成 linux 引导：`pacman -S linux` 再 `grub-mkconfig -o /boot/grub/grub.cfg`
6. 重启
