;;; configs/appearance.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(tool-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)

(set-frame-font "IBM Plex Mono 11" nil t)

(use-package dracula-theme
  :init
  (when (not (member "dracula" (custom-available-themes)))
    (load-theme 'dracula t)))

(use-package all-the-icons
  :defer t
  :if window-system
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t)))

;;Idle Highlight
(use-package idle-highlight-mode
  :config (idle-highlight-mode 1)
  :init
  (dolist (hook '(prog-mode-hook conf-mode-hook))
    (add-hook hook #'idle-highlight-mode)))

;; Fringe
(use-package fringe
  :config
  (setq-default left-fringe-width  0
                right-fringe-width  5))

(use-package hlinum
  :init (hlinum-activate))

;; Scrall Bar
(use-package scroll-bar
  :config
  (scroll-bar-mode -1)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))
        mouse-wheel-progressive-speed nil))

;; Linum
(use-package linum
  :config
  (dolist (hook '(prog-mode-hook conf-mode-hook))
    (add-hook hook #'linum-mode))
  (setq linum-format "%d "
        column-number-mode t))

;; Smart Line Mode
(use-package smart-mode-line
  :init (add-hook 'after-init-hook 'sml/setup)
  :config (setq sml/theme 'respectful))

(use-package minions
  :config (minions-mode 1)
  (setq minions-mode-line-lighter "~"))

;;; appearance.el ends here
