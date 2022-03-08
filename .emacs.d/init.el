;-*- coding: utf-8-unix; -*-
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------
;(setq debug-on-error t)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    vue-mode
    zenburn-theme
    markdown-mode
    wc-mode
    yaml-mode
    neotree
    magit))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
;(server-start)
(column-number-mode t)
(blink-cursor-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'zenburn t) ;; load monokai theme
(global-linum-mode t) ;; enable line numbers globally
(global-hl-line-mode t)
(global-auto-revert-mode t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(ido-mode 1)

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                   "%b"))))

(define-key global-map "\C-cw" 'wc-count)

;; org-mode config
(load-file "~/.emacs.d/lisp/org-setup.el")

;; magit config
(load-file "~/.emacs.d/lisp/magit-setup.el")

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" default)))
 '(ein:url-or-port (quote ("http://127.0.0.1:8888")))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(initial-scratch-message nil)
 '(magit-diff-use-overlays nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-enforce-todo-dependencies t)
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (wc-mode monokai-theme yaml-mode monokai-theme markdown-mode magit better-defaults)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "PfEd" :slant normal :weight normal :height 140 :width normal)))))
