;;; configs/git.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

(use-package diff-hl
  :init (global-diff-hl-mode)
  :config (setq diff-hl-side 'right))


(use-package magit
  :hook (magit-mode . hl-line-mode)
  :config

  (use-package magit-commit
    :config
    (use-package git-commit))

  ;; Git Modes
  (use-package gitattributes-mode
    :mode ("/\\.gitattributes\\'"
           "/info/attributes\\'"
           "/git/attributes\\'"))

  (use-package gitconfig-mode
    :mode ("/\\.gitconfig\\'"
           "/\\.git/config\\'"
           "/modules/.*/config\\'"
           "/git/config\\'"
           "/\\.gitmodules\\'"
           "/etc/gitconfig\\'"))

  (use-package gitignore-mode
    :mode ("/\\.gitignore\\'"
           "/info/exclude\\'"
           "/git/ignore\\'")))
;;; git.el ends here
