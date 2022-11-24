;;; configs/org.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.
(defconst _org-directory
  (file-truename "~/Documents/zet/")
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

(use-package org-web-tools
  :config
  (defun org-web-tools-insert-link-for-clipboard-url ()
    (interactive)
    (org-web-tools--org-link-for-url (org-web-tools--get-first-url))))

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
           "* TODO %?\n  %i\n  %a")
          ("b" "Bookmark (Clipboard)" entry (file+headline "~/Documents/org/bookmarks.org" "Bookmarks")
           "** %(org-web-tools-insert-link-for-clipboard-url)\n:PROPERTIES:\n:TIMESTAMP: %t\n:END:%?\n" :empty-lines 1 :prepend t)))

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
  :config
  (setq org-ref-pdf-directory        (file-truename "~/Documents/papers/")
        org-ref-default-bibliography _org-ref-bibtex-files))

(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :config
  (setq org-roam-directory         _org-roam-directory
        org-roam-completion-system 'ivy)

  (org-roam-setup)
  (require 'org-roam-protocol)

  (defun org-roam-index-nodes ()
    (interactive)
    (dolist (n1 (org-roam-node-list))
      (let* ((description (org-roam-node-formatted n1))
             (id (org-roam-node-id n1)))
        (progn
          (insert (concat (org-link-make-string
                           (concat "id:" id)
                           description) "\n"))
          (run-hook-with-args 'org-roam-post-node-insert-hook
                              id
                              description))))))

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
