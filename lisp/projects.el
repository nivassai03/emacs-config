(use-package project
    :ensure nil
    :config
    (setq project-switch-commands #'project-find-file)
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
      (call-interactively #'project-find-file))))

(use-package transient)
(use-package magit
  :defer t
  :after transient)

(provide 'projects)
