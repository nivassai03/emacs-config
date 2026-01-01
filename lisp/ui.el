(use-package modus-themes
  :demand t
  :config
  (setq modus-themes-to-toggle '(modus-operandi-tinted modus-vivendi)
        modus-themes-italic-constructs t
        modus-themes-bold-constructs t)
  (load-theme 'modus-operandi-tinted :no-confirm)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

(provide 'ui)
