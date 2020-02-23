;;; configs/evil.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package evil-surround
  :defer t
  :config
  (global-evil-surround-mode))

(use-package evil
  :config
  (evil-mode 1)

  (require 'evil-surround)

  (evil-set-initial-state 'vterm-mode 'emacs)

  (setq evil-default-cursor t
        evil-normal-state-cursor 'box
        evil-visual-state-cursor 'hollow)

  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "/") 'swiper)
    (define-key evil-normal-state-map (kbd "SPC SPC") 'counsel-M-x)))
;;; evil.el ends here
