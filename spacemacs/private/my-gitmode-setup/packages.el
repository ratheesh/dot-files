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
    ;; magit
    stgit
    magit-stgit
    git-gutter-fringe
    )
  "The list of Lisp packages required by the my-gitmode-setup layer.
   See: https://github.com/milkypostman/melpa#recipe-format")

;;; following does not work in emacs-25.1
(defun my-gitmode-setup/post-init-magit ()
  (progn
    (with-eval-after-load 'projectile
      (progn
        (setq magit-repository-directories (mapcar #'directory-file-name
                                                   (cl-remove-if-not (lambda (project)
                                                                       (file-directory-p (concat project "/.git/")))
                                                                     (projectile-relevant-known-projects)))

              magit-repository-directories-depth ))))
  )

(defun my-gitmode-setup/init-stgit ()
  (use-package stgit
    :ensure t
    :config
    (progn ;; It does not work if we put under :mode category
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
      (add-hook 'magit-mode-hook 'magit-stgit-mode)
      (add-hook 'magit-mode-hook (lambda ()
                                   (define-key magit-mode-map (kbd "?") 'magit-stgit-popup))))))

(defun my-gitmode-setup/post-init-git-gutter-fringe ()
  (with-eval-after-load 'git-gutter-fringe
    (progn
      (setq-default right-fringe-width  12)
      (set-face-foreground 'git-gutter-fr:modified "slate gray")
      (set-face-foreground 'git-gutter-fr:added    "yellow")
      (set-face-foreground 'git-gutter-fr:deleted  "red")
      ;; (add-hook 'after-make-frame-functions 'git-gutter:hide-gutter t)
      (fringe-helper-define 'git-gutter-fr:added nil
        "....XX..."
        "....XX..."
        "....XX..."
        "XXXXXXXXXX"
        "XXXXXXXXXX"
        "....XX..."
        "....XX..."
        "....XX..."
        )
      (fringe-helper-define 'git-gutter-fr:deleted nil
        "........."
        "........."
        "........."
        "XXXXXXXXX"
        "XXXXXXXXX"
        "XXXXXXXXX"
        "........."
        "........."
        "........."
        )
      (fringe-helper-define 'git-gutter-fr:modified nil
        "........."
        ".XXXXXXXX"
        ".XXXXXXXX"
        ".XXXXXXXX"
        ".XXXXXXXX"
        ".XXXXXXXX"
        ".XXXXXXXX"
        ".XXXXXXXX"
        "........."
        )
      )))

;;; packages.el ends here
