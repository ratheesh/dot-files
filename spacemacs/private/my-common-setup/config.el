;; configuration for my-common-setup

(setq-default
 user-mail-address "ratheeshreddy@gmail.com"
 user-full-name "Ratheesh S"
 cursor-in-non-selected-windows nil
 cursor-in-non-selected-windows nil
 x-stretch-cursor t ; when on a tab, make the cursor the tab length
 require-final-newline t
 default-major-mode 'text-mode
 ;; nice comment format
 comment-style 'extra-line

 )

;save the file modification timstamp at the time os saving
(add-hook 'before-save-hook 'time-stamp)

;;; duplicate current line
(defun duplicate-current-line ()
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))

;;; select the current line
(defun select-current-line ()
  "Select the current line"
  (interactive)
  (progn
    (end-of-line)
    (set-mark (point))
    (beginning-of-line)))

;;; kill line backwards
(defun kill-line-backward ()
  "kill line backwards from point to beginning of the line"
  (interactive)
  (kill-line 0))

;; DOS to UNIX, remove the meta M's
;;; Quelle: https://github.com/necaris/emacs-config/blob/master/my-functions.el
(defun dos2unix ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "\r" nil t) (replace-match ""))))

;; UNIX to DOS, put in the meta M's
;;; Quelle: https://github.com/necaris/emacs-config/blob/master/my-functions.el
(defun unix2dos ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "\r\n"))))

;;; My handwritten eLisp functions :-)
(defun insert-line-above ()
  "Insert empty line above current one"
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun insert-line-below ()
  "Insert empty line below the current one"
  (interactive)
  (progn
    (move-end-of-line nil)
    (newline-and-indent)))

;;; show file path in mini buffer
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))
(global-set-key [f9] 'show-file-name)

;;; End of File
