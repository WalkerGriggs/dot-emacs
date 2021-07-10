;;; configs/general.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

;; Tabs
(setq-default indent-tabs-mode nil) ;; Always spaces

;; UTF8
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; General Necessities
(fset 'yes-or-no-p 'y-or-n-p)

;; Clipboard and Selection Mode
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Text mode hooks
(add-hook 'text-mode-hook 'visual-line-mode)
;;; general.el ends here
