(defun color-theme-icu ()
  (interactive)
  (color-theme-install
   '(color-theme-icu
      ((background-color . "#ffffff")
      (background-mode . light)
      (border-color . "#969696")
      (cursor-color . "#000000")
      (foreground-color . "#000000")
      (mouse-color . "black"))
     (fringe ((t (:background "#969696"))))
     (mode-line ((t (:foreground "#dedede" :background "#a1a1a1"))))
     (region ((t (:background "#fcf9d9"))))
     (font-lock-builtin-face ((t (:foreground "#858585"))))
     (font-lock-comment-face ((t (:foreground "#a1a1a1"))))
     (font-lock-function-name-face ((t (:foreground "#a72035"))))
     (font-lock-keyword-face ((t (:foreground "#9babbb"))))
     (font-lock-string-face ((t (:foreground "#c78129"))))
     (font-lock-type-face ((t (:foreground"#154b99"))))
     (font-lock-variable-name-face ((t (:foreground "#000000"))))
     (minibuffer-prompt ((t (:foreground "#2a7442" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-icu)