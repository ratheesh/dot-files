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
    (linum+ :location local)
    (myemacs-darktheme-theme :location local)
    iregister
    duplicate-thing
    ace-jump-mode
    key-chord
    super-save
    fasd
    imenu
    flyspell-popup
    spaceline
    ;; back-button
    )
  "The list of Lisp packages required by the my-common-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-common-setup/init-linum+ ()
  (use-package linum+
    :load-path "~/.emacs.d/private/local/"
    :config
    (setq linum-format 'smart)
    ))

(defun my-common-setup/init-myemacs-darktheme-theme ()
  (use-package myemacs-darktheme-theme
    :load-path "~/.emacs.d/private/local/"
    ))

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
      (key-chord-define-global "QQ" 'helm-mini) ;switch buffer
      (key-chord-define-global ",," 'forward-char) ;forward by a character
      ;; (key-chord-define-global "jj" 'ace-jump-char-mode) ;ace jump mode
      )))

(defun my-common-setup/init-back-button ()
  (use-package back-button
    :commands back-button-mode
    :ensure t
    :defer t
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
    :ensure t
    :defer t)
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

(defun my-common-setup/post-init-imenu ()
  (progn
    (setq
     imenu-auto-rescan t)))

(defun my-common-setup/post-init-flyspell-popup ()
  (progn
    (define-key flyspell-mode-map (kbd "C-;") #'flyspell-popup-correct)))

(defun my-common-setup/post-init-spaceline ()
  (spaceline-install

   '(((persp-name workspace-number window-number)
      :fallback evil-state
      :separator "|"
      :face highlight-face)
     anzu
     auto-compile
     (buffer-modified buffer-size)
     (projectile-root :when active)
     (buffer-id remote-host)
     major-mode
     ((flycheck-error flycheck-warning flycheck-info)
      :when active)
     (((minor-modes :separator spaceline-minor-modes-separator)
       process)
      :when active)
     (erc-track :when active)
     (version-control :when active)
     (org-pomodoro :when active)
     (org-clock :when active)
     nyan-cat)

   '((battery :when active)
     selection-info
     ((buffer-encoding-abbrev
       point-position
       line-column)
      :separator " | ")
     (global :when active)
     buffer-position
     hud))
  )

;;; packages.el ends here
