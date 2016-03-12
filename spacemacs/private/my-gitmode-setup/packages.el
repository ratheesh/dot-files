;;; packages.el --- my-gitmode-setup layer packages file for Spacemacs.
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

(defconst my-gitmode-setup-packages
  '(
    magit
    stgit
    magit-stgit
    git-gutter-fringe
    )
  "The list of Lisp packages required by the my-gitmode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-gitmode-setup/post-init-magit ()
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(defun my-gitmode-setup/init-stgit ()
  (use-package stgit
    :ensure t
    :config
    (progn ;; It does not work if we can put under :mode category
      (add-to-list 'auto-mode-alist ' ("\\.stgit-edit.txt$"  . git-commit-mode))
      (add-to-list 'auto-mode-alist ' ("\\.stgit-new.txt$"  . git-commit-mode))
      (add-to-list 'auto-mode-alist ' ("\\.stgit-squash.txt$"  . git-commit-mode))
      (add-to-list 'auto-mode-alist ' ("\\.stgitmsg.txt$"  . git-commit-mode))
      )))

(defun my-gitmode-setup/init-magit-stgit ()
  (use-package magit-stgit
    :ensure t
    :config
    (progn
      (add-hook 'magit-mode-hook 'magit-stgit-mode))))

(defun my-gitmode-setup/post-init-git-gutter-fringe ()
  (with-eval-after-load 'git-gutter-fringe
    (progn
      (setq-default right-fringe-width  12)
      (set-face-foreground 'git-gutter-fr:modified "yellow")
      (set-face-foreground 'git-gutter-fr:added    "green")
      (set-face-foreground 'git-gutter-fr:deleted  "red")
      ;; (add-hook 'after-make-frame-functions 'git-gutter:hide-gutter t)
      (fringe-helper-define 'git-gutter-fr:added nil
        "...XX..."
        "...XX..."
        "...XX..."
        "XXXXXXXX"
        "XXXXXXXX"
        "...XX..."
        "...XX..."
        "...XX..."
        )
      (fringe-helper-define 'git-gutter-fr:deleted nil
        "........"
        "........"
        "........"
        "XXXXXXXX"
        "XXXXXXXX"
        "XXXXXXXX"
        "XXXXXXXX"
        "........"
        "........"
        "........"
        )
      (fringe-helper-define 'git-gutter-fr:modified nil
        "........"
        ".XXXXXX."
        ".XXXXXX."
        ".XXXXXX."
        ".XXXXXX."
        ".XXXXXX."
        ".XXXXXX."
        "........"
        )
      )))

;;; packages.el ends here
