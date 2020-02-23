;;; configs/hydra.el -*- lexical-binding: t; -*-
;;
;; Keywords: convenience, configs
;; This file is not part of GNU Emacs.

;;; Code

(use-package hydra
  :bind (("C-c e" . hydra-erc/body)
         ("C-c j" . hydra-dumb-jump/body)
         ("C-c o" . hydra-org/body)
         ("C-c r" . hydra-hl-region/body)
         ("C-c v" . hydra-vimish-fold/body)
         ("C-c w" . hydra-whitespace/body)))

(use-package major-mode-hydra
  :after hydra
  :preface
  (defun with-alltheicon (icon str &optional height v-adjust)
    "Displays an icon from all-the-icon."
    (s-concat (all-the-icons-alltheicon icon :v-adjust (or v-adjust 0) :height (or height 1)) " " str))

  (defun with-faicon (icon str &optional height v-adjust)
    "Displays an icon from Font Awesome icon."
    (s-concat (all-the-icons-faicon icon :v-adjust (or v-adjust 0) :height (or height 1)) " " str))

  (defun with-fileicon (icon str &optional height v-adjust)
    "Displays an icon from the Atom File Icons package."
    (s-concat (all-the-icons-fileicon icon :v-adjust (or v-adjust 0) :height (or height 1)) " " str))

  (defun with-octicon (icon str &optional height v-adjust)
    "Displays an icon from the GitHub Octicons."
    (s-concat (all-the-icons-octicon icon :v-adjust (or v-adjust 0) :height (or height 1)) " " str)))

(pretty-hydra-define hydra-erc
  (:hint nil :color teal :quit-key "q" :title (with-faicon "comments-o" "ERC" 1 -0.05))
  ("Action"
   (("d" erc-quit-server       "disconnect")
    ("j" erc-join-channel      "join")
    ("p" erc-part-from-channel "part")
    ("n" erc-channel-names     "names")
    ("u" my/erc-count-users    "users"))))

(pretty-hydra-define hydra-dumb-jump
  (:hint nil :color teal :quit-key "q" :title (with-faicon "location-arrow" "dump-jump" 1 -0.05))
  ("Action"
   (("g" dumb-jump-go         "go")
    ("b" dumb-jump-back       "jump back")
    ("q" dumb-jump-quick-look "quick look")
    ("p" dumb-jump-prompt     "prompt"))))

(pretty-hydra-define hydra-org
  (:hint nil :color teal :quit-key "q" :title (with-faicon "book" "Org" 1 -0.05))
  ("Action"
   (("m i" org-italics-region-or-point   "italicize")
    ("m b" org-bold-region-or-point      "bold")
    ("m u" org-underline-region-or-point "underline")
    ("m c" org-code-region-or-point      "code"))))

(pretty-hydra-define hydra-hl-region
  (:hint nil :color teal :quit-key "q" :title (with-faicon "pencil" "hl-region" 1 -0.05))
  ("Action"
   (("h" hl-region                "highlight region")
    ("r" hl-region-remove         "remove highlight")
    ("R" hl-region-remove-all     "remove all highlights")
    ("n" hl-region-next-highlight "goto next higlight")
    ("p" hl-region-prev-highlight "goto previous highlight"))))

(pretty-hydra-define hydra-vimish-fold
  (:hint nil :color teal :quit-key "q" :title (with-faicon "folder-open" "vimish-fold" 1 -0.05))
  ("Action"
   (("f" vimish-fold        "fold")
    ("u" vimish-fold-unfold "unfold")
    ("t" vimish-fold-toggle "toggle fold")
    ("r" vimish-fold-delete "remove fold"))))

(pretty-hydra-define hydra-whitespace
  (:hint nil :color teal :quit-key "q" :title (with-faicon "low-vision" "Whitespace" 1 -0.05))
  ("Action"
   (("w" whitespace-mode        "toggle whitespace mode")
    ("W" global-whitespace-mode "toggle global whitespace mode"))))
;;; hydra.el ends here
