;;; configs/terminals.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code
(use-package bash-completion
  :config (bash-completion-setup))

(use-package vterm
  :commands (vterm vterm-other-window))
;;; terminals.el ends here
