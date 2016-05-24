;; Backups location
(defvar backup-dir "~/.emacs.d/backups/")
;; (setq backup-directory-alist (list (cons "." backup-dir)))
;; (setq make-backup-files nil)
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
    version-control t)       ; use versioned backups

;; TAB settings 
(setq-default
  tab-width 2
  standard-indent 2
  tab-always-indent `complete
  indent-tabs-mode nil)


(require 'package)

(setq package-archives
  '(("gnu"         . "http://elpa.gnu.org/packages/")
    ("melpa"       . "http://melpa.milkbox.net/packages/")))

(package-initialize)

; disable tab in evil-mode so that it works in org-mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode)
)

(use-package auto-complete
  :ensure t)
(ac-config-default)

(use-package magit
  :ensure t)
(use-package evil-magit
  :ensure t)
(evil-magit-init)

; Org-mode
; log time when setting to done
(setq org-log-done 'time)
(setq org-mobile-directory "~/Dropbox/notes")

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;set before elscreen-start
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-background-face ((t (:background "gray90"))))
 '(elscreen-tab-control-face ((t (:background "gray90" :foreground "gray60"))))
 '(elscreen-tab-current-screen-face ((t (:background "brown" :foreground "white"))))
 '(elscreen-tab-other-screen-face ((t (:background "gray10" :foreground "gray50"))))
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :foreground "brightred" :weight semi-bold))))
 '(flycheck-error ((t (:inherit (error default) :underline "red"))))
 '(flycheck-error-list-error ((t (:inherit error))))
 '(flycheck-error-list-highlight ((t (:inherit highlight :underline t)))))

;ElScreen
(use-package elscreen
  :ensure t
  ;; :init
  ;; ( ;; custom-set-faces was added by Custom.
  ;;   ;; If you edit it by hand, you could mess it up, so be careful.
  ;;   ;; Your init file should contain only one such instance.
  ;;   ;; If there is more than one, they won't work right.
  ;;   '(setq elscreen-tab-background-face ((t (:background "gray90"))))
  ;;   ;; '(elscreen-tab-control-face ((t (:background "gray90" :foreground "gray60"))))
  ;;   ;; '(elscreen-tab-current-screen-face ((t (:background "blue" :foreground "white"))))
  ;;   ;; '(elscreen-tab-other-screen-face ((t (:background "gray10" :foreground "gray50"))))
  ;; )
  :config
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
  (elscreen-start)
)

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

;; Smart meta-x
;; (ido-mode 1)
;; (use-package smex
;;   :ensure t
;;   :bind (("M-x" . smex))
;; )

(ido-mode 0)
(use-package helm-core
  :ensure t
)
(use-package helm
  :ensure t
  :init
        ;; (global-unset-key (kbd "C-x c"))
  :bind (
         ;; ("M-x"     . helm-M-x)
         ("C-c h"   . helm-command-prefix))
  :config (require 'helm-config)
          ;; (helm-mode 0)
)

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))
(ivy-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-indent-tabs-mode nil)
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "9ff70d8009ce8da6fa204e803022f8160c700503b6029a8d8880a7a78c5ff2e5" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "40c66989886b3f05b0c4f80952f128c6c4600f85b1f0996caa1fa1479e20c082" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(enh-ruby-indent-tabs-mode nil)
 '(evil-shift-width 2)
 '(js-indent-level 2)
 '(jsx-indent-level 2)
 '(jsx-use-auto-complete t)
 '(ruby-align-chained-calls t)
 '(ruby-align-to-stmt-keywords (quote (begin if def)))
 '(ruby-indent-tabs-mode nil))

(load-theme 'afternoon)

(use-package smart-mode-line
  :ensure t
  :config (sml/setup)
)

(setq show-paren-delay 0)
(show-paren-mode 1)

(use-package key-chord
  :ensure t
  :init
  (setq key-chord-two-keys-delay 0.5)
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
)

;(require 'rubocop)

(use-package flycheck
  :ensure t)
(use-package flycheck-color-mode-line
  :ensure t)
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(use-package flycheck-flow
  :ensure t)
(flycheck-add-next-checker 'javascript-eslint 'javascript-flow)
(load-library "flow-types")

; prevent scrolling half a page when hitting bottom
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

(use-package find-file-in-project
  :ensure t
  :bind ("C-x C-p" . find-file-in-project)
)

(setq column-number-mode t)
(setq linum-format "%d ")
(global-linum-mode)

(use-package simplenote2
  :ensure t
  :init
  (setq simplenote2-email "gmasgras@gmail.com")
  (setq simplenote2-password nil)
)
(simplenote2-setup)

(use-package counsel
  :ensure t
  :bind ("M-x" . counsel-M-x)
)

(use-package which-key
  :ensure t
  :config (which-key-mode)
)
; TODO load the rest of the packages with use-package
; edit-server
