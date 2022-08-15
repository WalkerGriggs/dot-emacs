;;; configs/navigation.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(use-package counsel)

(use-package ivy
  :demand
  ;; :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
        ("M-x"     . counsel-M-x)
        ("C-x C-f" . counsel-find-file))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format ""
        ivy-initial-inputs-alist nil
        ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t . ivy--regex-plus))))

(use-package ivy-rich
  :init
  (add-hook 'minibuffer-setup-hook
            (lambda ()
              (setq tab-width 1)))

  (setq ivy-rich-display-transformers-list
        '(ivy-switch-buffer
          (:columns
           ((ivy-rich-candidate (:width 30))
            (ivy-rich-switch-buffer-size (:width 7))
            (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
            (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
            (ivy-rich-switch-buffer-project (:width 15 :face success))
            (ivy-rich-switch-buffer-path
             (:width
              (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
           :predicate (lambda (cand) (get-buffer cand))
           :delimiter "\t")

          counsel-M-x
          (:columns
           ((counsel-M-x-transformer (:width 40))
            (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))

          counsel-find-file
          (:columns
           ((ivy-read-file-transformer)
            (ivy-rich-counsel-find-file-truename))
           :delimiter "\t")))
  :config
  (ivy-rich-mode 1))

(use-package counsel-projectile
  :bind
  (:map ivy-mode-map
        ("C-c f" . counsel-projectile-find-file)))

(use-package eyebrowse
  :config
  (eyebrowse-mode t)
  (setq eyebrowse-mode-line-separator ", "
        eyebrowse-mode-line-style     'always
        eyebrowse-new-workspace       t
        eyebrowse-slot-format         "%s"
        eyebrowse-tagged-slot-format  "%t"))

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
