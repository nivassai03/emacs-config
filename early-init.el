;; (push '(menu-bar-lines . 0) default-frame-alist)
;; (push '(tool-bar-lines . 0) default-frame-alist)
;; (push '(vertical-scroll-bars) default-frame-alist)


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(pixel-scroll-precision-mode 1)

(setq frame-inhibit-implied-resize t
      inhibit-splash-screen t
      use-file-dialog nil)

(setq gc-cons-threshold (* 256 1000 1000)
      gc-cons-percentage 0.8)

;; disable package.el to use elpaca
(setq package-enable-at-startup nil)
