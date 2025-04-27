(use-package popper
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          "\\*Occur\\*"
          help-mode
          compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1)
  :config
  (defun popper-select-file-toggle ()
    "Open file with `project-find-file' in a popup."
    (interactive)
    (project-find-file t)
    (popper-toggle-type))
  :general
  (leader-keys
   "bp" '(:ignore t :wk "popper")
   "bpc" '(popper-cycle t :wk "cycle")
   "bpt" '(popper-toggle t :wk "toggle latest")
   "bpb" '(popper-toggle-type t :wk "toggle type")
   "bpB" '(popper-select-file-toggle t :wk "toggle file")
   "bpk" '(popper-kill-latest-popup t :wk "kill latest")))


(np/leader-keys
  "bz" #'bury-buffer
  "bS" #'save-some-buffers
  "bk" #'kill-current-buffer
  "bK" #'kill-buffer-and-window
  "bn" #'switch-to-next-buffer
  "bp" #'switch-to-previous-buffer
  "bl" #'evil-switch-to-windows-last-buffer
  "br" '(revert-buffer :wk "Revert")
  "bR" '(rename-buffer :wk "Rename"))
