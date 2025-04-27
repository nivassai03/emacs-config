(use-package gcmh
  :config
  (setopt gcmh-high-cons-threshold (* 256 1000 1000))
  (setopt gcmh-low-cons-threshold (* 16 1000 1000))
  (setopt gcmh-idle-delay 3)
  (setopt gc-cons-percentage 0.2)
  (add-hook 'elpaca-after-init-hook #'gcmh-mode))


(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'forward))


(use-package emacs
  :demand t
  :ensure nil
  :init
  (set-face-attribute 'default nil
		      :family "JetBrains Mono"
		      :height 120)
  (set-face-attribute 'fixed-pitch nil
		      :family "JetBrains Mono"
		      :height 120)
  (set-face-attribute 'variable-pitch nil
		      :family "Cantarell"
		      :height 130)
  (setq enable-recursive-minibuffers t)
  (setq initial-scratch-message nil)
  (setq sentence-end-double-space nil)
  (setq backup-by-copying t)
  (setq set-charset-priority 'unicode)
  (setq show-trailing-whitespace t)
  (setq user-full-name "Nivas Pvs")
  (defalias 'yes-or-no-p 'y-or-n-p)
  :config
  (global-display-line-numbers-mode)
  (add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %.2f seconds with %d garbage collections."
                     (float-time (time-subtract after-init-time before-init-time))
                     gcs-done))))

(use-package no-littering
  :config
  (setq backup-directory-alist `((".*" . (no-littering-expand-var-file-name "backup/")))
	auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))


(use-package modus-theme
  :ensure nil
  :init
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs t)
  (setq modus-themes-to-toggle '(modus-operandi-tinted modus-vivendi))
  (load-theme `modus-operandi-tinted t)
  (defun np/toggle-modus-themes ()
    (interactive)
    (modus-themes-toggle))

  :bind ("<f5>" . np/toggle-modus-themes))
