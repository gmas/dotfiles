;;;Add the souRce shipped with mu to load-path

(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/mu4e/")) ;

;;; make sure emacs finds applications in /usr/local/bin
(setq exec-path (cons "/usr/local/bin" exec-path))

;;; require mu4e
(require 'mu4e)

;;; tell mu4e where my Maildir is
(setq mu4e-maildir "~/Maildir/")

;;; tell mu4e how to sync email
(setq mu4e-get-mail-command "/usr/local/bin/mbsync --config ~/mbsync/.mbsyncrc -a")

;;; tell mu4e to use w3m for html rendering
(setq mu4e-html2text-command "/usr/local/bin/w3m -T text/html")

;;rename files when moving
;;NEEDED FOR MBSYNC
(setq mu4e-change-filenames-when-moving t)

;;; sync email 
;;;(setq mu4e-update-interval 300)
(defvar mu4e-update-interval 300)

;; ;;; taken from mu4e page to define bookmarks
;; (add-to-list 'mu4e-bookmarks
;;              '("size:5M..500M"       "Big messages"     ?b))

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

;;;  "All Mail" "Deleted Items" "Drafts" "Important" "Sent Mail" "Starred"

(require 'org-mu4e)

;;; mue4-config.el ends here
