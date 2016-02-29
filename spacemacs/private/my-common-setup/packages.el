;;; packages.el --- my-common-setup layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ratheesh <ratheesh@ratheesh-LinuxMint>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst my-common-setup-packages
  '(
    iregister
    duplicate-thing
    ace-jump-mode
    key-chord
    super-save
    fasd
    ;; back-button
    )
  "The list of Lisp packages required by the my-common-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-common-setup/init-iregister ()
  (use-package iregister
    :ensure t
    :bind(
          ("<f3>" . iregister-point-to-register)
          ("M-n" . iregister-jump-to-next-marker)
          ("M-p" . iregister-jump-to-previous-marker))
    ))

(defun my-common-setup/init-duplicate-thing ()
  (use-package duplicate-thing :ensure t))

(defun my-common-setup/init-key-chord ()
  (use-package key-chord
    :ensure t
    :init
    (progn
      (setq key-chord-two-keys-delay 0.01))
    :config
    (progn
      (key-chord-mode 1)
      (key-chord-define-global "jj" 'ace-jump-char-mode) ;ace jump mode
      (key-chord-define-global "qq" 'ido-switch-buffer) ;switch buffer
      (key-chord-define-global "jk" 'forward-char) ;forward by a character
      )))

(defun my-common-setup/init-back-button ()
  (use-package back-button
    :commands back-button-mode
    :ensure t
    :bind (
           ("<f2>" . back-button-push-mark-local-and-global)
           ("M-u" . back-button-global-backward)
           ("M-l" . back-button-global-forward)
           ("M-p" . back-button-local-backward)
           ("M-n" . back-button-local-forward))
    :config
    (progn
      (use-package smartrep
        :ensure t )
      (use-package visible-mark
        :disabled t))
    :config
    (progn
      (back-button-mode 1))))

(defun my-common-setup/init-ace-jump-mode ()
  (use-package ace-jump-mode
    :ensure t)
  )


(defun my-common-setup/init-super-save ()
  (use-package super-save
    :ensure t
    :defer t
    :config (progn
              (super-save-mode +1)
              (setq
               super-save-auto-save-when-idle t
               auto-save-default nil))))

(defun my-common-setup/post-init-fasd ()
  (setq fasd-enable-initial-prompt 'nil)
  )
;;; packages.el ends here
