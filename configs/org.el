;;; configs/org.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (setq org-directory "~/Documents/notes/"
        org-startup-indented         t
        org-list-allow-alphabetical  t
        org-src-tabs-act-natively    t
        org-src-preserve-indentation t
        org-src-fontify-natively     t
        org-clock-persist            t
        org-clock-mode-line-total    'current)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "DONE(d)" "CANCELED(c)")))

  (setq org-todo-keyword-faces
        '(("TODO"     . org-todo)
          ("CANCELED" . org-archived)
          ("DONE"     . org-done)))

  (setq org-capture-templates
        '(("s" "Code Snippet" entry
         (file (lambda () (concat org-directory "snippets.org")))
         ;; Prompt for tag and language
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")))

  (add-to-list 'org-structure-template-alist
               '("s" "#+BEGIN_SRC ? \n\n#+END_SRC"))

  (add-to-list 'org-structure-template-alist
               '("q" "#+BEGIN_QUOTE ? \n\n#+END_QUOTE")))

(use-package org-bullets
  :commands (org-bullets-mode)
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;;; org.el ends here
