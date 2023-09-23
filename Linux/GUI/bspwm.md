- Tags: #Linux #wm #bspwm

---
## Commands
### 隐藏一个节点 node
```bash
bspc node -g hidden[=on]
```
### 重现一个节点 node
```bash
bspc node $(bspc query -N -n .hidden
| tail -n1) -g hidden=off
```

### 窗口设置紧急
```bash
wmctrl -r "bspwm" -b add,demands_attention
```
