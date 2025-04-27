(use-package vertico
    :custom
    (vertico-resize t)
    (vertico-cycle nil)
    (vertico-grid-separator "       ")
    (vertico-grid-lookahead 50)
    (vertico-buffer-display-action '(display-buffer-reuse-window))

    :general
    (:keymaps 'vertico-map
	      "<tab>" #'vertico-insert
	      "<escape>" #'minibuffer-keyboard-quit
	      "<backspace>" #'vertico-directory-delete-char
	      "C-<backspace>" #'vertico-directory-delete-word
	      "RET" #'vertico-directory-enter
	      "C-i" #'vertico-quick-insert
	      "C-o" #'vertico-quick-exit
	      "M-G" #'vertico-multiform-grid
	      "M-F" #'vertico-multiform-flat
	      "M-R" #'vertico-multiform-reverse
	      "M-U" #'vertico-multiform-unobtrusive
	      "C-M-n" #'vertico-next-group
	      "C-M-p" #'vertico-previous-group)
    :init
    (vertico-mode)
    (vertico-multiform-mode))

(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  (marginalia-align-offset -2)
  :init
  (marginalia-mode))
  



(use-package savehist
    :ensure nil
    :init
    (savehist-mode))



(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
