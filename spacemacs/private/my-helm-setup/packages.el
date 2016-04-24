;;; packages.el --- my-helm-setup layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ratheesh S <ratheeshreddy@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-helm-setup-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-helm-setup/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-helm-setup/pre-init-PACKAGE' and/or
;;   `my-helm-setup/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-helm-setup-packages
  '(
    helm-gtags
    helm-swoop
    projectile
    helm-projectile
    ;; swiper-helm
    )
  "The list of Lisp packages required by the my-helm-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-helm-setup/post-init-projectile ()
  (setq projectile-enable-caching t
        projectile-completion-system 'helm
        projectile-use-native-indexing t
        projectile-use-git-grep t)
  )

(defun my-helm-setup/post-init-helm-gtags ()
  (global-set-key (kbd "<f6>") 'helm-gtags-find-rtag)
  (global-set-key (kbd "<f7>") 'helm-gtags-dwim)
  (global-set-key (kbd "<f8>") 'helm-gtags-pop-stack)
  )

(defun my-helm-setup/post-init-helm-swoop ()
;;; helm-swoop
  (progn
    (global-set-key (kbd "<f4>") 'helm-swoop)
    ;; (setq helm-swoop-use-fuzzy-match t)
    )
  )

(defun my-helm-setup/init-swiper-helm ()
  (use-package swiper-helm
    :ensure t
    :bind
    (("C-s" . swiper-helm)
     ("C-r" . swiper-helm))))

(defun my-helm-setup/post-init-helm-projectile ()
  (global-set-key (kbd "s-g") 'helm-projectile-ag)
  )

;;; packages.el ends here
