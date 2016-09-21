;;; packages.el --- my-auto-complete-setup layer packages file for Spacemacs.
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
;; added to `my-auto-complete-setup-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-auto-complete-setup/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-auto-complete-setup/pre-init-PACKAGE' and/or
;;   `my-auto-complete-setup/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-auto-complete-setup-packages
  '(
    ;; auto-complete                       ;
    )
  "The list of Lisp packages required by the my-auto-complete-setup layer.
        recipe.  : https://github.com/milkypostman/melpa#recipe-format")

(defun my-auto-complete-setup/post-init-auto-complete ()
  (progn
    (setq ac-ignore-case t)
    (setq ac-sources (append ac-sources '(ac-source-gtags)))
    )
  )

;;; packages.el ends here
