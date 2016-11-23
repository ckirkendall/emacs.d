(setq ns-use-srgb-colorspace nil)

;; Remove the UI
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
(setq inhibit-startup-message t)
(set-fringe-mode '(1 . 1))
(setq use-dialog-box nil)

;; Make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:/Library/TeX/texbin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

;; Setup the package management
(require 'package)
(setq package-enable-at-startup nil)
(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Load the configuration
(let ((custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
      (user-config-file (expand-file-name (concat user-login-name ".el") user-emacs-directory)))
  (when (file-exists-p custom-file) (load custom-file))
  (dolist (dir (list "lisp" "config" user-login-name))
    (let ((config-dir (expand-file-name dir user-emacs-directory)))
      (when (file-exists-p config-dir)
        (add-to-list 'load-path config-dir)
        (mapc 'load (directory-files config-dir nil "^[^#].*el$")))))
  (when (file-exists-p user-config-file) (load user-config-file)))

;; Run the emacs server
(use-package server
  :if window-system
  :init (add-hook 'after-init-hook 'server-start t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (tangotango-theme tango-theme tango-dark-theme dockerfile-mode docker yaml-mode markdown-mode+ markdown-mode es-mode js2-mode emmet-mode web-mode latest-clojure-libraries slamhound cljsbuild-mode clj-refactor cider-eval-sexp-fu eval-sexp-fu cider clojure-mode-extra-font-locking clojure-mode company-quickhelp company-flx company elisp-slime-nav paredit smartscan rainbow-delimiters git-gutter-fringe git-gutter magit auto-indent-mode shell-pop transpose-frame buffer-move ibuffer-vc popwin powerline string-utils rainbow-mode solarized-theme projectile wgrep-ag ag goto-chg lorem-ipsum multiple-cursors avy browse-kill-ring undo-tree expand-region smex flx-ido ido-ubiquitous beginend reveal-in-osx-finder use-package)))
 '(shell-pop-shell-type
   (quote
    ("eshell" "*eshell*"
     (lambda nil
       (eshell shell-pop-term-shell)))))
 '(shell-pop-universal-key "M-`")
 '(shell-pop-window-position "top")
 '(shell-pop-window-size 100))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil
                         :stipple nil
                         :inverse-video nil
                         :box nil
                         :strike-through nil
                         :overline nil
                         :underline nil
                         :slant normal
                         :weight normal
                         :height 100
                         :width normal
                         :foundry "apple"
                         :family "Menlo"))))
 '(eval-sexp-fu-flash ((t (:foreground "green4" :weight bold))))
 '(linum ((t (:background "#2E3436"
                          :foreground "dark gray"
                          :underline nil
                          :weight normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark gray"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "turquoise1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "Magenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "Green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "Yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "cornflower blue"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "Red"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "Brown")))))



;; Custom Theam and Delimiters
(load-theme 'tango-dark 'no-confirm)

(global-linum-mode 1)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)
(set-default-font "inputMono-12")
