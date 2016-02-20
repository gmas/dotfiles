(require 'package)

(setq package-archives
  '(("gnu"         . "http://elpa.gnu.org/packages/")
    ("melpa"       . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (not (package-installed-p 'evil))
  (package-refresh-contents)
    (package-install 'evil))

(ido-mode 1)

(evil-mode)
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

;; TAB settings that don't work
;(setq tab-width 2)
;(setq evil-want-C-i-jump nil)

;(global-set-key (kbd "\C-n") 'elscreen-next)

;ElScreen
;;(global-set-key (kbd "C-n") 'elscreen-next)
;;(evil-make-override-map elscreen-next 'normal)
;(setq elscreen-prefix-key "\C-t")
;(global-set-key (kbd "<f9>") 'elscreen-create)
;(global-set-key (kbd "C-t") 'elscreen-create)

;set before elscreen-start
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
   ((t (:background "blue" :foreground "white"))))
 '(elscreen-tab-other-screen-face
   ((t (:background "gray10" :foreground "gray50"))))
 )
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
(menu-bar-mode 0)
