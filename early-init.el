(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(pixel-scroll-precision-mode 1)

(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t
      inhibit-splash-screen t
      use-file-dialog nil)

(setq gc-cons-threshold (* 256 1000 1000)
      gc-cons-percentage 0.8)

(setq package-enable-at-startup t)

