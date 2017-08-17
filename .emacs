(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   (quote
    ((c++-mode . "PPL")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)

(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
(desktop-read)
(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save "~/")))

(global-linum-mode 1)
(setq linum-format "%d ")

(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(ac-config-default)

(setq-default kill-whole-line t)

(require 'ppl_style)
(add-hook 'c++-mode-common-hook (lambda()(c-set-style "PPL")))

(set-default-font "-outline-Consolas-normal-normal-normal-mono-15-*-*-*-c-*-iso8859-1")

(define-key ctl-x-map "l" 'goto-line)

;(set-background-color "black")
;(set-foreground-color "white")

(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;(setq-default buffer-file-coding-system "unix")

(defadvice kill-ring-save (before slickcopy activate compile)  
  "When called interactively with no active region, copy a single line instead."  
  (interactive  
  (if mark-active (list (region-beginning) (region-end))  
    (list (line-beginning-position)  
          (line-beginning-position 2)))))  
(defadvice kill-region (before slickcut activate compile)  
  "When called interactively with no active region, kill a single line instead."  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
           (line-beginning-position 2)))))

