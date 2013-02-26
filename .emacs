;Meta key is set to ALT
(set-keyboard-coding-system nil)
(setq mac-command-modifier 'meta)

;;;;Packages
(require 'package)
(package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;(require 'package)
;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;                         ("marmalade" . "http://marmalade-repo.org/packages/")
;                         ("melpa" .
;                         "http://melpa.milkbox.net/packages/")
;                        ))
;(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-ruby starter-kit-bindings)
;  "A list of packages to ensure are installed at lunch.")

;;;;THEMES
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'tango-dark t)
;(load-theme 'zenburn)
(load-theme 'solarized-dark t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(custom-safe-themes (quote
 ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6"
 "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
 "0bac11bd6a3866c6dee5204f76908ec3bdef1e52f3c247d5ceca82860cccfa9d"
 default)))
 '(initial-scratch-message "")
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work 
 '(elscreen-tab-background-face
   ((t (:background "gray90"))))
 '(elscreen-tab-control-face
   ((t (:background "gray90" :foreground "gray60"))))
 '(elscreen-tab-current-screen-face
   ((t (:background "blue80" :foreground "brown60"))))
 '(elscreen-tab-other-screen-face
   ((t (:background "gray10" :foreground "gray50"))))
 )

(add-hook 'ruby-mode-hook
          (lambda ()
            (hl-line-mode -1)
            (global-hl-line-mode -1))
          't)

;ElScreen
(global-set-key (kbd "<f9>") 'elscreen-create)
(setq elscreen-prefix-key (kbd "\C-t"))
(elscreen-start)

(set-default-font "Monospace-11")
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Monospace-13"))

;use Ibuffer
(defalias 'list-buffers 'ibuffer)

;make buffer switch command show suggestions
(setq make-backup-files nil) ; stop creating those backup~ files 0
(ido-mode 1)
(setq tab-width 2)
