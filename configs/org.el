;;; configs/org.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.
(defconst _org-directory
  (file-truename "~/Documents/org/")
  "Base org directory")

(defconst _org-roam-directory
  (file-truename
   (file-name-as-directory (concat _org-directory "roam")))
  "Base org-roam directory.")

(defconst _org-ref-directory
  (file-truename
   (file-name-as-directory (concat _org-roam-directory "biblio")))
  "Base org-ref-bibliography directory")

(defconst _org-agenda-files
  (mapcar (lambda (x) (concat _org-directory x))
          '("agenda.org"))
  "List of all org agenda files")

(defconst _org-ref-bibtex-files
  (mapcar (lambda (x) (concat _org-ref-directory x))
          '("papers.bib"))
  "List of all org-ref bibtex files")

;;; Code
(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (setq org-directory                _org-directory
        org-startup-indented         t
        org-list-allow-alphabetical  t
        org-src-tabs-act-natively    t
        org-src-preserve-indentation t
        org-src-fontify-natively     t
        org-clock-persist            t
        org-clock-mode-line-total    'current
        org-agenda-files             _org-agenda-files)

  (setq org-todo-keywords
        '((sequence "TODO" "MEETING" "WAITING" "|" "DONE" "CANCELED")))

  (setq org-capture-templates
        '(("s" "Code Snippet" entry
           (file (lambda () (concat org-directory "snippets.org")))
           "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
          ("t" "Agenda TODO" entry
           (file (lambda () (concat org-directory "agenda.org")))
           "* TODO %?\n  %i\n  %a")))

  (setq org-agenda-clockreport-parameter-plist
        (quote
         (:scope file :maxlevel 2 :step day :tstart "<-5d>" :tend "<now>")))

  (add-to-list 'org-structure-template-alist
               '("s" . "src"))

  (add-to-list 'org-structure-template-alist
               '("q" . "quote")))

(use-package org-bullets
  :commands (org-bullets-mode)
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-ref
  :ensure t
  :config
  (setq org-ref-pdf-directory        (file-truename "~/Documents/papers/")
        org-ref-default-bibliography _org-ref-bibtex-files))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :config
  (setq org-roam-directory         _org-roam-directory
        org-roam-completion-system 'ivy)

  (setq org-roam-capture-templates '(("r" "bibliography reference" plain "%?"
                                      :if-new
                                      (file+head "biblio/${citekey}.org" "#+title: ${title}\n")
                                      :unnarrowed t)))
  (org-roam-setup)
  (require 'org-roam-protocol))

(use-package org-roam-bibtex
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq
   reftex-default-bibliography    _org-ref-bibtex-files
   bibtex-completion-bibliography _org-ref-bibtex-files
   bibtex-completion-notes-path   _org-ref-directory
   bibtex-completion-pdf-field    "file")

  (setq bibtex-completion-notes-template-multiple-files
        (concat
         "#+TITLE: ${title}\n"
         "#+ROAM_KEY: cite:${=key=}\n"
         ":PROPERTIES:\n"
         ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
         ":AUTHOR: ${author-abbrev}\n"
         ":JOURNAL: ${journaltitle}\n"
         ":DATE: ${date}\n"
         ":YEAR: ${year}\n"
         ":DOI: ${doi}\n"
         ":URL: ${url}\n"
         ":END:\n\n")))
;;; org.el ends here
