;;; extensions.el --- Common Setup Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ratheesh S <ratheeshreddy@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Pre extensions are loaded *before* the packages
(setq my-common-setup-pre-extensions '())

;; Post extensions are loaded *after* the packages
(setq my-common-setup-post-extensions
      '(
        (linum+ :location local)
        ))

;; Initialize the extensions
(defun my-common-setup/init-linum+ ()
  (use-package linum+
    ))
