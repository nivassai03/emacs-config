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


;; Install company package for compay backends
(use-package company)

;; Completion backends for corfu
(use-package cape
  :general
  ("M-p f" #'cape-file)
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


(use-package consult

  :demand t
  :init
  ;; (setq xref-show-xrefs-function #'consult-xref
  ;;       xref-show-definitions-function #'consult-xref)
  :general
  (np/leader-keys

    ;; Buffer
    "bb" '(consult-buffer :wk "Switch buffer")

    ;;File
    "fr" '(consult-recent-file :wk "Open Recent")

    ;;Project
    "pB" '(consult-project-buffer :wk "Switch buffer (Consult)")))


    
