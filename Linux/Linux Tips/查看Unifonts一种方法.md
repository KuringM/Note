- Tags: #Linux  #font #cmd

---

1.  查看：`printf "\uf303"` 
2.  X11状态栏显示：`xsetroot -name $(printf '\uf303')`
3. 查看unicode
```bash
% echo -e '\u2620'     # \u takes four hexadecimal digits
☠
% echo -e '\U0001f602' # \U takes eight hexadecimal digits
😂
print "\U6885\U5eb7"
```
