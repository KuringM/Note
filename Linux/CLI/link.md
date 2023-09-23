- 软链接:`ln -s source_file target_file`
- 硬连接:	`ln source_file target_file`

``` sh
ls -il # -i参数显示文件的inode节点信息
```

### 通过节点号可查相关文件

`find . -inum **** `
