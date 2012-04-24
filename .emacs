;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; George's .emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Marmalade

(load "~/.emacs.d/package")
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color Theming

(require 'color-theme)
(color-theme-arjen)
(ido-mode)
(set-default-font "Monospace-11")
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Monospace-13"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Path Info

(require 'cl)
(defvar emacs-root "/home/geomas/")

(labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))
  (add-path ".emacs.d/"))

(require 'tramp)
(setq tramp-default-method "scp")

;; PHP stuff
(setq show-paren-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/new.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; run php lint when press f8 key
;; php lint
(defun phplint-thisfile ()
(interactive)
(compile (format "php -l %s" (buffer-file-name))))
(add-hook 'php-mode-hook
'(lambda ()
(local-set-key [f8] 'phplint-thisfile)))
;; end of php lint