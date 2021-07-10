;;; babi/babi-base-colors.el -*- lexical-binding: t; -*-
;;
;; Keywords: babi, nano, themes
;; This file is not part of GNU Emacs.

;;; Code

(defgroup babi '()
  "Faces and colors for the babi emacs theme")

;; Derive our default color set from classic Emacs faces.
;; This allows dropping babi components into already themed Emacsen with varying
;; degrees of visual appeal.
;;
;; We memorize the default colorset in this var in order not to confuse
;; customize: the STANDARD argument of defcustom gets re-evaluated by customize
;; to determine if the current value is default or not.
(defvar babi-base-colors--defaults
  `((foreground . ,(face-foreground 'default nil t))
    (background . ,(face-background 'default nil t))
    (highlight . ,(face-background 'fringe nil t))
    (critical . ,(face-foreground 'error nil t))
    (salient . ,(face-foreground 'font-lock-keyword-face nil t))
    (strong . ,(face-foreground 'default nil t))
    (popout . ,(face-foreground 'font-lock-string-face nil t))
    (subtle . ,(face-background 'mode-line-inactive nil t))
    (faded . ,(face-foreground 'shadow nil t))))

(defun babi-base-colors--get (name)
  "Get default color associated with symbol NAME."
  (cdr (assoc name babi-base-colors--defaults)))

(defcustom babi-color-foreground (babi-base-colors--get 'foreground)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-background (babi-base-colors--get 'background)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-highlight (babi-base-colors--get 'highlight)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-critical (babi-base-colors--get 'critical)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-salient (babi-base-colors--get 'salient)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-strong (babi-base-colors--get 'strong)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-popout (babi-base-colors--get 'popout)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-subtle (babi-base-colors--get 'subtle)
  ""
  :type 'color
  :group 'babi)

(defcustom babi-color-faded (babi-base-colors--get 'faded)
  ""
  :type 'color
  :group 'babi)

(provide 'babi-base-colors)
;;; babi-base-colors.el ends here
