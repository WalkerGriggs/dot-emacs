;;; babi/babi-theme-dark.el -*- lexical-binding: t; -*-
;;
;; Keywords: babi, nano, themes
;; This file is not part of GNU Emacs.

;;; Code

(require 'babi-base-colors)

(defun babi-theme-set-dark ()
  "Apply dark Babi theme base."
  (setq frame-background-mode      'dark)
  (setq nano-color-foreground  "#F8F8F2")
  (setq nano-color-background  "#282A36")
  (setq nano-color-highlight   "#3A3C4E")
  (setq nano-color-critical    "#F1FA8C")
  (setq nano-color-salient     "#BD93F9")
  (setq nano-color-strong      "#F1F2F8")
  (setq nano-color-popout      "#8BE9FD")
  (setq nano-color-subtle      "#4D4F68")
  (setq nano-color-faded       "#626483")

  (setq babi-color-cyan        "#8be9fd")
  (setq babi-color-green       "#50fa7b")
  (setq babi-color-orange      "#ffb86c")
  (setq babi-color-pink        "#ff79c6")
  (setq babi-color-purple      "#bd93f9")
  (setq babi-color-red         "#ff5555")
  (setq babi-color-yellow      "#f1fa8c"))

(babi-theme-set-dark)

(provide 'babi-theme-dark)
;;; babi-theme-dark.el ends here
