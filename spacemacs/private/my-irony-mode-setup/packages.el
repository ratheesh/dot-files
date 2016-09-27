;;; packages.el --- my-irony-mode-setup layer packages file for Spacemacs.
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
;; added to `my-irony-mode-setup-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-irony-mode-setup/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-irony-mode-setup/pre-init-PACKAGE' and/or
;;   `my-irony-mode-setup/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-irony-mode-setup-packages
  '(
    irony
    company-irony
    company-irony-c-headers
    flycheck-irony
    irony-eldoc
    )
  "The list of Lisp packages required by the my-irony-mode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")


(setq irony-mode-excluded-packages
  '(auto-complete-clang))

(defun my-irony-mode-setup/init-irony ()
  (use-package irony
    :defer t
    :init
    (progn
      (add-hook 'c++-mode-hook 'irony-mode)
      (add-hook 'c-mode-hook 'irony-mode)
      (add-hook 'objc-mode-hook 'irony-mode)
      (add-hook 'irony-mode-hook
		(lambda ()
		  (define-key irony-mode-map [remap completion-at-point]
		    'irony-completion-at-point-async)
		  (define-key irony-mode-map [remap complete-symbol]
		    'irony-completion-at-point-async)))
      (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
      (spacemacs|diminish irony-mode " Ⓘ" " I"))))

(defun my-irony-mode-setup/init-company-irony ()
  (use-package company-irony
    :defer t
    :init
    (progn
      (eval-after-load 'company
	'(add-to-list 'company-backends 'company-irony))
      (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
      (add-hook 'irony-mode-hook 'company-mode))))

(defun my-irony-mode-setup/init-flycheck-irony ()
  (use-package flycheck-irony
    ;; :defer t                            ; fix this ???
    :init
    (progn
      (eval-after-load 'flycheck
	'(add-to-list 'flycheck-checkers 'irony))
      (add-hook 'irony-mode-hook 'flycheck-mode))))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun my-irony-mode-setup/init-company-irony-c-headers ()
    (use-package company-irony-c-headers
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :commands company-irony-c-headers
      :init
      (push 'company-irony-c-headers company-backends-c-mode-common))))

(defun my-irony-mode-setup/init-irony-eldoc ()
  (use-package irony-eldoc
    :commands (irony-eldoc)
    :init
    (add-hook 'irony-mode-hook 'irony-eldoc)))

;;; packages.el ends here
