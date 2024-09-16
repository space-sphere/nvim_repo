### coc

- coclist extensions 查看coc已安装的插件
- coclist marketplace 查看coc插件市场，能够搜索

### explorer
- command explorer

### coc.nvim
#### go to code
- gd 到定义的位置
- gr 到reference的位置
- gi 到实现implementation的位置
- gy 到type definition

#### diagnostic
- [g 到上一个错误点
- g]到下一个错误点

- <LEADER>rn 重命名某个变量
- v模式K show documentation in preview window

#### 代码提示
- i模式<c-o> 列出提示

### nerdtree
- tt 打开左侧列表

### 增加新窗口，切换各个窗口
- tu 新增窗口
- tl 原来的窗口
- th 后面的窗口

### 将分屏改为竖直或水平
- sv 切换竖直
- sb 切换水平

### 其他窗口切换功能
- U 上跳5行
- J 下跳5u
- <LEADER>h 切回左边分屏
- <LEADER>l 切回右边分屏

### 光标
- w 跳到后一个词
- b 跳到前一个词
- ngg 跳到n行
- <c-o> gd之后，跳回
- <c-i> 跳到下一页
- gi 跳到前一个写的位置
- p 粘贴
- / 查找
- 0 光标到行首
- $ 光标到行尾
- F<x> 行内向行首方向查找
- f<x> 行内向行尾方向查找x
- % 光标所在{ [ "，跳到匹配的那个
- ,. 同上
- zz 将光标居中

### 录制
- q + <x> 将所有键盘输入放在x中，能改为其它
- @x 执行x中存储的输入

### 复制
- nyy 复制n行
- yy 复制单行

### 删除
- x 删掉光标所在位置
- nx 删掉光标开始n个字符
- ndd 删掉本行及下面共n行
- dd 删掉本行
- p 粘贴到光标下一行
- P 粘贴到光标下一行
- s 删除当前字符，并进i模式
- cc 删掉该行，进入i模式

### 其它使用技巧
- :r /path/to/file 将file中内容导入光标所在位置
- :r !pwd 在vim中执行系统命令，并把结果导入光标所在位置

- gu 将选中文本换为小写
- gU 将选中文本换为大写

- >> 向右缩进
- << 向左缩进

- <LEADER>o 折叠
- <c-y> 插入{}并换行
- <LEADER>ss spell检查

### 保存
- :saveas <new filename> 文件另存为
- :w <new filename> 文件另存为副本

### Visual
- * 全文搜索选中内容

### Markdown
| Shortcut | What it creates     |
|----------|---------------------|
| `,n`     | ---                 |
| `,b`     | **Bold** text       |
| `,s`     | ~~sliced~~ text     |
| `,i`     | *italic* text       |
| `,d`     | `code block`        |
| `,c`     | big `block of code` |
| `,m`     | - [ ] check mark    |
| `,p`     | picture             |
| `,a`     | [link]()            |
| `,1`     | # H1                |
| `,2`     | ## H2               |
| `,3`     | ### H3              |
| `,4`     | #### H4             |
| `,l`     | --------            |

`,f` to go to the next `<++>` (placeholder)

`,w` to go to the next `<++>` (placeholder) and then press `Enter` for you

### 撤销
- u 撤销
- <c-r> 取消撤销
