;;; configs/lsp.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package lsp-mode
  :defer package-defer-time ;; kick the load-time can
  :config
  (add-hook 'ruby-mode-hook #'lsp)
  (add-hook 'go-mode-hook #'lsp))

(use-package company
  :defer package-defer-time
  :config
  (global-company-mode 1)
  (global-set-key (kbd "C-<tab>") 'company-complete))
;;; lsp.el ends here
