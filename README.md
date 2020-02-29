<p align=center>
  <img alt="Emacs Logo" width="175" height="175" src="https://upload.wikimedia.org/wikipedia/commons/0/08/EmacsIcon.svg">
  <h2 align=center>dot-emacs</h2>
</p>

## Goals and Philosophy

These configs aim to provide sensible defaults, easy-to-remember bindings, and an overal smooth workflow. This project has one rule: keep it simple. If I don't use it, I don't configure it.

It's easy to get pulled into the trap of "configure all the things". Some projects get away with it, but they usually cater to a wider audience. These condigs are tailored to my workflow -- simple as that.

## Features

- [Hydra](https://github.com/abo-abo/hydra) menus for frequently used modes/packages
- [Eyebrowse](https://github.com/wasamasa/eyebrowse) for better window configuration
- [Ivy](https://github.com/abo-abo/swiper)(+ ivy-rich), ibuffer, and [counsel-projectile](https://github.com/ericdanan/counsel-projectile) for file navigation
- Basic [LSP modes](https://github.com/emacs-lsp/lsp-mode) for my "daily driver" languages
- Out of the box [evil-mode](https://github.com/emacs-evil/evil)

## Hydra Bindings

The Hydra bindings are simple `C-c` and some letter which best describes the mode (with a few exceptions for overlaps).

```elisp
  :bind (("C-c i" . hydra-erc/body)          ; 'i' for IRC
         ("C-c e" . hydra-eyebrowse/body)
         ("C-c j" . hydra-dumb-jump/body)
         ("C-c o" . hydra-org/body)
         ("C-c r" . hydra-hl-region/body)    ; 'r' for region
         ("C-c v" . hydra-vimish-fold/body)
         ("C-c w" . hydra-whitespace/body)))
```
