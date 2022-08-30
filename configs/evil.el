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
  (evil-set-initial-state 'pdf-view-mode 'emacs)
  (add-hook 'pdf-view-mode-hook
            (lambda ()
              (set (make-local-variable 'evil-emacs-state-cursor) (list nil))))

  (setq evil-default-cursor t
        evil-normal-state-cursor 'box
        evil-visual-state-cursor 'hollow)

  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "/") 'swiper)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

    (define-key evil-visual-state-map (kbd "SPC") 'hydra-main/body)
    (define-key evil-normal-state-map (kbd "SPC") 'hydra-main/body)))
;;; evil.el ends here
