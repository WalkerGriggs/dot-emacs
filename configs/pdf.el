;;; configs/pdf.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :hook
  (pdf-view-mode . pdf-view-invert-colors)
  :init (pdf-tools-install)
  :preface
  (defun pdf-view-invert-colors()
    (interactive)
     (setq pdf-view-midnight-colors
           `(,(face-attribute 'default :foreground) .
             ,(face-attribute 'default :background)))
     (pdf-view-midnight-minor-mode 1))
  :custom
  (pdf-view-resize-factor 1.1)
  (pdf-view-display-size 'fit-page))
;;; pdf.el ends here
