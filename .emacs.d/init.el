;;; package --- summary
;;; Commentary:
;;; Code:

;; (set-frame-font "Source Code Pro")

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

(require 'surround)
(global-surround-mode 1)

;keymaps
(define-key evil-normal-state-map "L" 'end-of-line)
(define-key evil-visual-state-map "L" 'end-of-line)
(define-key evil-normal-state-map "H" 'back-to-indentation)
(define-key evil-visual-state-map "H" 'back-to-indentation)

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

(setq scroll-margin 10)
(setq scroll-step 1
      scroll-conservatively 10000)

;smooth scroll
;(require 'sublimity)
;(require 'sublimity-scroll)
;(sublimity-mode 1)

(require 'auto-complete)
    (global-auto-complete-mode t)
    (auto-complete-mode 1)
    (auto-insert-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(require 'magit)

(require 'git-gutter)
(global-git-gutter-mode +1)

(require 'ag)
(setq ag-highlight-search t)

;(eval-after-load "sgml-mode"
  ;'(define-key html-mode-map (kbd "C-c C-d") 'ng-snip-show-docs-at-point))

;TODO: setup clang autocomplete
;(require 'auto-complete-clang-async)

(helm-mode 1)

;(require 'ac-helm)

(projectile-global-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(flycheck-post-tip-timeout 10)
 '(paradox-github-token t))

;(require 'flycheck-tip)
;(define-key your-prog-mode (kbd "<tab>") 'flycheck-tip-cycle)

;(add-to-list 'auto-mode-alist (const (rx ".js" eos) 'js2-mode) ) 

;(add-hook 'js-mode-hook 'js2-minor-mode)
;(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq-default js2-show-parse-errors nil)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(font-lock-add-keywords 'js2-mode
			'(("\\<\\(TODO\\):"
			   1 font-lock-warning-face t)))

(add-hook 'js2-mode-hook 'color-identifiers-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

(setq-default js2-auto-indent-p nil)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
		 '(add-to-list 'ac-modes 'slime-repl-mode))

;Detect indentation
(require 'dtrt-indent)
(add-to-list 'dtrt-indent-hook-mapping-list
             '(js2-mode c/c++/java js2-basic-offset))
(dtrt-indent-mode t)
(setq dtrt-indent-min-indent-superiority 50)

;skewer
;(add-hook 'js2-mode-hook 'skewer-mode)
;(add-hook 'css-mode-hook 'skewer-css-mode)
;(add-hook 'html-mode-hook 'skewer-html-mode)

;(global-set-key [f5] 'slime-js-reload)
;(add-hook 'js2-mode-hook
;          (lambda ()
;            (slime-js-minor-mode 1)))

;(add-hook 'after-init-hook
	  ;#'(lambda ()
	      ;(when (locate-library "slime-js")
		;(require 'setup-slime-js))))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))


(global-undo-tree-mode)
(define-key evil-normal-state-map (kbd "<f4>") 'undo-tree-visualize)

;(require 'highlight-indentation)
;(highlight-indentation-mode)

(require 'highlight-parentheses)
(highlight-parentheses-mode)

;(add-to-list 'load-path 
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


(require 'ac-emmet)
(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)

(require 'smartparens-config)
(smartparens-global-mode t)

;scss-mode
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;sass-mode
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))

;less-mode
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

;jade-mode
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;;perspective-mode
(require 'perspective)
(persp-mode t)

(require 'persp-projectile)
;(define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)

(require 'multiple-cursors)
;TODO: fix
;(define-key evil-normal-state-map (kbd "C-d") 'mc/-mark-next-like-this)
;(global-set-key (kbd "C-d") 'mc/-mark-next-like-this)

(require 'expand-region)
(define-key evil-normal-state-map (kbd "RET") 'er/expand-region)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
;TODO: helm/projectile mappings
(evil-leader/set-key
  "r" 'helm-mini
  "s" 'helm-ag
  "f" 'helm-projectile)
;"b" 'switch-to-buffer)
;"e" 'find-file

;; TODO: fix docset list
(require 'helm-dash)
;; (add-to-list 'helm-dash-common-docsets '("jQuery"))
(setq-local helm-dash-docsets
	     '("jQuery"))

(setq helm-dash-min-length 2)
	     ;; '("AngularJS")
	     ;; '("JavaScript")
	     ;; '("NodeJS")
	     ;; '("Django"))

(require 'evil-visualstar)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

;(require 'evil-nerd-commenter)
;(define-key evil-normal-state-map "gcc" 'evilnc-comment-or-uncomment-to-the-line)
;(define-key evil-visual-state-map "gc" 'evilnc-comment-or-uncomment-lines)

(define-key evil-visual-state-map "gc" 'comment-or-uncomment-region)
(define-key evil-normal-state-map "gcc" (lambda ()
					 (interactive)
					 (let (beg end)
					   (if (region-active-p)
					       (setq beg (region-beginning) end (region-end))
					     (setq beg (line-beginning-position) end (line-end-position)))
					   (comment-or-uncomment-region beg end)
					   (next-line))))

;(require 'evil-exchange)
;(setq evil-exchange-key (kbd "zx"))
;(evil-exchange-install)

(require 'evil-args)
(define-key evil-inner-text-objects-map "," 'evil-inner-arg)
(define-key evil-outer-text-objects-map "," 'evil-outer-arg)
;; bind evil-forward/backward-args
;(define-key evil-normal-state-map "L" 'evil-forward-arg)
;(define-key evil-normal-state-map "H" 'evil-backward-arg)
;(define-key evil-motion-state-map "L" 'evil-forward-arg)
;(define-key evil-motion-state-map "H" 'evil-backward-arg)
;
;;; bind evil-jump-out-args
;(define-key evil-normal-state-map "K" 'evil-jump-out-args)


;(require 'indent-guide)
;(indent-guide-global-mode)
;(set-face-background 'indent-guide-face "dimgray")
;(setq indent-guide-char "|")

;TODO: fix mappings
;(require 'emmet-mode)
;(add-hook 'css-mode-hook 'emmet-mode)
;(add-hook 'html-mode-hook 'emmet-mode)
;(define-key global-map (kbd "c-space") 'newline-and-indent);auto indent

;; (setq tab-width 4)

(progn
  (menu-bar-mode -1);Hide GUI
  (tool-bar-mode -1)
  (set-scroll-bar-mode 'left)
					;(scroll-bar-mode -1)

					;No splash screen
  (setq inhibit-startup-screen t)

  (global-linum-mode 1);Display line numbers
  (define-key global-map (kbd "RET") 'newline-and-indent);auto indent

  ;; 					;(ido-mode t)
  ;; 					;(setq ido-enable-flex-matching t)
  ;; (require 'flx-ido)
  ;; (ido-mode 1)
  ;; (ido-everwhere 1)
  ;; (flx-ido-mode 1)
  ;; (setq flx-ido-use-faces nil)

  (require 'saveplace)
  (setq-default save-place t)

  (show-paren-mode 1)
  ;; (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
	x-select-enable-primary t
	save-interprogram-paste-before-kill t
	apropos-do-all t
	mouse-yank-at-point t
	save-place-file (concat user-emacs-directory "places")
	backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
