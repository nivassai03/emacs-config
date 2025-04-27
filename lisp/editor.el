(use-package evil 
    :demand t
    :init
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    :config
    (evil-mode))


(use-package evil-collection
    :after evil
    :config
    (evil-collection-init))

(use-package windmove
  :ensure nil
  :general
  (np/leader-keys
    :states '(normal visual)
    "wl" '(windmove-right :wk "move right")
    "wh" '(windmove-left :wk "move left")
    "wj" '(windmove-down :wk "move down")
    "wk" '(windmove-up :wk "move up")))


