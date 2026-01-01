(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :init
  (vertico-mode 1)
  :custom
  (vertico-resize t)
  (vertico-cycle nil)
  (vertico-grid-separator "       ")
  (vertico-grid-lookahead 50)
  (vertico-buffer-display-action '(display-buffer-reuse-window))
  :bind
  (:map vertico-map
        ("<tab>" . vertico-insert)
        ("<escape>" . keyboard-quit)))

(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  (marginalia-align-offset -2)
  :init
  (marginalia-mode 1))


(use-package corfu
  :demand t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  :bind
  (("M-RET" . completion-at-point)
   ("<escape>" . corfu-quit)))

(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

(provide 'completion)

