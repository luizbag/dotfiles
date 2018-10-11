;-*- coding: utf-8-unix; -*-
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------
;(setq debug-on-error t)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    monokai-theme
    markdown-mode
    yaml-mode
    magit))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
;(server-start)
(line-number-mode t)
(column-number-mode t)
(blink-cursor-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cursor-type (quote bar))
 '(initial-scratch-message nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-enforce-todo-dependencies t)
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (markdown-mode+ markdown-mode selectric-mode py-autopep8 monokai-theme magit flycheck elpy conda better-defaults)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'monokai t) ;; load monokai theme
(global-linum-mode t) ;; enable line numbers globally
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

;; org-mode config
(load-file "~/.emacs.d/lisp/org-setup.el")

;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 98 :width normal)))))
