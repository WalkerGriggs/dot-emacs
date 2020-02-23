;;; configs/navigation.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(global-set-key (kbd "C-x h") 'windmove-left)
(global-set-key (kbd "C-x j") 'windmove-down)
(global-set-key (kbd "C-x k") 'windmove-up)
(global-set-key (kbd "C-x l") 'windmove-right)

(use-package ivy
  :demand
  ;; :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
        ("C-'" . ivy-avy)
        ("M-x" . counsel-M-x))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format ""
        ivy-initial-inputs-alist nil
        ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t . ivy--regex-plus))))

(use-package counsel-projectile
  :bind
  (:map ivy-mode-map
        ("C-c f" . counsel-projectile-find-file)))

(use-package vimish-fold
  :commands (vimish-fold-toggle
             vimish-fold))

;; hl-region
;; github.com/walkergriggs/hl-region
(use-package hl-region
  :load-path "hl-region" ;; or wherever it's cloned
  :commands (hl-region
             hl-region-remove))

(use-package dumb-jump
  :config (setq dumb-jump-selector 'ivy
                dumb-jump-aggressive t
                dumb-jump-confirm-jump-to-modified-file t))

;; navigation.el ends here
