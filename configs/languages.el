;;; configs/languages.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

;; Go
(use-package go-mode
  :defer package-defer-time ;; kick the load-time can.
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'gofmt-before-save)
              (setq tab-width 2)
              (setq indent-tabs-mode 1))))

;;; Ruby
(use-package ruby-mode
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode)

  :bind
  (([(meta down)] . ruby-forward-sexp)
   ([(meta up)]   . ruby-backward-sexp)))

;; Dockerfiles
(use-package dockerfile-mode
  :mode ("Dockerfile\\'" . dockerfile-mode))

;; Proto
(use-package protobuf-mode
  :mode ("\\.proto\\'" . protobuf-mode))

(use-package bazel
  :mode
  ("\\.bzl\\'" . bazel-starlark-mode)
  ("\\.bazel\\'" . bazel-starlark-mode))

;; Rust
(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

;; Markdown
(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
;;; languages.el ends here
