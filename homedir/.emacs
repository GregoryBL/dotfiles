(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Turn off welcome screen
(setq inhibit-startup-screen t)

;; Set windmove keybinding
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; add better nix mode
 (add-to-list 'load-path "/Users/gbernsleone/.emacs.d/nix-mode")
 (load "nix-mode")

;; Set 80 character limit
(require 'whitespace)
(setq whitespace-line-column 79) ;; limit line length
(setq whitespace-style '(face lines-tail trailing tab-mark tabs))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; Set to use spaces
(setq-default indent-tabs-mode nil)

;; Set bash to use 2 spaces
(setq sh-basic-offset 2
      sh-indentation 2)

;; Set coffeescript to use 2 spaces
(setq coffee-tab-width 2)
(setq js-indent-level 2)

;; Set search to be case-insensitive
(setq case-fold-search t)

;; Turn off menu-bar-mode
(menu-bar-mode -1)

;; Sync the copy and paste buffer"
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; Set scroll bindings for magic mouse
(global-set-key (kbd "<mouse-4>") 'scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'scroll-up-line)
(global-set-key (kbd "C--") 'undo)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
    (lua-mode angular-mode groovy-mode markdown-mode dockerfile-mode yaml-mode json-mode color-theme-sanityinc-tomorrow coffee-mode)))
 '(require-final-newline (quote visit-save))
 '(scroll-bar-mode nil)
 '(xterm-mouse-mode t))

;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1d1f21" :foreground "#c5c8c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "nil" :family "Monaco")))))

;; set the mark ring to repeat with c-spc
(setq set-mark-command-repeat-pop 1)

;; set autosaves to a separate location
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.autosaves" t)))

(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist '(("." . "~/.emacs.autosaves"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups

(global-auto-revert-mode)
