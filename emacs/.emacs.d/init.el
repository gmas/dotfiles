;backups location
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

;; TAB settings 
(setq tab-width 2)
;(setq evil-want-C-i-jump nil)
(setq-default indent-tabs-mode nil)

(require 'package)

(setq package-archives
  '(("gnu"         . "http://elpa.gnu.org/packages/")
    ("melpa"       . "http://melpa.milkbox.net/packages/")))

(package-initialize)

; TODO add the rest of the packages
; elscreen
; helm
; smart-mode-line
; edit-server
; magit
; evil-magit


(when (not (package-installed-p 'evil))
  (package-refresh-contents)
    (package-install 'evil))

; Org-mode
; disable tab in evil-mode so that it works in org-mode
(setq evil-want-C-i-jump nil)
; log time when setting to done
(setq org-log-done 'time)
(setq org-mobile-directory "~/Dropbox/notes")
(evil-mode)

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

; ELScreen tab combos
(eval-after-load "evil-maps"
  (dolist (map '(evil-motion-state-map
                 evil-insert-state-map
                 evil-normal-state-map
                 evil-emacs-state-map))
;    (define-key (eval map) "\C-t" nil)))
    (define-key (eval map) (kbd "\C-t") 'elscreen-create)
    (define-key (eval map) (kbd "\C-n") 'elscreen-next)
    (define-key (eval map) (kbd "\C-p") 'elscreen-previous)))



;ElScreen
;(global-set-key (kbd "\C-n") 'elscreen-next)
;(global-set-key (kbd "<f9>") 'elscreen-create)
;(global-set-key (kbd "C-t") 'elscreen-create)
;;(global-set-key (kbd "C-n") 'elscreen-next)
;;(evil-make-override-map elscreen-next 'normal)
;(setq elscreen-prefix-key "\C-t")

;set before elscreen-start
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-background-face ((t (:background "gray90"))))
 '(elscreen-tab-control-face ((t (:background "gray90" :foreground "gray60"))))
 '(elscreen-tab-current-screen-face ((t (:background "blue" :foreground "white"))))
 '(elscreen-tab-other-screen-face ((t (:background "gray10" :foreground "gray50")))))
(elscreen-start)

;(defvar my-keys-minor-mode-map
;  (let ((map (make-sparse-keymap)))
;    (define-key map (kbd "C-t") 'elscreen-next)
;    map)
;  "my-keys-minor-mode keymap.")
;
;(define-minor-mode my-keys-minor-mode
;  "A minor mode so that my key settings override annoying major modes."
;  :init-value t
;  :lighter " my-keys")
;
;(my-keys-minor-mode 1)

(load-theme 'misterioso)

;disable menus
(menu-bar-mode -1)
(tool-bar-mode -1)


(add-to-list 'load-path "~/.emacs.d/lisp")
;(require 'edit-server)
;(edit-server-start)
(when (and (daemonp) (locate-library "edit-server"))
  (require 'edit-server)
  ;(setq edit-server-new-frame nil)
     (edit-server-start))

(ido-mode 0)
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(evil-shift-width 2)
 '(ruby-align-chained-calls t)
 '(ruby-indent-tabs-mode nil))

(sml/setup)
(evil-magit-init)

(add-to-list 'load-path "~/.emacs.d/rsense-mode")
(require 'rsense)
