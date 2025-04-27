(use-package avy
  :general
  (general-define-key
   :states 'normal
   "gs" '(nil :wk "avy search")
   "gss" #'avy-goto-char
   "gsf" #'avy-goto-char-2
   "gst" #'avy-goto-char-timer
   "gsl" #'avy-goto-line
   "gsj" #'avy-goto-line-below
   "gsk" #'avy-goto-line-above
   "gsW" #'avy-goto-word-0
   "gsw" #'avy-goto-word-1
   "gsE" #'avy-goto-word-0-above
   "gse" #'avy-goto-word-1-above
   "gsB" #'avy-goto-word-0-below
   "gsb" #'avy-goto-word-1-below))


(use-package xref
  :ensure nil
  :custom
  (xref-search-program 'rg)
  ;; (xref-show-definitions-function #'xref-show-definitions-completing-read)
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref)
  :general
  (np/leader-keys
   "sr" '(xref-find-references :wk "search references")
   "sd" '(xref-find-definitions :wk "search definitions")
   "sa" '(xref-find-apropos :wk "search apropos")))


(use-package dumb-jump
  :custom
  (dumb-jump-prefer-searcher 'rg)
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))


(use-package deadgrep
  :init
  :config
  :general
  (np/leader-keys
    :states '(normal visual)
    "sD" #'deadgrep)
  (general-define-key
   :states 'normal
   :keymaps 'deadgrep-mode-map
   "j" #'deadgrep-forward
   "k" #'deadgrep-backward
   "M-n" #'deadgrep-forward-filename
   "M-p" #'deadgrep-backward-filename
   "C-n" #'deadgrep-forward-match
   "C-p" #'deadgrep-backward-match))

(np/leader-keys
  :states '(normal visual)
  "ss" #'consult-ripgrep
  "sg" #'consult-grep
  "sG" #'consult-git-grep
  "sf" #'consult-find
  "sl" #'consult-line
  "sL" #'consult-line-multi
  "si" #'consult-imenu
  "sI" #'consult-imenu-multi)
