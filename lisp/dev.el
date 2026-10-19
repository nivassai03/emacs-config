;; parens
(use-package electric-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode)
  :config
  (setq electric-pair-pairs '((?\" . ?\") (?\{ . ?\}) (?\( . ?\)) (?\[ . ?\])))
  (setq electric-pair-skip-whitespace 'chomp)
  (setq electric-pair-preserve-balance nil))

(use-package show-paren
  :ensure nil
  :hook (prog-mode . show-paren-mode)
  :config
  (setq show-paren-delay 0)
  (setq show-paren-style 'parenthesis))

(use-package eglot
  :defer t
  :bind (("C-c l e" . eglot)           ; start eglot
         ("C-c l s" . eglot-shutdown)  ; stop
         ("C-c l r" . eglot-reconnect) ; restart
         ("C-c l a" . eglot-code-actions)
         ("C-c l R" . eglot-rename)))

(use-package treesit
  :defer t
  :init
  (setq treesit-font-lock-level 4
	c-ts-mode-indent-style 'bsd)

  ;; Emacs 29/30 versus 31+
  (if (>= emacs-major-version 31)
      (setq c-ts-indent-offset 4)
    (setq c-ts-mode-indent-offset 4))

  (setq-default indent-tabs-mode nil)

  :ensure nil
  :preface
  (defun np/setup-install-grammars ()
    "Install Tree-sitter grammars if they are absent."
    (interactive)
    (dolist (grammar
             '((cpp . ("https://github.com/tree-sitter/tree-sitter-cpp" "v0.23.0"))
               (c . ("https://github.com/tree-sitter/tree-sitter-c" "v0.23.0"))))
      (add-to-list 'treesit-language-source-alist grammar)
      (unless (treesit-language-available-p (car grammar))
        (treesit-install-language-grammar (car grammar)))))
  (dolist (mapping
	   '((c-mode . c-ts-mode)
	     (c++-mode . c++-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))
  :config
  (setq treesit-font-lock-level 4)
  (np/setup-install-grammars))

(use-package apheleia
  :demand t

  :config
  ;; Reuse the built-in clang-format command and
  ;; add Microsoft as the fallback style.
  (setf (alist-get 'clang-format-ms apheleia-formatters)
        (append
         (alist-get 'clang-format apheleia-formatters)
         '("--fallback-style=Microsoft")))

  ;; C/C++ Tree-sitter modes
  (setf (alist-get 'c++-ts-mode apheleia-mode-alist)
        'clang-format-ms)

  (setf (alist-get 'c-ts-mode apheleia-mode-alist)
        'clang-format-ms)

  ;; Format automatically on save
  (apheleia-global-mode 1)

  :bind
  ("C-c l f" . apheleia-format-buffer))

(use-package man
  :ensure nil
  :custom
  (Man-coding-system 'utf-8))


(provide 'dev)
