;;; package --- summary
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)
(load-theme 'noctilux t)

;keymaps
(define-key evil-normal-state-map "L" 'end-of-line)
(define-key evil-visual-state-map "L" 'end-of-line)
(define-key evil-normal-state-map "H" 'beginning-of-line)
(define-key evil-visual-state-map "H" 'beginning-of-line)

(define-key evil-normal-state-map "J" (lambda ()
                                        (interactive)
                                        (evil-next-line 5)))

(define-key evil-visual-state-map "J" (lambda ()
                                        (interactive)
                                        (evil-next-line 5)))

(define-key evil-normal-state-map "K" (lambda ()
                                        (interactive)
                                        (evil-previous-line 5)))

(define-key evil-visual-state-map "K" (lambda ()
                                        (interactive)
                                        (evil-previous-line 5)))


;(require 'sublimity)
;(require 'sublimity-scroll)
    ;(sublimity-mode 1)

(require 'auto-complete)
    (global-auto-complete-mode t)
    (auto-complete-mode 1)
    (auto-insert-mode 1)

(require 'magit)

(helm-mode 1)

(projectile-global-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

;(add-hook 'js-mode-hook 'js2-minor-mode)
;(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;(add-hook 'js2-mode-hook 'skewer-mode)
;(add-hook 'css-mode-hook 'skewer-css-mode)
;(add-hook 'html-mode-hook 'skewer-html-mode)

;(add-hook 'after-init-hook 'global-company-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


(global-undo-tree-mode)

(highlight-indentation-mode)

;(add-to-list 'load-path 
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;Detect indentation
(require 'dtrt-indent)
(dtrt-indent-mode 1)

(require 'smartparens-config)

;(add-hook 'js-mode-hook (lambda () (tern-mode t)))


(setq tab-width 4)

(progn
  (menu-bar-mode -1);Hide GUI
  (tool-bar-mode -1)
					;(scroll-bar-mode -1)

					;No splash screen
  (setq inhibit-startup-screen t)

  (global-linum-mode 1);Display line numbers
  (define-key global-map (kbd "RET") 'newline-and-indent);auto indent

					;(ido-mode t)
					;(setq ido-enable-flex-matching t)

  (require 'saveplace)
  (setq-default save-place t)

  (show-paren-mode 1)
					;(setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
	x-select-enable-primary t
	save-interprogram-paste-before-kill t
	apropos-do-all t
	mouse-yank-at-point t
	save-place-file (concat user-emacs-directory "places")
	backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
