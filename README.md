# My Dotfiles

Just keep my dotfiles and notes in one place. I use `master` branch for generic setting. For machine-specific configuration, is located in different branch. This dotfile is powered by [Dotbot](https://github.com/anishathalye/dotbot).


## A fresh macOS setup

### Before you re-install
First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

* Did you commit and push any changes/branches to your git repositories?
* Did you remember to save all important documents from non-iCloud directories?
* Did you save all of your work from apps which aren't synced through iCloud?
* Did you remember to export important data from your local database?

### Setting up your Mac
If you did all of the above you may now follow these install instructions to setup a new Mac.

* Update macOS to the latest version with the App Store
* Install macOS Command Line Tools by running xcode-select --install
* [Generate a new public and private SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add them to Github
* Clone this repo to ~/.dotfiles
* Run `install` to start the installation
* Restart your computer to finalize the process

Your Mac is now ready to use!

## For daily update

* Check out to the machine-specific branch
* Comment out the command you don't want in `install.conf.yaml`
* Run `install`

## Branch Hierarchy
    ```
    master
    |
    +- mac
    ```
## Shell

### .bashrc vs .bash_profile
這兩者的差別在於系統上認定有無登入會選擇其中一種來初始化 bash，不同系統會有不同作法，我的設定是如果系統要 load bash_profile 就把它轉到 bashrc，這樣只要設定好 bashrc 就好，bashrc 和 bash_profile 差別可參考[別人的回覆](http://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc)。

### aliases

* `extract`: 解壓縮後面接的檔案
* `mkd`: 創建資料夾且進入

### tmux
* `ltm`: 如果有 tmux session 就 attach，如果沒有就新開一個 (lazy tmux)
* `tml`: tmux ls
* `tma`: tmux attach-session
* `tmk`: tmux kill-session
* `tmc`: clear tmux stuff
* `tmna`: rename session

### color
* [ base16-shell ](https://github.com/chriskempson/base16-shell)

## Tmux

### 指令
* `<C-a>`: prefix

#### 需要加 prefix
* `d`: detach 目前的 session
* `,`: rename 目前的 window
* `number`: 跳到那個 number 的 window
* `c`: 開啟新的 window (create)
* `n`: 跳到下一個 window (next)
* `p`: 跳到上一個 window (previous)
* `r`: 重新 load tmux.conf (reload)
* `|`: split window h
* `_`: split window v
* `H`: resize left
* `K`: resize down
* `J`: resize up
* `L`: resize right
* `<hjkl>`: pane 上下左右跳

用 ssh 時會有 nested tmux 的狀況
* `<S-Up>`: 轉到 ssh 的 tmux
* `<S-Down>`: 轉回 local 的 tmux

## Vim

### 好東西

* [Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/): 這個教學我看了好幾次是當初學 vim 的救星
* [Vim Cheat Sheet](http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html): 適合印出來貼在電腦旁看
* [Vim Awesome](http://vimawesome.com/): vim plugin 排行榜
* [vimgifs](https://vimgifs.com/): 學 vim tips 的好地方
* [viminum](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb): 可以在瀏覽器上用 vim 的快速鍵

### 外掛列表

#### Appearance
* [ lightline ](https://github.com/itchyny/lightline.vim): Beautiful and light weight status bar.
* [ base16-vim ](https://github.com/chriskempson/base16-vim): Base16 color theme.
* [ vim-buftabline ](https://github.com/ap/vim-buftabline): Buffer list that lives in the tabline.

#### Easy editing
* [ nerdtree ](https://github.com/scrooloose/nerdtree): Explore file system in vim.
* [ nerdtree-git-plugin ](https://github.com/Xuyuanp/nerdtree-git-plugin): Show git status on nerdtree.
* [ pangu ](https://github.com/hotoo/pangu.vim): Auto format Chinese and English text.
* [ tcomment_vim ](https://github.com/tomtom/tcomment_vim): Fast shortcut for commenting.
* [ gundo ](https://github.com/sjl/gundo.vim): Fast undo.
* [ tagbar ](https://github.com/majutsushi/tagbar): Easy way to browse the tags of the current file.
* [ vim-easymotion ](https://github.com/Lokaltog/vim-easymotion): Vim motions on speed.
* [ vim-surround ](https://github.com/tpope/vim-surround): Quickly deals surrounding things.
* [ supertab ](https://github.com/ervandew/supertab): Vim insert mode completions with Tab.
* [ auto-pairs ](https://github.com/jiangmiao/auto-pairs): Insert or delete brackets, parens, quotes in pair.
* [ ctrlp ](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru, tag, etc finder.
* [ vim-gitgutter ](https://github.com/airblade/vim-gitgutter): A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
* [ vim-fugitive ](https://github.com/tpope/vim-fugitive): Use git in vim.
* [ vim-signature ](https://github.com/kshenoy/vim-signature): Easy mark in vim.
* [ vim-repeat ](https://github.com/tpope/vim-repeat): Let `.` more powerful in vim.

#### Syntax color and indent
* [ syntastic ](https://github.com/vim-syntastic/syntastic): Powerful syntax checking plugin.
* [ vim-javascript ](https://github.com/pangloss/vim-javascript): Javascript syntax hightlight and intent.
* [ vim-json ](https://github.com/elzr/vim-json): Syntax for json file.
* [ vim-jsx-pretty ](https://github.com/MaxMEllon/vim-jsx-pretty): React syntax highlighting and indenting plugin.
* [ vim-prettier ](https://github.com/prettier/vim-prettier): Auto format javascript, typescript, less, scss, css, json, graphql and markdown files.
* [ vim-css-color ](https://github.com/ap/vim-css-color): Show color in vim.

### 指令

以下只記錄自訂指令與外掛指令。

#### 自訂指令
可搭配 vimrc 一起看會比較清楚

`<Leader>` = `,`

* `<Leader>w` = :w!
* `jk` = `<Esc>` （跳回 normal mode)
* `9` = $ （跳到此行的最後一個字）
* `0` = ^ （跳到此行的第一個字）
* `<Leader>dw`: 把白色空白刪掉 (delete whitespace)

##### windows and buffers

我目前把 buffer 當 tab 在用
* `<C-hjkl>` window 上下左右跳
* `<Tab>` 跳下一個 buffer
* `<Shift-Tab>` 跳上一個 buffer
* `<Leader>t` 開一個新的 buffer
* `<Leader>q` 關掉目前所在 buffer

### 外掛指令

#### t comment
* `<Leader>c` 註解選擇的範圍

#### NerdTree
* `<Leader>n` 開關 NerdTree
* `o` 在 NerdTree 底下開啟檔案或開關目錄
* `I` 顯示隱藏被隱藏的檔案與目錄
* `u` 跳到上一個目錄

#### EasyMotion
* `<Space>f『目標』` 用 EasyMotion 找『目標』
* `<Space>w` 用 EasyMotion 找字
* `<Space>j` 用 EasyMotion 往下面行跳
* `<Space>k` 用 EasyMotion 往上面行跳

#### vim surround
* `ysiw)` 在所在字上加 () 號，例如；hello -> (hello) ( yield surround inside word )
* `yss)` 在所在行加 () 號
* `S)` 在 visual mode 下輸入，可在選取的字旁加 ()

#### CtrlP
* `;` 開啟 ctrlp 模糊查詢

##### Once CtrlP is open:
* Press <c-f> and <c-b> to cycle between modes.
* Use <c-j>, <c-k> or the arrow keys to navigate the result list.
* Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.

#### vim gitgutter
* `[c` 跳到上一個 hunk
* `]c` 跳到下一個 hunk
* `<Leader>hp` preview a hunk's changes
* `<Leader>hs` stage a hunk
* `<Leader>hu` undo a hunk

#### gundo
* `<Leader>u` 開啟 gundo

#### Pangu
* `:Pangu` 中文排版

#### vim prettier
* `<Leader>p` format file

#### tagbar
* `<Leader>tt` show functions and tags

#### vim signature
* `mx`           Toggle mark 'x' and display it in the leftmost column
* `dmx`          Remove mark 'x' where x is a-zA-Z
* `m,`           Place the next available mark
* `m<Space>`     Delete all marks from the current buffer
* `m<BS>`        Remove all markers
* `]'`           Jump to start of next line containing a mark
* `['`           Jump to start of prev line containing a mark
* `m/`           Open location list and display marks from current buffer

## Special thanks to
* https://github.com/anishathalye/dotfiles
* https://github.com/driesvints/dotfiles
* https://github.com/webpro/dotfiles
* https://github.com/rkalis/dotfiles
