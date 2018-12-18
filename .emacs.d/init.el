;;; init.el --- my emacs configuration

;;; Commentary:

;;; Code:
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("003a9aa9e4acb50001a006cfde61a6c3012d373c4763b48ceb9d523ceba66829" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "b563a87aa29096e0b2e38889f7a5e3babde9982262181b65de9ce8b78e9324d5" "8d5f22f7dfd3b2e4fc2f2da46ee71065a9474d0ac726b98f647bc3c7e39f2819" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" default)))
 '(package-selected-packages
   (quote
    (avy company-go yaml-mode company scribble-mode airline-themes powerline gnuplot-mode ag helm-ag helm-flycheck org-present magit markdown-mode markdown-mode+ markdownfmt expand-region helm-projectile projectile helm gruvbox-theme flymake-racket paredit racket-mode use-package flycheck flycheck-golangci-lint flycheck-gometalinter go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Enabel flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
	  '(javascript-jshint)))

;; Use eslint with web-mode for jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; Smooth scroll i.e., don't jump half pages
(setq scroll-step 1)

;; Colorz!
(load-theme 'gruvbox t)

;; Enable paredit for all kinds of lisps
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; Enable projectile and set keybindings
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Backup file settings
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;; Enable expand-region
(require 'expand-region)
(global-set-key (kbd "<f9>") 'er/expand-region)
(global-set-key (kbd "<f8>") 'er/contract-region)

;; Highlight current line
(global-hl-line-mode t)

;; Disable menu bar
(menu-bar-mode -1)

;; Status bar
(require 'powerline)
(require 'airline-themes)
(load-theme 'airline-powerlineish)
;; Fix glyphs
(setq powerline-utf-8-separator-left        #xe0b0
      powerline-utf-8-separator-right       #xe0b2
      airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)

;; Enable auto-completion
(require 'company)
(require 'company-go)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
;; Increase company-mode popup size
(setq company-tooltip-limit 20)
(global-set-key (kbd "C-M-i") 'company-complete)

;; Run goimport before saving file
(require 'go-mode)
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; Shift-Arrow window navigation
(windmove-default-keybindings)

;; Show line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Easymotion
(require 'avy)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(require 'markdown-mode)
(setq auto-mode-alist (append '(("\\.md.html\\'" . markdown-mode)) auto-mode-alist))

(provide 'init)
;;; init.el ends here
