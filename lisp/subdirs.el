
;;;;包含插件包
(defun my-add-subdirs-to-load-path (dir)
(let ((default-directory (concat dir "/")))
(setq load-path (cons dir load-path))
(normal-top-level-add-subdirs-to-load-path)))
(my-add-subdirs-to-load-path "~/.emacs.d/elpa/")
(provide 'subdirs)
