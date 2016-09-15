;;; packages.el --- my-c-mode-setup layer packages file for Spacemacs.
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

(defconst my-c-mode-setup-packages
  '(
    c-mode
    dts-mode
    ;; autopair
    ;; fill-column-indicator
    )
  "The list of Lisp packages required by the my-c-mode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-c-mode-setup/post-init-c-mode ()
  (add-to-list 'auto-mode-alist '("Kconfig" . Kconfig-mode))
  )

(defun my-c-mode-setup/init-dts-mode ()
  (use-package dts-mode
    :ensure t
    :commands dts-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.dts\\'"   . dts-mode))
      (add-to-list 'auto-mode-alist '("\\.dtsi\\'"  . dts-mode)))))

(defun my-c-mode-setup/init-autopair ()
  (use-package autopair
    :ensure t
    :commands c-mode
    :diminish autopair-mode
    :init
    (progn
      (add-hook 'c-mode-common-hook #'(lambda () (autopair-mode))))))

(defun my-c-mode-setup/post-init-fill-column-indicator ()
  (progn
    (setq
     ;; fci-handle-truncate-lines nil
     fci-rule-width 1
     fci-rule-color "#696969")
    (setq-default  fci-rule-column 80)
    (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
    (add-hook 'after-change-major-mode-hook 'auto-fci-mode)
    (add-hook 'window-configuration-change-hook 'auto-fci-mode)))

;;; packages.el ends here
