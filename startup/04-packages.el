;;; startup/04-packages.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, startup
;; This file is not part of GNU Emacs.

;;; Code

(load-config-file '("use-package"
                    "general"
                    "appearance"
                    "navigation"
                    "ibuffer"
                    "hydra"
                    "evil"
                    "git"
                    "org"
                    "terminals"
                    "whitespace"
                    "languages"
                    "pdf"
                    "erc"
                    "lsp")) ;; load the heaviest (and defered) package last

(provide '04-packages)
;;; 04-packages.el ends here
