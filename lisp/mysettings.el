

;;快速定位行
(global-set-key [(C-f12)] 'goto-line)
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode 0)
;;在minibuffer上面可以显示列号     
(column-number-mode t)
;;关闭菜单栏
(menu-bar-mode 0)
;; 关闭文件滑动控件
(scroll-bar-mode -1)


;;自动补全右边的部分.包括 "",  (), [] , {}等等。
(electric-pair-mode 1)
;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 160pt
(set-face-attribute 'default nil :height 160)


;;语法高亮
(require 'org)
(setq org-src-fontify-natively t)
;;主题
;;(color-theme-sitaramv-nt)
;; 关闭出错时的蜂鸣提示声
(setq visible-bell t)
;; 尽快显示按键序列
(setq echo-keystrokes 0.1)
;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;; Linux 下复制内容到系统的剪切板
(setq x-select-enable-clipboard t)
;; 启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp
;;(partial-completion-mode 1)

;; 在emacs读man文档时，使用当前buffer
(setq Man-notify-method 'pushy)
;;启用备份
(setq version-control t)
;;备份最原始的版本两次，记第一次编辑前的文档，和第二次编辑前的文档
(setq kept-old-versions 2)
;;备份最新的版本5次，理解同上
(setq kept-new-versions 5)
;;删掉不属于以上7版本的版本
(setq delete-old-versions t)
;;设置备份文件的路径
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
;;备份设置方法，直接拷贝
;;(setq backup-by-copying(global-set-key (kbd "C-c k") 
;; 不生成名为#filename#的临时文件
(setq auto-save-default nil)
;; 自动保存
(setq auto-save-mode t)
;;自动重载更改的文件
(global-auto-revert-mode 1)
;;将C-F10绑定为显示菜单栏
(global-set-key [(C-f10)] 'menu-bar-mode)

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

;;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; Tell Emacs fill commands to insert two after a colon
(setq colon-double-space t)

;; 在文档最后自动插入空白行
(setq require-final-newline t)

;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;在标题栏显示buffer的名字.区分不同的主机和用户名称
(setq frame-title-format '((:eval (getenv-internal "LOGNAME"))"@"(:eval (system-name))":"(:eval (or (buffer-file-name) (buffer-name)))))

;;设置字体颜色为黑色，默认为黑色
(set-foreground-color "grey")
;;设置背景为黑色，默认为白色，你也可以自由设置其它颜色
(set-background-color "black")
;;设置光标的颜色为金黄，默认为黑色
(set-cursor-color "gold1")
;;设置鼠标的颜色
(set-mouse-color "gold1")

;; 设置语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)

;;时间使用24小时制
(setq display-time-24hr-format t)

;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
(setq-default auto-fill-function 'do-auto-fill)
(setq show-paren-mode t)


;;能把一个代码块缩起来，需要的时候再展开
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s show block
;; C-c @ C-h hide block
;; C-c @ C-c toggle hide/show
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'html-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'hs-minor-mode)

;;todo
 (autoload 'remember "remember" nil t)
(autoload 'remember-region "remember" nil t)
(setq org-reverse-note-order t)
(when (file-exists-p "~/gtd/")
  (define-key global-map [(f7)] 'remember)
  (setq remember-annotation-functions '(org-remember-annotation))
  (setq remember-handler-functions '(org-remember-handler))
  (add-hook 'remember-mode-hook 'org-remember-apply-template)

  (setq org-directory "~/gtd/")
  (setq org-remember-templates
        `((?t "* TODO %?\n  %i"
              ,(expand-file-name "todo.org" org-directory) "Tasks")
          (?m "* %U\n\n  %?%i\n  %a"
              ,(expand-file-name "notes.org" org-directory) "Notes")))

  (let ((todo (expand-file-name "todo.org" org-directory)))
    (when (file-exists-p todo)
      (add-to-list 'org-agenda-files todo))))

;; C语言模式
(add-hook 'c-mode-hook
'(lambda ()

;;把c语言风格设置为k&r风格
(c-set-style "k&r")

;; 此模式下，当按Backspace时会删除最多的空格
(c-toggle-hungry-state)

;; TAB键的宽度设置为4
(setq c-basic-offset 4)

;; 在菜单中加入当前Buffer的函数索引
(imenu-add-menubar-index)

;; 在状态条上显示当前光标在哪个函数体内部
(which-function-mode)))

;; C++语言模式
(add-hook 'c++-mode-hook
'(lambda()

;;把C++语言风格设置为stroustrup风格
(c-set-style "stroustrup")
(c-toggle-auto-state)
(c-toggle-hungry-state)
(setq c-basic-offset 4)
(imenu-add-menubar-index)
(which-function-mode)))

;;设置f9调用speedbar命令
;;使用 n 和 p 可以上下移动，
;; + 展开目录或文件进行浏览，- 收缩，RET 访问目录或文件，g 更新 speedbar。
(global-set-key [f9] 'speedbar)


;; JAVA语言模式
(add-hook 'java-mode-hook
'(lambda()

(c-set-style "java")

(c-toggle-auto-state)

(c-toggle-hungry-state)

(setq c-basic-offset 4)

(imenu-add-menubar-index)

(which-function-mode)))


;;设置M-/作为标志位，默认C-@来setmark,C-@不太好用
(global-set-key (kbd "M-/") 'set-mark-command)
;; 设置F12 快速察看日程安排
(global-set-key [f12] 'list-bookmarks)
;;设置缺省主模式是text，,并进入auto-fill次模式.
;;而不是基本模式fundamental-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;让 Emacs 可以直接打开和显示图片。
(setq auto-image-file-mode t)

;;补全功能
(global-set-key (kbd "<f8>") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-all-abbrevs try-expand-dabbrev
        try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially try-complete-lisp-symbol
        try-complete-file-name-partially try-complete-file-name))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 实现不设置标志就能复制
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;复制单词

(defun copy-word (&optional arg)
"Copy words at point into kill-ring"
(interactive "P")
(copy-thing 'backward-word 'forward-word arg)
(paste-to-mark arg))
;;绑定键
(global-set-key (kbd "C-c w")         (quote copy-word))

;;复制一行
(defun copy-line (&optional arg)
"Save current line into Kill-Ring without mark the line "
(interactive "P")
(copy-thing 'beginning-of-line 'end-of-line arg)
(paste-to-mark arg))
;;绑定键
(global-set-key (kbd "C-c l")         (quote copy-line))

;;复制一段
(defun copy-paragraph (&optional arg)
"Copy paragraphes at point"
(interactive "P")
(copy-thing 'backward-paragraph 'forward-paragraph arg)
(paste-to-mark arg))
;;绑定键
(global-set-key (kbd "C-c p")(quote copy-paragraph))


;;复制字符串
(defun beginning-of-string(&optional arg)
"  "
(re-search-backward "[ \t]" (line-beginning-position) 3 1)
(if (looking-at "[\t ]")  (goto-char (+ (point) 1)) )
)

(defun end-of-string(&optional arg)
" "
(re-search-forward "[ \t]" (line-end-position) 3 arg)
(if (looking-back "[\t ]") (goto-char (- (point) 1)) )
)

(defun thing-copy-string-to-mark(&optional arg)
" Try to copy a string and paste it to the mark
When used in shell-mode, it will paste string on shell prompt by default "
(interactive "P")
(copy-thing 'beginning-of-string 'end-of-string arg)
(paste-to-mark arg))
;;绑定键
(global-set-key (kbd "C-c s")         (quote thing-copy-string-to-mark))


(defun beginning-of-parenthesis(&optional arg)
"  "
(re-search-backward "[[<(?\"]" (line-beginning-position) 3 1)
(if (looking-at "[[<(?\"]")  (goto-char (+ (point) 1)) )
)

(defun end-of-parenthesis(&optional arg)
" "
(re-search-forward "[]>)?\"]" (line-end-position) 3 arg)
(if (looking-back "[]>)?\"]") (goto-char (- (point) 1)) )
)

(defun thing-copy-parenthesis-to-mark(&optional arg)
" Try to copy a parenthesis and paste it to the mark
When used in shell-mode, it will paste parenthesis on shell prompt by default "
(interactive "P")
(copy-thing 'beginning-of-parenthesis 'end-of-parenthesis arg)
(paste-to-mark arg))
;;绑定键
(global-set-key (kbd "C-c a")         (quote thing-copy-parenthesis-to-mark))


;;所有以上几个函数，都依赖于下面这三个基础函数，由他们三个负责完成实际的工作。

(defun get-point (symbol &optional arg)
"get the point"
(funcall symbol arg)
(point))

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
"copy thing between beg & end into kill ring"
(let ((beg (get-point begin-of-thing 1))
(end (get-point end-of-thing arg)))
(copy-region-as-kill beg end)))

(defun paste-to-mark(&optional arg)
"Paste things to mark, or to the prompt in shell-mode"
(let ((pasteMe 
(lambda()
(if (string= "shell-mode" major-mode)
(progn (comint-next-prompt 25535) (yank))
(progn (goto-char (mark)) (yank) )))))
(if arg
(if (= arg 1)
nil
(funcall pasteMe))
(funcall pasteMe))
))

;;C-f5 设置编译命令
;;f5 保存所有文件然后编译当前窗口文件
(defun du-onekey-compile ()
"Save buffers and start compile"
(interactive)
(save-some-buffers t)
(switch-to-buffer-other-window "*compilation*")
(compile compile-command))
(global-set-key [C-f5] 'compile)
(global-set-key [f5] 'du-onekey-compile)


(defun show-fly-err-at-point ()
  "If the cursor is sitting on a flymake error, display the
message in the minibuffer"
  (interactive)
  (let ((line-no (line-number-at-pos)))
    (dolist (elem flymake-err-info)
      (if (eq (car elem) line-no)
      (let ((err (car (second elem))))
        (message "%s" (fly-pyflake-determine-message err)))))))

(defun fly-pyflake-determine-message (err)
  "pyflake is flakey if it has compile problems, this adjusts the
message to display, so there is one ;)"
  (cond ((not (or (eq major-mode 'Python) (eq major-mode 'python-mode) t)))
    ((null (flymake-ler-file err))
     ;; normal message do your thing
     (flymake-ler-text err))
    (t ;; could not compile err
     (format "compile error, problem on line %s" (flymake-ler-line err)))))

(defadvice flymake-goto-next-error (after display-message activate compile)
  "Display the error in the mini-buffer rather than having to mouse over it"
  (show-fly-err-at-point))

(defadvice flymake-goto-prev-error (after display-message activate compile)
  "Display the error in the mini-buffer rather than having to mouse over it"
  (show-fly-err-at-point))

(defadvice flymake-mode (before post-command-stuff activate compile)
  "Add functionality to the post command hook so that if the
cursor is sitting on a flymake error the error information is
displayed in the minibuffer (rather than having to mouse over
it)"
  (set (make-local-variable 'post-command-hook)
       (cons 'show-fly-err-at-point post-command-hook))) 



;解决emacs shell 乱码
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);关闭customize窗口

;;    启动自动最大化
;;(setq initial-frame-alist '((top . 0) (left . 0) (width . 80) (height .25)))
;;----------日程安排和约会提醒配置----------
(setq todo-file-do "~/.todo/do")
(setq todo-file-done "~/.todo/done")
(setq todo-file-top "~/.todo/top")
;;设置日程安排模式(todo模式)
;;在do文件中每件事情分别属于一个category(种类)，加入事情的时候会让你选择属于哪个category，可以用todo-add-category命令来
;;新建一个category，category中的事件按重要性排列，最重要的事情放在最上面，加入的时候会有提示。top文件只显示每个category
;;里的第一件事情。
;;对于do文件，常用的命令如下
;; i 加入一件事情
;; e 编辑一件事情
;; k 删除一件事情，不加入done文件
;; d/f 删除完成的事情，同时加入done文件，可以加入评论
;; +/- 在不同的category之间切换
;; j 跳转到某个category
(setq appt-issue-message t)
;;打开约会提醒功能
;;M-x appt-add 加入新的约会提醒
;;M-x appt-delete 删除提醒
;;-------日程安排和约会提醒配置结束---------


;;-------日程安排和约会提醒配置结束---------
;;----------GNUS设置--------------------
(setq gnus-select-method '(nntp "news.yaako.com"))
(setq gnus-default-subscribed-newsgroups
  '( "cn.comp.os.linux")) ;;
;; (add-to-list 'gnus-secondary-select-methods '(nntp "www.baidu.com"))
;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.yourThirdProvider.net"))
;;想让 Gnus 在多个的服务器上取新闻
;;中文相关
(set-language-environment 'Chinese-GB)
(setq gnus-default-charset 'chinese-iso-8bit
   gnus-group-name-charset-group-alist '((".*" . chinese-iso-8bit))
   gnus-summary-show-article-charset-alist
       '((1 . chinese-iso-8bit)
         (2 . gbk)
         (3 . big5)
         (4 . utf-8))
   gnus-newsgroup-ignored-charsets
       '(unknown-8bit x-unknown iso-8859-1))
;;pop3设置
(setq mail-sources
       '((pop :server "pop3.163.com" ;; 在这里设置pop3服务器
       :user "conan128" ;; 用户名
;;       :port "110"
       :password "lisa16"))) ;; 密码
(setq gnus-secondary-select-methods '((nnfolder "")))
;;smtp设置
(setq user-full-name "longguosong") ;; 外发的邮件采用这个名字
(setq user-mail-address "conan128@163.com") ;;外发的邮件采用这个地址
(setq smtpmail-auth-credentials
      '(("smtp.163.com" ;; SMTP服务器
      25
      "conan128" ;; 用户名
      "lisa16"))) ;; 密码
(setq smtpmail-default-smtp-server "smtp.163.com")
(setq smtpmail-smtp-server "smtp.163.com")
(setq message-send-mail-function 'smtpmail-send-it)
(setq nnmail-expiry-wait 3);;Gnus 默认的保质期是7天，如果你觉得时间不合适，可以自己设置
(add-hook 'gnus-article-prepare-hook
          (lambda ()
            (setq fill-column 60)
            (gnus-article-fill-long-lines)))
;;让gnus把这种邮件排版整齐后再显示给我们看
(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)
;;将邮件的发出时间转换为本地时间
(gnus-add-configuration '(article
                          (vertical 1.0
                                    (summary .4 point)
                                    (article 1.0))))
;; 改变阅读新闻时窗口的布局，窗口划分为上4下6（比例）
(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))
;另外，有些用web方式发出的邮件里有html，加入下面的设置，只看其中的plain text部分：
(setq gnus-thread-sort-functions
      '(
        (not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)
        ))
;;排序
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; 有时订阅了很多新闻组，堆在一起不好管理。这个功能可以创建目录来分层管理
(setq gnus-read-newsrc-file nil  gnus-save-newsrc-file nil)
;;------------GNUS设置结束--------------------
;;=================================
;;session设置
;;(add-to-list 'load-path "~/.emacs.d/lgs")
;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)
;;忽略错误不报错 
(condition-case err
     (progn
     (require 'xxx) )
   (error
    (message "Can't load xxx-mode %s" (cdr err))))
;;自动插入
(setq auto-insert t)
(setq auto-insert-query t)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/insert/")
(define-auto-insert '("^build\\.xml\\'" . "Ant编译脚本") "build.xml") 
(require 'flyspell) ;;非常好用的英文的拼写检查

(require 'erc)
;; 将F9设置为打开Erc的快捷键
;;(global-set-key [F7] 'erc)

;; Ctrl-c-c 快速启动remember
;;(global-set-key "\C-cc" 'remember)
;;org-mode 自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;org-mode的源程序计算
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (C . t)
   ))
;;导出模式
(setq org-html-doctype "html5")
(setq org-html-xml-declaration nil)
(setq org-html-postamble nil)
(setq org-html-head "<link rel='stylesheet' href='http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css'>\n<link rel='stylesheet' href='http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css'>\n<script src='http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js'>\n</script><script src='http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js'></script>")


;; 防止org-mode在导出HTML时把行末的回车输出为空格
(defadvice org-html-paragraph (before fsh-org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let ((fixed-contents)
        (orig-contents (ad-get-arg 1))
        (reg-han "[[:multibyte:]]"))
    (setq fixed-contents (replace-regexp-in-string
                          ;; 这一行是匹配上一行末和下一行头都是中文的情况, 但是这样的话遇上"中文\nenglish"就仍然有空格
                          ;; (concat "\\(" reg-han "\\) *\n *\\(" reg-han "\\)")
                          (concat "\\(" reg-han "\\) *\n *")
                          "\\1" orig-contents))
    (ad-set-arg 1 fixed-contents)))

(defun my-org-screenshot (basename)
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq filename
        (concat (file-name-directory (buffer-file-name))
                "imgs/"
                (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))
  (call-process "screencapture" nil nil nil "-s" filename)
  (insert "#+CAPTION:")
  (insert basename)
  (insert "\n")
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))


;;todo的来源设置
(setq org-agenda-files (list "~/doc/org/linux.org"  
                     "~/doc/org/work.org"  
                     "~/doc/org/home.org"))
;;yasnippet

;;(yas-global-mode 1)
;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(setq yas/root-directory "~/.emacs.d/elpa/yasnippet-20161026.1601/snippets/") 
;;(yas/load-directory yas/root-directory)

(add-to-list 'load-path
             "~/.emacs.d/elpa/yasnippet-20161026.1601")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20161026.1601/snippets")

(setq yas/root-directory "~/.emacs.d/snippets/") 
(yas/load-directory yas/root-directory)


(provide 'mysettings)
