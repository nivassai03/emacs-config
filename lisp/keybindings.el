(use-package which-key
    :ensure nil
    :init
    (setq which-key-idle-delay 0.5)
    :config
    (which-key-mode))

(use-package general
    :ensure (:wait t)
    :demand t
    :config
    (general-evil-setup)
    
    (general-create-definer np/leader-keys
        :states '(motion normal insert visual emacs)
        :keymaps 'override
        :prefix "SPC"
        :global-prefix "M-SPC")

    (general-define-key
        :keymaps '(prog-mode-map text-mode-map)
        :state '(insert)
        "C-SPC" #'completion-at-point)

        
    (np/leader-keys

      ;; Buffers
      "b" '(:ignore t :wk "Buffer")

      ;; Search
      "s" '(:ignore t :wk "Search")

      ;; Project
      "p" '(:ignore t :wk "Project")

      ;; Lsp
      "l" '(:ignore t :wk "Lsp")

      ;; Window
      "w" '(:ignore t :wk "Window")

      ;; Files
      "f" '(:ignore t :wk "File")
      "ff" '(find-file :wk "Open File")))
