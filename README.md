<p align=center>
  <img alt="Emacs Logo" width="175" height="175" src="https://upload.wikimedia.org/wikipedia/commons/0/08/EmacsIcon.svg">
  <h2 align=center>dot-emacs</h2>
</p>

## Goals and Philosophy

These configs aim to provide sensible defaults, easy-to-remember bindings, and an overall smooth workflow. This project has one rule: keep it simple. If I don't use it, I don't configure it.

It's easy to get pulled into the trap of "configure all the things". Some projects get away with it, but they usually cater to a wider audience. These configs are tailored to my workflow -- simple as that.

## Features

- [Hydra](https://github.com/abo-abo/hydra) menus for frequently used modes/packages
- [Eyebrowse](https://github.com/wasamasa/eyebrowse) for better window configuration
- [Ivy](https://github.com/abo-abo/swiper)(+ ivy-rich), ibuffer, and [counsel-projectile](https://github.com/ericdanan/counsel-projectile) for file navigation
- Basic [LSP modes](https://github.com/emacs-lsp/lsp-mode) for my "daily driver" languages
- Out of the box [evil-mode](https://github.com/emacs-evil/evil)

## Hydra Bindings

The Hydra bindings are triggered by `SPC` in Evil normal mode, followed by some letter which best describes the mode (with the exceptions for a few overlaps).

My most used commands are at the top level; `counsel-M-x`, for example, is `SPC f`. Note, those bindings are all on the home row.

```elisp
  (defhydra hydra-main (:color teal :hint nil)
    ;; Most frequent commands
    ("a"   counsel-projectile-find-file      "Projectile")
    ("s"   ivy-switch-buffer                 "Switch Buffer")
    ("d"   counsel-M-x                       "Command")
    ("f"   counsel-find-file                 "Find File")

    ;; Sub-hydras
    ("e"   hydra-eyebrowse/body              "Eyebrowse")
    ("n"   hydra-navigation/body             "Navigation")
    ("j"   hydra-dumb-jump/body              "Dumb-jump")
    ("r"   hydra-org-roam/body               "Org-roam")
    ("v"   hydra-vimish-fold/body            "Vimish-fold")))
```
