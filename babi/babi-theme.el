;;; babi/babi-theme.el -*- lexical-binding: t; -*-
;;
;; Keywords: babi, nano, themes
;; This file is not part of GNU Emacs.

;;; Code

;; When we set a face, we take care of removing any previous settings
(defun set-face (face style)
  "Reset FACE and make it inherit STYLE."
  (set-face-attribute face nil
                      :foreground 'unspecified :background 'unspecified
                      :family     'unspecified :slant      'unspecified
                      :weight     'unspecified :height     'unspecified
                      :underline  'unspecified :overline   'unspecified
                      :box        'unspecified :inherit    style))

(defun babi-theme--font-lock ()
  (set-face-attribute 'font-lock-builtin-face nil
                      :foreground babi-color-orange)

  (set-face-attribute 'font-lock-constant-face nil
                      :foreground babi-color-cyan)

  (set-face-attribute 'font-lock-function-name-face nil
                      :foreground babi-color-green
                      :weight 'bold)

  (set-face-attribute 'font-lock-keyword-face nil
                      :foreground babi-color-pink
                      :weight 'bold)

  (set-face-attribute 'font-lock-negation-char-face nil
                      :foreground babi-color-cyan)

  (set-face-attribute 'font-lock-preprocessor-face nil
                      :foreground babi-color-orange)

  (set-face-attribute 'font-lock-regexp-grouping-backslash nil
                      :foreground babi-color-cyan)

  (set-face-attribute 'font-lock-regexp-grouping-construct nil
                      :foreground babi-color-purple)

  (set-face-attribute 'font-lock-string-face nil
                      :foreground babi-color-yellow)

  (set-face-attribute 'font-lock-type-face nil
                      :foreground babi-color-purple)

  (set-face-attribute 'font-lock-warning-face nil
                      :foreground babi-color-orange))

(defun babi-theme--ivy ()
  (with-eval-after-load 'ivy
    (set-face-attribute 'ivy-current-match nil
                        :foreground babi-color-pink
                        :weight 'bold)

    (set-face-attribute 'ivy-minibuffer-match-face-1 nil
                        :background nano-color-background)

    (set-face-attribute 'ivy-minibuffer-match-face-2 nil
                        :foreground nano-color-background
                        :background babi-color-green
                        :weight 'bold)

    (set-face-attribute 'ivy-minibuffer-match-face-3 nil
                        :foreground nano-color-background
                        :background babi-color-yellow)

    (set-face-attribute 'ivy-minibuffer-match-face-4 nil
                        :foreground nano-color-background
                        :background babi-color-pink)

    (set-face-attribute 'ivy-subdir nil
                        :foreground babi-color-yellow)))

(defun babi-theme()
  (babi-theme--font-lock)
  (babi-theme--ivy))

(provide 'babi-theme)
;;; babi-theme.el ends here
