(use-package gcmh
  :demand t
  :config
  (setopt gcmh-high-cons-threshold (* 256 1000 1000)
	  gcmh-low-cons-threshold (* 16 1000 1000)
	  gcmh-idle-delay 3
	  gc-cons-percentage 0.2)
  (gcmh-mode 1))

(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'forward))



(use-package no-littering
  :config
  (setq backup-directory-alist `((".*" . (no-littering-expand-var-file-name "backup/")))
	auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))



(use-package emacs
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
  (setq enable-recursive-minibuffers t
	initial-scratch-message nil
	sentence-end-double-space nil
	backup-by-copying t
	set-charset-priority 'unicode
	show-trailing-whitespace t
	user-full-name "Nivas Pvs")
  (defalias 'yes-or-no-p 'y-or-n-p)
  :config
  (global-display-line-numbers-mode)
  (add-hook 'emacs-startup-hook
            (lambda ()
              (message "Emacs loaded in %.2f seconds with %d garbage collections."
                       (float-time (time-subtract after-init-time before-init-time))
                       gcs-done))))

(use-package popper
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          "\\*Occur\\*"
          help-mode
          compilation-mode))
  :config
  (popper-mode 1)
  (popper-echo-mode 1))


(provide 'core)
