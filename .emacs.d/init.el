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
    zenburn-theme
    markdown-mode
    wc-mode
    neotree))

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
(global-display-line-numbers-mode t) ;; enable line numbers globally
(global-hl-line-mode t)
(global-auto-revert-mode t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(ido-mode 1)

(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                   "%b"))))

(define-key global-map "\C-cw" 'wc-count)

;; org-mode config
(load-file "~/.emacs.d/lisp/org-setup.el")

;; magit config
;;(load-file "~/.emacs.d/lisp/magit-setup.el")

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
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(vc-make-backup-files nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(selectric-mode neotree wc-mode markdown-mode zenburn-theme better-defaults))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight normal :height 128 :width normal)))))
