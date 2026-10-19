(use-package evil
  :ensure t
  :init
  (setopt evil-default-state 'emacs)
  (setopt evil-emacs-state-modes nil)
  (setopt evil-insert-state-modes nil)
  (setopt evil-motion-state-modes nil)
  (setopt evil-normal-state-modes nil)
  :hook
  (change-major-mode . evil-change-to-initial-state)

  (after-change-major-mode
   . (lambda ()
       (when (and (bound-and-true-p evil-local-mode)
                  (not buffer-read-only)
                  (not (evil-normal-state-p)))
         (evil-normal-state))))
  :config
  ;; Enable Vim navigation in documentation buffers
  (dolist (mode '(Man-mode
                  woman-mode
                  Info-mode
                  help-mode))
    (evil-set-initial-state mode 'motion))
  (evil-mode +1))

(with-eval-after-load 'man
  (evil-define-key 'motion Man-mode-map
    (kbd "q") #'Man-kill))

(use-package popper
  :demand t
  :bind
  (("C-`"   . popper-toggle)
   ("M-`"   . popper-cycle)
   ("C-M-`" . popper-toggle-type))

  :init
  (setq popper-reference-buffers
        '("^\\*Man "
          Man-mode
          help-mode
          compilation-mode))
  :custom
  (popper-window-height
   (lambda (_win)
     (floor (* 0.4 (frame-height)))))
  :config
  (popper-mode 1)
  (popper-echo-mode 1))

(use-package winner
  :ensure nil
  :demand t
  :config
  (winner-mode 1))

(use-package which-key
  :demand t
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode 1))

(provide 'keybindings)
