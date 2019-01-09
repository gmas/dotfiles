

;;; make sure emacs finds applications in /usr/local/bin
(setq exec-path (cons "/usr/local/bin" exec-path))

;;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;;;Add the souRce shipped with mu to load-path
(add-to-list 'load-path (expand-file-name "/usr/local/Cellar/mu/1.0/share/emacs/site-lisp/mu/mu4e"))

(require 'mu4e)
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

(setq mu4e-maildir "~/Maildir/" ;;; tell mu4e where my Maildir is
      mu4e-view-show-images t
      ;; tell mu4e how to sync email
      mu4e-get-mail-command "/usr/local/bin/mbsync --config ~/mbsync/.mbsyncrc -a"
      mu4e-show-images t
      mu4e-view-image-max-width 800
      mu4e-view-prefer-html t
      mu4e-update-interval 420
      mu4e-split-view 'vertical
      mu4e-headers-visible-columns 60
      mu4e-confirm-quit nil
      ;; tell mu4e to use w3m for html rendering
      ;;mu4e-html2text-command "/usr/local/bin/w3m -dump -T text/html"
      ;;w3m-command "/usr/local/bin/w3m"
      ;; This allows me to use 'helm' to select mailboxes
      mu4e-completing-read-function 'completing-read
      ;;rename files when moving. NEEDED FOR MBSYNC
      mu4e-change-filenames-when-moving t
      mu4e-headers-skip-duplicates t
      )

(add-hook 'mu4e-view-mode-hook
          (lambda()
            ;; try to emulate some of the eww key-bindings
            (local-set-key (kbd "<tab>") 'shr-next-link)
            (local-set-key (kbd "<backtab>") 'shr-previous-link)))

;;;If you’re using a dark theme, and the messages are hard to read, it can help to change the luminosity, e.g.:
(setq shr-color-visible-luminance-min 75)
(setq shr-use-fonts nil)

;; ;;; taken from mu4e page to define bookmarks
(add-to-list 'mu4e-bookmarks
             '("size:5M..500M"       "Big messages"     ?b))


;;; mu4e requires to specify drafts, sent, and trash dirs
;;; a smarter configuration allows to select directories according to the account (see mu4e page)
(setq user-mail-address "gmasgras@gmail.com"
      mu4e-drafts-folder "/gmail/[Gmail].Drafts"
      mu4e-sent-folder "/gmail/[Gmail].Sent Mail"
      mu4e-trash-folder "/gmail/[Gmail].Trash"
      mu4e-refile-folder "/gmail/[Gmail].All Mail"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;;; [Gmail]/All Mail
(setq mu4e-maildir-shortcuts
      '(
        ("/INBOX"                     . ?I)
        ("/gmail/INBOX"               . ?i)
        ("/gmail/[Gmail].All Mail"    . ?a)
        ("/gmail/[Gmail].Sent Mail"   . ?s)
        ("/gmail/[Gmail].Starred"     . ?*)
        ("/gmail/[Gmail].Trash"       . ?!)
        )
      )

;;; mue4-config.el ends here
