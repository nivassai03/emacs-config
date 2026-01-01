(use-package evil 
    :demand t
    :init
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    :config
    (evil-mode 1))


(use-package evil-collection
    :after evil
    :config
    (evil-collection-init))

(use-package windmove
  :ensure nil)


(use-package deadgrep)

(provide 'editor)
