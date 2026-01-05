(setq load-prefer-newer t)
(setq dotfiles-dir "~/.emacs.d/")
(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)

;; (setq mu4e-thread-folding-file (concat dotfiles-dir "mu4e-thread-folding.el"))
;; (load mu4e-thread-folding-file)
;; (add-to-list 'mu4e-header-info-custom
;;              '(:empty . (:name "Empty"
;;                                :shortname ""
;;                                :function (lambda (msg) "  "))))
;; (setq mu4e-headers-fields '((:empty . 2) ... ))
;; mu4e-thread-folding.el

;; (let  ((mu4e-config "~/.emacs.d/mu4e-thread-folding.el"))
;;   (when (file-exists-p mu4e-thread-folding)
;;    (load-file mu4e-thread-folding))
;;  )


(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(fset 'yes-or-no-p 'y-or-n-p)

;;disable menus, scrollbars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)

;;;disable bell
(setq ring-bell-function 'ignore)


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
        ("melpa"       . "http://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/"))
      )

(package-initialize)

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts
(use-package all-the-icons
  :ensure t
  )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package magit-popup
  :ensure t ; make sure it is installed
  :demand t ; make sure it is loaded
  )

(use-package magit
  :ensure t
  :bind (("C-c m" . magit-status)
         ("C-c M-m" . magit-file-dispatch))
  )

(use-package forge
  :ensure t
  :after magit)
;; (with-eval-after-load 'magit
;;   (require 'forge))


;; Fix related to https://github.com/emacs-evil/evil-collection/issues/60
(setq evil-want-keybinding nil)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  ;; (setq evil-want-keybinding nil) ;; needed by evil-collection
  (setq evil-want-C-i-jump nil) ;; disable tab in evil-mode so that it works in org-mode
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t)
(evil-collection-init)

(setq ac-disable-faces (quote (font-lock-comment-face font-lock-doc-face)))

(cond
 ((string-equal system-type "gnu/linux")
  (progn
    (add-to-list 'default-frame-alist
                 ;; '(font . "fira code retina-9"))
                 ;; '(font . "Source Code Pro-9:style=Regular"))
                 ;; '(font . "DejaVu Sans Mono-9:style=Regular")
                 ;; '(font . "Bitstream Vera Sans Mono-9:style=Regular"))
                 ;; '(font . "Cascadia Mono-10:style=SemiBold"))
                 '(font . "Cascadia Code PL-10:style=SemiBold"))
    ))
 ;; macOS (Darwin) configuration
 ((string-equal system-type "darwin")
  (add-to-list 'default-frame-alist '(font . "Cascadia Code-12"))))

(use-package transient
  :ensure t
  )

;;; Org-mode
;;; log time when setting to done
(global-set-key (kbd "C-c c")
                'org-capture)
(setq org-log-done 'time)
(setq org-directory "~/Documents/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-mobile-directory "~/Documents/org")
(setq org-agenda-files '("~/Documents/org/"))
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

(require 'org-capture)
(require 'org-protocol)
(setq org-capture-templates `(
                              ("a" "My TODO task format." entry
                               (file "todo.org")
                               "* TODO %?
                               SCHEDULED: %t")
                              ("i" "To Do Item" entry
                               (file+headline "todo.org" "To Do")
                               "* TODO %? %i\n%a\n%l" :prepend t)
                              ("t" "todo" entry (file+headline "todo.org" "To Do")
                               "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")
	                            ("p" "Protocol" entry (file+headline "todo.org" "Inbox")
                               "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	                            ("L" "Protocol Link" entry (file+headline "todo.org" "Inbox")
                               "* %? [[%:link][%:description]] \nSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"+0d\"))\nCaptured On: %U %?")
                              ))

(setq org-protocol-default-template-key "L")
;; (push '("L" "Link" entry (function org-handle-link)
;;         "* TODO %(org-wash-link)\nAdded: %U\n%(org-link-hooks)\n%?")
;;       org-capture-templates)


(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'exec-path "~/play/golang/bin")

;; GO MODE
;; Lock Go grammar to the revision that matches your Emacs
(add-to-list 'treesit-language-source-alist
             '(go "https://github.com/tree-sitter/tree-sitter-go" "v0.19.1"))
;; Auto-install the pinned grammar if it’s missing
(unless (treesit-language-available-p 'go)
  (treesit-install-language-grammar 'go))


;; --- Optional but strongly recommended ---------------------------
;; 1. Enable staticcheck, strip vendor dir, and use semantic tokens.
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(go-ts-mode . ("gopls" "-remote=auto"))))
(setq-default
 eglot-workspace-configuration
 '((gopls .
          ((staticcheck . t)
           (directoryFilters . ["-vendor"])
           (ui.semanticTokens . t)
           (ui.completion.usePlaceholders . t)))))


;; Always use Tree-sitter major mode for Go
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))
(setq auto-mode-alist
      (rassq-delete-all 'go-mod-ts-mode auto-mode-alist))

;; fix error with importing from internal
(with-eval-after-load 'flycheck
  (setq flycheck-go-vet-emacs
        '("go" "vet" "./...")))  ;; package-level vet


;; --- Tooltip docs next to cursor ---------------------------------
(use-package eldoc-box
  :ensure t
  :after (eldoc eglot)                    ;; load only after both
  ;; Enable in every buffer that Eglot manages *and* the frame can
  ;; display child-frames (GUI, not tty).
  :hook
  (eglot-managed-mode .
                      (lambda ()
                        (when (and (posframe-workable-p)     ;; child-frames available?
                                   (display-graphic-p))      ;; GUI? not tty/daemon
                          (eldoc-box-hover-at-point-mode 1)))
                      )
  :custom
  (eldoc-box-clear-with-C-g t)            ;; quit tooltip on C-g
  (eldoc-box-only-multi-line nil)         ;; show even 1-liners
  (eldoc-box-max-pixel-width 800)
  (eldoc-box-lighter " ⓘ"))               ;; tiny mode-line hint

;; Keep the inline parameter/type hints you already have
(add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode)


;; 2. Make sure Emacs sees the same PATH as your shell (macOS, GUI builds).
;;    (use-package exec-path-from-shell :config (exec-path-from-shell-initialize))
;;

;; (require 'edit-server)
;; (edit-server-start)
;; (when (and (daemonp) (locate-library "edit-server"))
;;   (require 'edit-server)
;;   ;(setq edit-server-new-frame nil)
;;   (edit-server-start))


;; Smart meta-x
;; (ido-mode 1)
;; (use-package smex
;;   :ensure t
;;   :bind (("M-x" . smex))
;; )

(ido-mode 0)
;; (use-package helm-core
;;   :ensure t
;; )
(use-package helm
  :ensure t
  :init
  ;; (global-unset-key (kbd "C-x c"))
  :bind (
         ;; ("M-x"     . helm-M-x)
         ("C-c h"   . helm-command-prefix))
  :config
  ;; (require 'helm-config)
  (helm-mode 0)
  )

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))

      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package consult
  :straight t
  :demand t
  :bind (("C-s" . consult-line)
         ("C-M-l" . consult-imenu)
         ("C-M-j" . persp-switch-to-buffer*)
         ("C-x b" . consult-buffer)
         ("C-c g" . consult-ripgrep))
  ;; :map minibuffer-local-map
  ;; ("C-r" . consult-history))
  )
;; :custom
;; (consult-project-root-function #'dw/get-project-root)
;; (completion-in-region-function #'consult-completion-in-region)
;; :config
;; (consult-preview-mode))

;; (setq ivy-use-selectable-prompt t)
;; (setq ivy-height 15)
;;(setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
;; (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
;; (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
;; (use-package ivy-prescient
;;   :ensure t
;;   :after counsel
;;   :custom
;;   (ivy-prescient-enable-filtering nil)
;;   :config
;;   ;; Uncomment the following line to have sorting remembered across sessions!
;;                                         ;(prescient-persist-mode 1)
;;   (ivy-prescient-mode 1))

(use-package vertico
  :ensure t
  :bind (:map vertico-map
              ("C-j" . vertico-next)
              ("C-k" . vertico-previous)
              ("C-f" . vertico-exit)
              :map minibuffer-local-map
              ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic)
                     (read-buffer-completion-ignore-case t))
  (completion-category-overrides '(
                                   (file (styles basic partial-completion))
                                   (file (styles basic-remote orderless))
                                   ))
  )

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))


(setq show-paren-delay 0)
(show-paren-mode 1)

(use-package key-chord
  :ensure t
  :init
  (setq key-chord-two-keys-delay 0.5)
  (setq key-chord-one-key-delay 0.5)
  ;;
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
;; (global-linum-mode -1)

(use-package request-deferred
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode)
  )

;; (use-package helm-ag
;;   :ensure t
;; )

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
	(yas-reload-all)
	(add-to-list 'yas-snippet-dirs "~/.emacs.d/plugins/yasnippet")
	(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
  )
(use-package yasnippet-snippets
  :ensure t)

(use-package flx
  :ensure t)

(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  )

(add-hook 'ediff-mode-hook 'ora-ediff-hook)
(add-hook 'prog-mode-hook 'electric-pair-local-mode)
;; might help with overzealous insertions of quotes before existing strings
(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package ample-theme
  :ensure t)

(use-package apropospriate-theme
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package ef-themes
  :ensure t)
(require 'ef-themes)
(load-theme 'ef-dream)

(use-package doric-themes
  :ensure nil
  :demand t
  :load-path "~/src/doric-themes/"
  )

;; (use-package reykjavik-theme
;;   :ensure t)

;;(load-theme 'apropospriate-dark)
;; (load-theme 'doom-one t)
;; (load-theme 'doom-monokai-ristretto)
;;(load-theme 'doom-spacegrey)
;;(load-theme 'doom-zenburn)
;; (load-theme 'reykjavik)
;; (load-theme 'eziam-dark)

(use-package go-mode
  :ensure t)

; TODO load the rest of the packages with use-package
; edit-server
(put 'narrow-to-region 'disabled nil)

;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; ;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)

;; ;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

;; (add-hook 'typescript-mode-hook #'setup-tide-mode)

;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (global-auto-complete-mode t)
;;     (add-to-list 'ac-modes 'terraform-mode)
;;     (add-to-list 'ac-modes 'yaml-mode)
;;   )
;; )

(use-package corfu
  :ensure t
  :custom
  ;; Use Corfu completion UI everywhere
  (global-corfu-mode t)
  ;; Optional: Enable auto completion
  (corfu-auto t)
  ;; Optional: Number of candidates to show
  ;; (corfu-count 10)
  ;; Optional: Enable cycling
  ;; (corfu-cycle t)
  ;; Optional: Configure auto completion delay
  ;; (corfu-auto-delay 0.2)
  :init
  (global-corfu-mode))

(use-package aggressive-indent
  :ensure t
  :hook (prog-mode . aggressive-indent-mode)
  )

(use-package dockerfile-mode
  :ensure t
  )

(use-package yaml-mode
  :ensure t
  )

(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  )
;;(org-superstar-configure-like-org-bullets)

;; (let  ((mu4e-config "~/.emacs.d/mu4econfig.el"))
;;   (when (file-exists-p mu4e-config)
;;     (load-file mu4e-config))
;;   )
;; (use-package mu4e-alert
;;   :ensure t
;;   :init
;;   (setq mu4e-alert-interesting-mail-query
;;         (concat
;;          "maildir:\"/gmail/INBOX\""
;;          " AND flag:unread")
;;         )
;;   )
;;(add-to-list 'mu4e-view-actions
;;             '("ViewInBrowser" . mu4e-action-view-in-browser) t)
;;
;;(add-to-list 'mu4e-view-actions
;;             '("XWidget View" . mu4e-action-view-with-xwidget) t)


(require 'cl)
(defun bk-kill-buffers (regexp)
  "Kill buffers matching REGEXP without asking for confirmation."
  (interactive "sKill buffers matching this regular expression: ")
  (cl-flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
    (kill-matching-buffers regexp)))

;;xwidgets swiped for somewhere
(defun my-mu4e-action-view-with-xwidget (msg)
  "View the body of the message inside xwidget-webkit."
  (bk-kill-buffers "^\*xwidget")
  (unless (fboundp 'xwidget-webkit-browse-url)
    (mu4e-error "No xwidget support available"))
  (let* ((html (mu4e-message-field msg :body-html))
         (txt (mu4e-message-field msg :body-txt))
         (tmpfile (format "%s%x.html" temporary-file-directory (random t))))
    (unless (or html txt)
      (mu4e-error "No body part for this message"))
    (with-temp-buffer
      ;; simplistic -- but note that it's only an example...
      (insert (or html (concat "<pre>" txt "</pre>")))
      (write-file tmpfile)
      (xwidget-webkit-browse-url (concat "file://" tmpfile) t))))

;; (add-to-list 'mu4e-view-actions
;;              '("xViewXWidget" . my-mu4e-action-view-with-xwidget) t)

(setq-default require-final-newline t) ;need to keep CRLF at EOF or it breaks configs
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Disable mouse wheel (and two finger swipe) scrolling
;;(mouse-wheel-mode -1)
;;(global-set-key [wheel-up] 'ignore)
;;(global-set-key [wheel-down] 'ignore)
;;(global-set-key [double-wheel-up] 'ignore)
;;(global-set-key [double-wheel-down] 'ignore)
(global-set-key [triple-wheel-up] 'ignore)
(global-set-key [triple-wheel-down] 'ignore)
(global-set-key [wheel-left] 'ignore)
(global-set-key [double-wheel-left] 'ignore)
(global-set-key [triple-wheel-left] 'ignore)
(global-set-key [wheel-right] 'ignore)
(global-set-key [double-wheel-right] 'ignore)
(global-set-key [triple-wheel-right] 'ignore)

;; define _ as word character so that changing inner words works like in vim
(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

;; define _ as word character so that hitting * to search words at cursor works like in vim
(defadvice evil-search-word-forward (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))

(add-to-list 'command-switch-alist '("diff" . command-line-diff))
;; saner ediff default
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-vertically)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;(add-hook 'ediff-before-setup-hook 'new-frame)
;;(add-hook 'ediff-quit-hook 'delete-frame)

;; unset C- and M- digit keys
(dotimes (n 10)
  (global-unset-key (kbd (format "C-%d" n)))
  (global-unset-key (kbd (format "M-%d" n)))
  )
;; set up my own map
(define-prefix-command 'bjm-map)
(global-set-key (kbd "M-1") 'bjm-map)
(global-set-key (kbd "C-1") 'bjm-map)
(define-key bjm-map (kbd "m") 'mu4e)

;;keybinding for favourite agenda view
;; http://emacs.stackexchange.com/questions/864/how-to-bind-a-key-to-a-specific-agenda-command-list-in-org-mode
(defun org-agenda-show-agenda-and-todo (&optional arg)
  (interactive "P")
  (org-agenda arg "n"))
(define-key bjm-map (kbd "a") 'org-agenda-show-agenda-and-todo)

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; GC twek
(use-package gcmh
  :ensure t
  :init (gcmh-mode 1))
(setq garbage-collection-messages t)
;; smooth scrolling
(pixel-scroll-precision-mode 1)


(defun override-org-level-faces ()
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4))
    (set-face-attribute face nil :weight 'normal
                        :height 1.0
                        :foreground (face-foreground 'default)
                        :background (face-background 'default))))
(add-hook 'org-mode-hook 'override-org-level-faces)

(defun my-inhibit-slow-modes ()
  "Counter-act a globalized mode."
  (add-hook 'after-change-major-mode-hook
            (lambda ()
              (beacon-mode -1)
              (flycheck-mode -1)
              (flycheck-color-mode-line-mode -1)
	            )
            :append :local))

(add-hook 'org-agenda-mode-hook 'my-inhibit-slow-modes)
(add-hook 'org-mode-hook 'my-inhibit-slow-modes)

;; (add-hook 'org-agenda-mode-hook
;;           '(lambda () (linum-mode -1))
;;           'append)


;; (setq org-agenda-custom-commands
;;       '("W" "Weekly review"
;;         agenda ""
;;         ((org-agenda-span 'week)
;;          (org-agenda-start-on-weekday 1)
;;          (org-agenda-start-with-log-mode t)
;;          (org-agenda-skip-function
;;           '(org-agenda-skip-entry-if 'nottodo 'done))
;;          )))
;;; init.el ends here
(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package keychain-environment
  :ensure t
  :init
  (keychain-refresh-environment)
  )

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(global-unset-key (kbd "C-x C-c"))

;; Shift + scroll to change font size
(global-set-key [S-mouse-4] 'text-scale-increase)
(global-set-key [S-mouse-5] 'text-scale-decrease)
;;; (ignore-errors (run-with-timer 0 180 'forge-pull))

(eval-after-load "evil-maps"
  (dolist (map '(evil-motion-state-map
                 evil-insert-state-map
                 evil-normal-state-map
                 evil-emacs-state-map))
                                        ;    (define-key (eval map) "\C-t" nil)))
    (define-key (eval map) (kbd "\C-t") 'tab-new)
    (define-key (eval map) (kbd "\C-n") 'tab-next)
    (define-key (eval map) (kbd "\C-p") 'tab-previous)
    )
  )

;; (require 'mu4e-thread-folding)
;; (add-to-list 'mu4e-header-info-custom
;;              '(:empty . (:name "Empty"
;;                                :shortname ""
;;                                :function (lambda (msg) "  "))))
;; (setq mu4e-headers-fields '((:empty         .    2)
;;                             (:human-date    .   12)
;;                             (:flags         .    6)
;;                             (:mailing-list  .   10)
;;                             (:from          .   22)
;;                             (:subject       .   nil)))
;;

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
  )

(use-package snow
  :ensure t)
;;setq zone-timer (run-with-idle-timer 600 t 'snow))

(use-package restclient
  :ensure t)

(use-package edit-server
  :ensure t)
(edit-server-start)
