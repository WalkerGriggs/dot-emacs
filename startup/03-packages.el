;;; startup/03-packages.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, startup
;; This file is not part of GNU Emacs.

;;; Code

(load-config-file '("use-package"
                    "general"
                    "appearance"
                    "navigation"
                    "hydra"
                    "evil"
                    "git"
                    "org"
                    "terminals"
                    "whitespace"
                    "languages"
                    "erc"
                    "lsp")) ;; load the heaviest (and defered) package last

(provide '03-packages)
;;; 03-packages.el ends here
