;;; configs/ibuffer.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :init (setq ibuffer-filter-group-name-face '(:inherit (font-lock-string-face bold)))
  :config
  (use-package all-the-icons-ibuffer
    :init (all-the-icons-ibuffer-mode 1)))

(use-package ibuffer-projectile
  :functions all-the-icons-octicon ibuffer-do-sort-by-alphabetic
  :hook ((ibuffer . (lambda ()
                      (ibuffer-projectile-set-filter-groups)
                      (unless (eq ibuffer-sorting-mode 'alphabetic)
                        (ibuffer-do-sort-by-alphabetic)))))
  :config
  (setq ibuffer-projectile-prefix
        (concat
         (all-the-icons-octicon "file-directory"
                                :face ibuffer-filter-group-name-face
                                :v-adjust -0.05
                                :height 1.25)
         " ")))
;;; ibuffer.el ends here
