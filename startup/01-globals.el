;;; startup/01-globals.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, startup
;; This file is not part of GNU Emacs.

;;; Code

(require 'no-littering nil :noerror)

(setq package-defer-time 3)

(setq ivy-height 10)
(setq user-full-name "Walker Griggs")

;; The default value is 0.8MB, which is just too small.
(setq gc-cons-threshold 50000000)

(setq initial-scratch-message "")
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

(setq make-backup-files nil)
(setq create-lockfiles nil)

(setq visible-bell nil)

(provide '01-globals)
;;; 01-globals.el ends here
