

;;; make sure emacs finds applications in /usr/local/bin
(setq exec-path (cons "/usr/bin" exec-path))

;;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;;;Add the souRce shipped with mu to load-path
(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/mu4e/"))

(require 'mu4e)
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

(setq mu4e-maildir "~/Maildir/" ;;; tell mu4e where my Maildir is
      ;; tell mu4e how to sync email
      mu4e-get-mail-command "/usr/bin/mbsync --config ~/mbsync/.mbsyncrc -a"
      mu4e-show-images t
      mu4e-view-image-max-width 800
      mu4e-view-prefer-html t
      mu4e-update-interval 420
      mu4e-headers-auto-update t
      mu4e-split-view 'vertical
      mu4e-headers-visible-columns 60
      mu4e-confirm-quit nil
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
(setq shr-use-fonts t)

;; ;;; taken from mu4e page to define bookmarks
(add-to-list 'mu4e-bookmarks
             '("size:5M..500M"       "Big messages"     ?b))

(add-to-list 'mu4e-bookmarks
             '( :name  "Bifrost-infra"
                :query "list:bifrost-infra.protocol.github.com"
                :key   ?B))


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
(setq mu4e-enable-async-operations t)
(setq mu4e-enable-notifications t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; For HTML mails
(setq
 ;; tell mu4e to use w3m for html rendering
 w3m-command "/usr/bin/w3m"
 mu4e-html2text-command "w3m -dump -T text/html -cols 72 -o display_link_number=true -o auto_image=true -o display_image=true -o ignore_null_img_alt=true"
 ;; enable inline images
 mu4e-view-show-images t
 mu4e-image-max-width 800
 mu4e-view-prefer-html t
 mu4e-use-fancy-chars t)

;; mu4e toggle html images
(defvar killdash9/mu4e~view-html-images nil
  "Whether to show images in html messages")

(defun killdash9/mu4e-view-toggle-html-images ()
  "Toggle image-display of html message."
  (interactive)
  (setq-local killdash9/mu4e~view-html-images (not killdash9/mu4e~view-html-images))
  (message "Images are %s" (if killdash9/mu4e~view-html-images "on" "off"))
  (mu4e-view-refresh))

(defun mu4e-shr2text (msg)
  "Convert html in MSG to text using the shr engine; this can be
used in `mu4e-html2text-command' in a new enough emacs. Based on
code by Titus von der Malsburg."
  (lexical-let ((view-images killdash9/mu4e~view-html-images))
               (mu4e~html2text-wrapper
                (lambda ()
                  (let ((shr-inhibit-images (not view-images)))
                    (shr-render-region (point-min) (point-max)))) msg)))

(define-key mu4e-view-mode-map "i" 'killdash9/mu4e-view-toggle-html-images)

(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(setq mu4e-view-use-gnus t)

;;; mue4-config.el ends here
