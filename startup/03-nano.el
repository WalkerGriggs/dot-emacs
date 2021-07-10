;;; startup/03-nano.el -*- lexical-binding: t; -*-
;;
;; Keywords: babi, nano, convenience, startup
;; This file is not part of GNU Emacs.

;;; Code

(add-to-list 'load-path "~/.emacs.d/nano")
(add-to-list 'load-path "~/.emacs.d/babi")

(add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
(add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-default"  . (lambda (args))))

;; (cond
;;  ((member "-default" command-line-args) t)
;;  ((member "-dark" command-line-args) (require 'nano-theme-dark))
;;  (t (require 'nano-theme-light)))

(require 'babi-theme-dark)

;; Default nano faces
(require 'nano-faces)
(nano-faces)

;; Default nano themes
(require 'nano-theme)
(nano-theme)

;; Nano frame layout
(require 'nano-layout)

;; Nano session saving (optional)
(require 'nano-session)

;; Nano header & mode lines (optional)
(require 'nano-modeline)
;; Nano key bindings modification (optional)
(require 'nano-bindings)

;; Nano counsel configuration (optional)
(require 'nano-counsel)

;; Overrides
(require 'babi-modeline)
(require 'babi-theme)
(babi-theme)

(provide '03-nano)
;;; 03-nano.el ends here
