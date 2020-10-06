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

;; Auctex files
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; Org Config
(setq org-agenda-custom-commands
      '(("d" "Upcoming deadlines" agenda "" 
                ((org-agenda-time-grid nil)
                 (org-deadline-warning-days 365)        ;; [1]
                 (org-agenda-entry-types '(:deadline))  ;; [2]
                 ))
      ;; other commands go here
        ))

(add-to-list 'org-agenda-custom-commands
             '("A" "Agenda; only deadlines"
               agenda ""
               ((org-agenda-entry-types '(:deadline)))
               ))
(add-to-list 'org-agenda-custom-commands
      '("D" "Deadlines"
        tags "DEADLINE>=\"<today>\""))

(setq org-agenda-files (list "~/org-files"))

;; Load additional .el files
(require 'misc-cmds)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(org-agenda-files
 ;;   (quote
 ;;    ("~/ahalya/misc_stuff/industry_job_prep.org" "~/ahalya/misc_stuff/academic_job_prep.org" "~/ahalya/work_notes/research_todo.org")))
 ;; '(package-selected-packages
 ;;   (quote
 ;;    (## org-trello org-agenda-property jedi zenburn-theme solarized-theme gnu-elpa-keyring-update dracula-theme auctex)))
 ;; '(ring-bell-function (quote ignore))
 ;; '(show-paren-mode t)
 ;; '(tool-bar-mode nil)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

