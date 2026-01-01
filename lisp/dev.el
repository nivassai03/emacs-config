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

(use-package dumb-jump
  :init
  (setq dumb-jump-prefer-searcher 'rg
        dumb-jump-force-searcher 'rg
        dumb-jump-selector 'xref))

(use-package xref
  :ensure nil
  :config
  (setq xref-backend-functions (remq 'etags--xref-backend xref-backend-functions))
  (add-to-list 'xref-backend-functions #'dumb-jump-xref-activate t))

(use-package treesit
  :defer t
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

(use-package semantic
  :ensure nil
  :config
  (require 'semantic/symref/grep)
  (dolist (entry '((c++-ts-mode . ("*.h" "*.hpp" "*.c" "*.cpp" "*.cc"))
                   (c-ts-mode    . ("*.h" "*.c"))
                   (python-ts-mode . ("*.py"))
                   (java-ts-mode . ("*.java"))))
    (add-to-list 'semantic-symref-filepattern-alist entry)))

(use-package eglot :defer t)

(use-package flymake :ensure nil)

(provide 'dev)
