;;; configs/hydra.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package hydra
  :bind
  ("C-c c" . hydra-main/body)
  ("C-c n" . hydra-navigation/body)
  :config
  (defhydra hydra-eyebrowse (:color teal :hint nil)
    ("r" eyebrowse-rename-window-config      "rename")
    ("c" eyebrowse-close-window-config       "close")
    ("'" eyebrowse-last-window-config        "last")
    ("a" eyebrowse-switch-to-window-config-1)
    ("s" eyebrowse-switch-to-window-config-2)
    ("d" eyebrowse-switch-to-window-config-3)
    ("f" eyebrowse-switch-to-window-config-4)
    ("g" eyebrowse-switch-to-window-config-5)
    ("h" eyebrowse-switch-to-window-config-6)
    ("j" eyebrowse-switch-to-window-config-7)
    ("k" eyebrowse-switch-to-window-config-8)
    ("l" eyebrowse-switch-to-window-config-9))

  (defhydra hydra-navigation (:color teal :hint nil)
    ("h"   windmove-left                     "window left")
    ("j"   windmove-down                     "window down")
    ("k"   windmove-up                       "window up")
    ("l"   windmove-right                    "window right")
    ("d"   split-window-below                "split below")
    ("f"   split-window-right                "split right")
    ("s"   delete-window                     "delete window"))

  (defhydra hydra-bm (:color teal :hint nil)
    ("t"   bm-toggle   "toggle")
    ("s"   bm-show     "show")
    ("a"   bm-show-all "show all")
    ("n"   bm-next     "next"))

  (defhydra hydra-dumb-jump (:color teal :hint nil)
    ("g"   dumb-jump-go                      "go")
    ("b"   dumb-jump-back                    "jump back")
    ("q"   dumb-jump-quick-look              "quick look")
    ("p"   dumb-jump-prompt                  "prompt"))

  (defhydra hydra-org(:color teal :hint nil)
    ("m i" org-italics-region-or-point       "italicize")
    ("m b" org-bold-region-or-point          "bold")
    ("m u" org-underline-region-or-point     "underline")
    ("m c" org-code-region-or-point          "code")
    ("c"   org-capture                       "capture"))

  (defhydra hydra-org-roam(:color teal :hint nil)
    ("n f" org-roam-node-find                "find node")
    ("n i" org-roam-node-insert              "insert node")
    ("c"   org-roam-capture                  "capture node")
    ("g"   org-roam-graph                    "graph nodes"))

  (defhydra hydra-vimish-fold (:color teal :hint nil)
    ("f"   vimish-fold                       "fold")
    ("u"   vimish-fold-unfold                "unfold")
    ("t"   vimish-fold-toggle                "toggle fold")
    ("r"   vimish-fold-delete                "remove fold"))

  (defhydra hydra-vimish-fold (:color teal :hint nil)
    ("h"   hl-region                          "highlight region")
    ("r"   hl-region-remove                   "remove highlight")
    ("R"   hl-region-remove-all               "remove all highlights")
    ("n"   hl-region-next-highlight           "goto next higlight")
    ("p"   hl-region-prev-highlight           "goto previous highlight"))

  (defhydra hydra-main (:color teal :hint nil)
    ("a"   counsel-projectile-find-file      "Projectile")
    ("s"   ivy-switch-buffer                 "Switch Buffer")
    ("d"   counsel-M-x                       "Command")
    ("f"   counsel-find-file                 "Find File")

    ("b"   hydra-bm/body                     "Bookmark")
    ("e"   hydra-eyebrowse/body              "Eyebrowse")
    ("n"   hydra-navigation/body             "Navigation")
    ("j"   hydra-dumb-jump/body              "Dumb-jump")
    ("r"   hydra-org-roam/body               "Org-roam")
    ("v"   hydra-vimish-fold/body            "Vimish-fold")))
;;; hydra.el ends here
