;;; configs/org.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(setq
 org-ref-default-bibliography   '("~/Documents/braindump/biblio/papers.bib")
 bibtex-completion-bibliography '("/home/rubik/Documents/braindump/biblio/papers.bib")
 bibtex-completion-notes-path   '("/home/rubik/Documents/braindump/biblio/")
 bibtex-completion-pdf-field    "file"
 bibtex-completion-notes-template-multiple-files
 (concat
  "#+TITLE: ${title}\n"
  "#+ROAM_KEY: cite:${=key=}\n"
  "* TODO Notes\n"
  ":PROPERTIES:\n"
  ":Custom_ID: ${=key=}\n"
  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
  ":AUTHOR: ${author-abbrev}\n"
  ":JOURNAL: ${journaltitle}\n"
  ":DATE: ${date}\n"
  ":YEAR: ${year}\n"
  ":DOI: ${doi}\n"
  ":URL: ${url}\n"
  ":END:\n\n"
  ))

(use-package org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq org-roam-capture-templates
        '(("r" "bibliography reference" plain "%?"
           :if-new
           (file+head "biblio/${citekey}.org" "#+title: ${title}\n")
           :unnarrowed t))))

(use-package org-roam
      :ensure t
      :init
      (setq org-roam-v2-ack t)
      :config
      (setq org-roam-completion-system 'ivy
            org-roam-directory (file-truename "~/Documents/braindump"))
      (org-roam-setup)
      (require 'org-roam-protocol))


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

  (add-to-list 'org-structure-template-alist
               '("s" . "src"))

  (add-to-list 'org-structure-template-alist
               '("q" . "quote")))

(use-package org-bullets
  :commands (org-bullets-mode)
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;;; org.el ends here
