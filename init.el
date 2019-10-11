;;; ahalya_init.el --- Emacs config file


;; User Details
(setq user-full-name "Ahalya Prabhakar")
(setq user-mail-address "ahalya.prabhakar@gmail.com")

(add-to-list 'load-path "~/.emacs.d/my-lisp")

;; Package Management
(require 'package)
;; (setq package-check-signature nil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

; Refresh Package List
; (package-refresh-contents)

; List packages I want

(setq package-list '(solarized-theme dracula-theme zenburn-theme auctex))

;; Initialize Packages
(package-initialize)

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; Start-up defaults
; Initial Start Screen
(setq inhibit-splash-screen t
      initial-scratch-message nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)

; Backup Files
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq tab-width 4)
(setq indent-tabs-mode nil)

;; Display Settings
;Theme
(load-theme 'dracula t)

(delete-selection-mode t)
(global-linum-mode 1)
(setq indicate-empty-lines t)
(show-paren-mode t)
;(whitespace-mode t)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Load additional .el files
(require 'misc-cmds)
