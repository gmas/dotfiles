(setq dotfiles-dir "~/.emacs.d/")
(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)

;; Backups location
(defvar backup-dir "~/.emacs.d/backups/")
;; (setq backup-directory-alist (list (cons "." backup-dir)))
;; (setq make-backup-files nil)
(setq
 auto-save-default nil
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
  indent-tabs-mode nil
  )


(require 'package)

(setq package-archives
  '(("gnu"         . "http://elpa.gnu.org/packages/")
    ("melpa"       . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

; disable tab in evil-mode so that it works in org-mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode)
)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'terraform-mode)
    (add-to-list 'ac-modes 'yaml-mode)
  )
)

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
(fset 'yes-or-no-p 'y-or-n-p)

;disable menus
(menu-bar-mode -1)
(tool-bar-mode -1)


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
  :bind (("C-s" . swiper)
         ("C-x C-f" . counsel-find-file))
)
(ivy-mode 1)


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
;(use-package flycheck-flow
;  :ensure t)
;(flycheck-add-next-checker 'javascript-eslint 'javascript-flow)
;(load-library "flow-types")

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

(use-package helm-ag
  :ensure t
)

(use-package terraform-mode
  :ensure t
)

(use-package yasnippet
  :ensure t
  :init
	(setq yas-indent-line (quote none))
	(add-hook 'prog-mode-hook #'yas-minor-mode)
	(add-hook 'yaml-mode-hook #'yas-minor-mode)
  :config
	(require 'yasnippet)
	(add-to-list 'yas-snippet-dirs "~/.emacs.d/plugins/yasnippet")
	(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
	(yas-reload-all)

)

(use-package flx
  :ensure t
)
(setq ivy-re-builders-alist
            '((t . ivy--regex-fuzzy)))

(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

(add-hook 'ediff-mode-hook 'ora-ediff-hook)

; TODO load the rest of the packages with use-package
; edit-server
