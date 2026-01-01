(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(unless (require 'use-package nil 'noerror)
  (package-refresh-contents)
  (package-install 'use-package)
  (require 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-expand-minimally t
      ring-bell-function 'ignore)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'core)
(require 'ui)
(require 'completion)
(require 'dev)
(require 'keybindings)
