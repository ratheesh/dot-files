;;; packages.el --- my-python-setup layer packages file for Spacemacs.
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

(defconst my-python-setup-packages
  '(
    python
    )
  "The list of Lisp packages required by the my-python-setup layer.
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-python-setup/post-init-python-mode ()
  (with-eval-after-load 'python-mode
    (define-key python-mode-map (kbd "C-c C-c")
      (lambda () (interactive) (python-shell-send-buffer t))
      )))

;;; packages.el ends here
