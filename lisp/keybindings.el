(use-package which-key
  :demand t
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode 1))

(use-package general
  :config
  (general-evil-setup)
  (general-create-definer np/leader-keys
    :states '(normal visual motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (np/leader-keys
   "b" '(:ignore t :wk "Buffer")
   "f" '(:ignore t :wk "Files")
   "s" '(:ignore t :wk "Search")
   "c" '(:ignore t :wk "Code")
   "p" '(:ignore t :wk "Project")
   "w" '(:ignore t :wk "Windows")
   "j" '(:ignore t :wk "Jump"))

  ;; Buffers
  (np/leader-keys
    "bb" '(consult-buffer :wk "Switch buffer")
    "bk" '(kill-current-buffer :wk "Kill buffer")
    "bD" '(kill-buffer-and-window :wk "Kill buf+win")
    "bz" '(bury-buffer :wk "Bury buffer")
    "br" '(revert-buffer :wk "Revert buffer")
    "bS" '(save-some-buffers :wk "Save buffers"))

  ;; Popper
  (np/leader-keys
    "bp" '(popper-toggle :wk "Toggle popup")
    "bc" '(popper-cycle :wk "Cycle popups")
    "bt" '(popper-toggle-type :wk "Toggle type"))

  ;; 
  (np/leader-keys
    "ff" '(find-file :wk "Find file")
    "fr" '(consult-recent-file :wk "Recent file")
    "fs" '(save-buffer :wk "Save buffer"))

   ;; Windmove
  (np/leader-keys
    "wh" '(windmove-left :wk "Left")
    "wj" '(windmove-down :wk "Down")
    "wk" '(windmove-up :wk "Up")
    "wl" '(windmove-right :wk "Right")
    "wd" '(delete-window :wk "Delete window")
    "wD" '(delete-other-windows :wk "Delete others")
    "ws" '(split-window-below :wk "Split below")
    "wv" '(split-window-right :wk "Split right"))

  ;; Project
  (np/leader-keys
    "pp"  '(project-switch-project :wk "Switch project")
    "pf"  '(project-find-file :wk "Find file")
    "pD"  '(project-dired :wk "Dired")
    "pb"  '(project-switch-to-buffer :wk "Switch buffer")
    "pB"  '(consult-project-buffer :wk "Project buffers")
    "pk"  '(project-kill-buffers :wk "Kill project buffers")
    "pe"  '(project-eshell :wk "Eshell")
    "pg"  '(project-find-regexp :wk "Find regexp")
    "po"  '(:ignore t :wk "Open")
    "pofh" '(np/project-open-file-below :wk "File below")
    "pofv" '(np/project-open-file-right :wk "File right")
    "pobh" '(np/project-switch-buffer-below :wk "Buffer below")
    "pobv" '(np/project-switch-buffer-right :wk "Buffer right"))

  ;; Git
  (np/leader-keys
    "gs" '(magit-status :wk "Magit status")
    "gm" '(magit-dispatch :wk "Magit dispatch"))

  ;; Search
  (np/leader-keys
    "ss" '(consult-line :wk "Search buffer")
    "sS" '(consult-line-multi :wk "Search multi-buffer")
    "sg" '(consult-ripgrep :wk "Ripgrep")
    "si" '(consult-imenu :wk "Imenu")
    "sD" '(deadgrep :wk "Deadgrep"))

  ;; avy
  (np/leader-keys
    "jj" '(avy-goto-char-timer :wk "Jump (timer)")
    "jc" '(avy-goto-char :wk "Jump char")
    "jC" '(avy-goto-char-2 :wk "Jump char-2")
    "jl" '(avy-goto-line :wk "Jump line")
    "jw" '(avy-goto-word-1 :wk "Jump word"))

  ;; Code
  (np/leader-keys
    "cS" '(eglot :wk "Start LSP")
    "cQ" '(eglot-shutdown :wk "Stop LSP")
    "cR" '(eglot-reconnect :wk "Reconnect")

    "ca" '(eglot-code-actions :wk "Code actions")
    "cr" '(eglot-rename :wk "Rename")
    "cf" '(eglot-format :wk "Format buffer")

    "cd" '(xref-find-definitions :wk "Definition")
    "cD" '(eglot-find-declaration :wk "Declaration")
    "cI" '(xref-find-references :wk "References")
    "ct" '(xref-find-apropos :wk "Find symbol")

    "ce" '(flymake-show-buffer-diagnostics :wk "Diagnostics (buffer)")
    "cE" '(flymake-show-project-diagnostics :wk "Diagnostics (project)")
    "cn" '(flymake-goto-next-error :wk "Next diagnostic")
    "cp" '(flymake-goto-prev-error :wk "Prev diagnostic")))

(provide 'keybindings)
