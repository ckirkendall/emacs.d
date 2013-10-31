(require-package 'auto-indent-mode)
(require-package 'rainbow-delimiters)

(after 'lisp-mode
  (defun lisp-editing-setup ()
    (paredit-mode +1)
    (show-paren-mode)
    (rainbow-delimiters-mode)
    (subword-mode))

  (defun lisp-mode-setup ()
    (auto-indent-mode)
    (whitespace-mode)
    (lisp-editing-setup))

  (add-hook 'lisp-mode-hook 'lisp-mode-setup)
  (add-hook 'emacs-lisp-mode-hook 'lisp-mode-setup)
  (add-hook 'lisp-interaction-mode-hook 'lisp-editing-setup))
