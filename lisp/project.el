(use-package project
    :ensure nil
    :config
    (setq project-switch-commands #'project-find-file)
    :config
    (defun np/project-switch-buffer-below ()
    (interactive)
    (let ((target-window (or (window-in-direction 'below)
                             (split-window-below))))
      (select-window target-window)
      (call-interactively #'project-switch-to-buffer)))

    (defun np/project-switch-buffer-right ()
    (interactive)
    (let ((target-window (or (window-in-direction 'right)
                             (split-window-right))))
      (select-window target-window)
      (call-interactively #'project-switch-to-buffer)))

    (defun np/project-open-file-below ()
    (interactive)
    (let ((target-window (or (window-in-direction 'below)
                             (split-window-below))))
      (select-window target-window)
      (call-interactively #'project-find-file)))

    (defun np/project-open-file-right ()
    (interactive)
    (let ((target-window (or (window-in-direction 'right)
                             (split-window-right))))
      (select-window target-window)
      (call-interactively #'project-find-file)))

    :general
    (np/leader-keys
    "pp"  #'project-switch-project
    "pf"  #'project-find-file
    "pD"  #'project-dired
    "pb"  #'project-switch-to-buffer
    "pk"  #'project-kill-buffers
    "pe"  #'project-eshell
    "pg"  #'project-find-regexp
    "po"  '(:ignore :wk "open")
    "pofh" '(np/project-open-file-below :wk "open file below")
    "pofv" '(np/project-open-file-right :wk "open file right")
    "pobh" '(np/project-switch-buffer-below :wk "open buffer below")
    "pobv" '(np/project-switch-buffer-right :wk "open buffer right")))
