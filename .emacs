;-*- coding: utf-8-dos; -*-
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    monokai-theme
    magit))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
(server-start)
(line-number-mode t)
(blink-cursor-mode -1)

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'monokai t) ;; load monokai theme
(global-linum-mode t) ;; enable line numbers globally
(global-auto-revert-mode t)

(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                   "%b"))))

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type (quote bar))
 '(initial-scratch-message nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "simp" :slant normal :weight normal :height 120 :width normal)))))
