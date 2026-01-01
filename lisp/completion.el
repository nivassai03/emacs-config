(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

(use-package orderless
  :ensure t
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
  :general
  (:keymaps 'vertico-map
	    "<tab>" #'vertico-insert
	    "<escape>" #'keyboard-quit))

(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  (marginalia-align-offset -2)
  :init
  (marginalia-mode 1))


(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto nil)
  (corfu-cycle t)
  (corfu-preview-current nil)
  (corfu-quit-at-boundary nil)
  :general
  (general-define-key
   :keymaps '(prog-mode-map text-mode-map)
   :state '(insert)
   "C-SPC" #'completion-at-point)
  (:keymaps 'corfu-map
	    :states 'insert
	    "C-n" #'corfu-next
	    "TAB" #'corfu-next
	    "C-p" #'corfu-previous
	    "S-TAB" #'corfu-previous
	    "<escape>" #'corfu-quit
	    "<return>" #'corfu-insert
	    "M-d" #'corfu-show-documentation
	    "C-g" #'corfu-quit
	    "M-l" #'corfu-show-location))

;; One place only for C-SPC completion
(use-package emacs
  :ensure nil
  :general
  (general-define-key
   :keymaps '(prog-mode-map text-mode-map)
   :states '(insert)
   "C-SPC" #'completion-at-point))

;; Install company package for compay backends
(use-package company)

;; Completion backends for corfu
(use-package cape
  :hook
  (eglot-managed-mode . (lambda ()
			  (setq-local completion-at-point-functions
				      (list #'eglot-completion-at-point))))
  (prog-mode . (lambda ()
		 (setq-local completion-at-point-functions
			     (list
			      (cape-company-to-capf
			       (apply-partially #'company--multi-backend-adapter
						'(company-dabbrev-code company-keywords)))))))

  :init
  (add-hook 'emacs-lisp-mode-hook
	    (lambda ()
	      (setq-local completion-at-point-functions
			  (list (cape-capf-super #'elisp-completion-at-point
						 #'cape-elisp-symbol)))))
  (add-to-list 'completion-at-point-functions
	       (cape-capf-super
		#'cape-file
		#'cape-dabbrev)))


(use-package consult)

(provide 'completion)
