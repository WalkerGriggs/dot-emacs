;;; babi/babi-theme.el -*- lexical-binding: t; -*-
;;
;; Keywords: babi, nano, themes
;; This file is not part of GNU Emacs.

;;; Code

(defun nano-modeline-compose (status name primary secondary)
  "Compose a string with provided information"
  (let* ((char-width    (window-font-width nil 'header-line))
         (window        (get-buffer-window (current-buffer)))
         (space-up       +0.15)
         (space-down     -0.20)
         (prefix (cond ((string= status "RO")
                        (propertize (if (window-dedicated-p)" -- " " RO ")
                                    'face 'nano-face-header-popout))
                       ((string= status "**")
                        (propertize (if (window-dedicated-p)" -- " " ** ")
                                    'face 'nano-face-header-critical))
                       ((string= status "RW")
                        (propertize (if (window-dedicated-p)" -- " " RW ")
                                    'face 'nano-face-header-faded))
                       (t (propertize status 'face 'nano-face-header-popout))))
         (maybe-evil-mode (when (bound-and-true-p evil-local-mode)
                      (propertize (evil-state-property evil-state :tag t)
                                  'face 'nano-face-header-default)))
         (left (concat
                (propertize name 'face 'nano-face-header-strong)
                (propertize " "  'face 'nano-face-header-default
                            'display `(raise ,space-down))
                (propertize primary 'face 'nano-face-header-default)))
         (right (concat secondary " "))
         (available-width (- (window-total-width)
                             (length prefix) (length left) (length right)
                             (/ (window-right-divider-width) char-width)))
         (available-width (max 1 available-width)))
    (concat prefix
            maybe-evil-mode
            left
            (propertize (make-string available-width ?\ )
                        'face 'nano-face-header-default)
            (propertize right 'face `(:inherit nano-face-header-default
                                               :foreground ,nano-color-foreground)))))

(provide 'babi-modeline)
;;; babi-modeline.el ends here
