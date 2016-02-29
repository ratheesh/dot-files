;;; packages.el --- my-orgmode-setup layer packages file for Spacemacs.
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

(defconst my-orgmode-setup-packages
  '(
    org
    )
  "The list of Lisp packages required by the my-orgmode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-orgmode-setup/post-init-org ()
  (setq org-ellipsis "⚡⚡⚡")
  )

;;; packages.el ends here
