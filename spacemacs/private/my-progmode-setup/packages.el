;;; packages.el --- my-progmode-setup layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ratheesh S <ratheeshreddy@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst my-progmode-setup-packages
  '(
    paredit
    lice
    comment-dwim-2
    )
  "The list of Lisp packages required by the my-progmode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-progmode-setup/init-paredit ()
  (use-package paredit
    :ensure t
    :defer t
    :commands lisp-mode
    :diminish paredit-mode
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
      (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
      (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
      (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
      (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
      (add-hook 'scheme-mode-hook           #'enable-paredit-mode))))

(defun my-progmode-setup/init-lice ()
  (use-package lice
    :ensure t
    :commands prog-mode
    :defer t ))

(defun my-progmode-setup/init-comment-dwim-2 ()
  (use-package comment-dwim-2
    :ensure t
    :disabled t
    :bind
    (("M-;" . comment-dwim-2))
    :init
    (progn
      (setq comment-dwim-2--inline-comment-behavior 'reindent-comment))))

 ;;; packages.el ends here
