;;; configs/erc.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package erc
  :defer t
  :bind (("C-c n" . erc-next-channel-buffer))
  :init
  (defun erc-count-users ()
    "Displays the number of users connected on the current channel."
    (interactive)
    (if (get-buffer "irc.freenode.net:6667")
        (let ((channel (erc-default-target)))
          (if (and channel (erc-channel-p channel))
              (message "%d users are online in %s"
                       (hash-table-count erc-channel-users)
                       channel)
            (user-error "The current buffer is not a channel")))
      (user-error "You must first start ERC")))

  (defun erc-preprocess (string)
    "Avoids channel flooding by remove hidden newlines."
    (setq str
          (string-trim
           (replace-regexp-in-string "\n+" " " str))))

  :config
  (erc-track-mode t)
  (add-hook 'erc-connect-pre-hook (lambda (x) (erc-update-modules)))

  (setq erc-kill-buffer-on-part        t
        erc-kill-queries-on-quit       t
        erc-kill-server-buffer-on-quit t

        erc-fill-column                98 ;; defaults to 78
        erc-fill-function              #'erc-fill-static
        erc-fill-static-center         18

        erc-track-excludes-types       '("JOIN" "NICK" "PART" "QUIT" "MODE")
        erc-server-coding-system       '(utf-8 . utf-8)

        erc-prompt (lambda () (concat "" (buffer-name) "]")))

  ;; Match notice and timestamp faces to comments.
  (let ((color (face-attribute 'font-lock-comment-face :foreground)))
    (set-face-attribute 'erc-notice-face nil :foreground color :weight 'normal)
    (set-face-attribute 'erc-timestamp-face nil :foreground color :weight 'bold)))

(use-package erc-hl-nicks
  :after erc)
;;; erc.el ends here
