;;; ahalya_init.el --- Emacs config file


;; User Details
(setq user-full-name "Ahalya  Prabhakar")
(setq user-mail-address "ahalya.prabhakar@gmail.com")

;; Package Management
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-refresh-contents)

;; Initialize Packages
(package-initialize)


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
(linum-mode t)
(setq indicate-empty-lines t)
(show-paren-mode t)
;(whitespace-mode t)
