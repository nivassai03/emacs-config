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


;; (use-package semantic
;;   :ensure nil
;;   :config
;;   (require 'semantic/symref/grep)
;;   (add-to-list 'semantic-symref-filepattern-alist
;;                '(c++-ts-mode . ("*.h" "*.hpp" "*.c" "*.cpp" "*.cc"))
;; 	       '(c-ts-mode . ("*.h" "*.c"))))

(use-package semantic
  :ensure nil
  :config
  (require 'semantic/symref/grep)
  (dolist (entry '((c++-ts-mode . ("*.h" "*.hpp" "*.c" "*.cpp" "*.cc"))
                   (c-ts-mode    . ("*.h" "*.c"))
                   (python-ts-mode . ("*.py"))
                   (java-ts-mode . ("*.java"))))
    (add-to-list 'semantic-symref-filepattern-alist entry)))


;; (use-package dumb-jump
;;   :after xref
;;   :config
;;   (add-hook 'xref-backend-functions  #'dumb-jump-xref-activate))

(use-package eglot
  :defer t
  :general
  (np/leader-keys
    :states '(normal visual)
    :keympas 'eglot-mode-map
    "ls" '(eglot :wk "start lsp")
    "lq" '(eglot-shutdown :wk "shutdow lsp")
    "lQ" '(eglot-shutdown-all :wk "shutdown all lsp")
    "lR" '(eglot-rename :wk "rename symbol")
    "la" '(eglot-code-actions :wk "code actions")
    "lf" '(eglot-format :wk "format buffer")
    "ld" '(eglot-find-declaration :wk "find declaration")
    "lD" '(xref-find-definitions :wk "find definition")
    "lr" '(xref-find-references :wk "find references")
    ))

(use-package flymake)

(use-package transient)

(use-package magit
  :defer t
  :after transient)
