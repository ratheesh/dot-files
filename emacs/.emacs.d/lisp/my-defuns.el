;; My useful Snippets collections

;; goto symbol inside buffer with ido
;; key binding: M-i
(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))

;; connect to jabber and switch to active jabber window
(defun jabber ()
    (interactive)
    (jabber-connect)
    (switch-to-buffer "*-jabber-*"))

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

;;; git-grep
;;; Quelle: https://www.ogre.com/node/447
(defun git-grep (search)
  "git-grep the entire current repo"
  (interactive
   (list (completing-read "Search for: " nil nil nil (current-word))))
  (grep-find (concat "git --no-pager grep -P -n " search " `git rev-parse --show-toplevel`")))


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

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
   Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))
(global-set-key (kbd "<f2>") 'push-mark-no-activate)

(defun marker-is-point-p (marker)
  "test if marker is current point"
  (and (eq (marker-buffer marker) (current-buffer))
       (= (marker-position marker) (point))))

(defun push-mark-maybe ()
  "push mark onto `global-mark-ring' if mark head or tail is not current location"
  (if (not global-mark-ring) (error "global-mark-ring empty")
    (unless (or (marker-is-point-p (car global-mark-ring))
                (marker-is-point-p (car (reverse global-mark-ring))))
      (push-mark))))


(defun backward-global-mark ()
  "use `pop-global-mark', pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark))

(defun forward-global-mark ()
  "hack `pop-global-mark' to go in reverse, pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (setq global-mark-ring (nreverse global-mark-ring))
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark)
  (setq global-mark-ring (nreverse global-mark-ring)))

(global-set-key [M-left] (quote backward-global-mark))
(global-set-key [M-right] (quote forward-global-mark))

;;; show file path in mini buffer
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))
(global-set-key [f9] 'show-file-name)

;;; My powerline theme
;;; Derived from powerline-center-theme
;;; Actung: Make sure to call this defun after loading powerline package
(defun powerline-my-theme ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
		'("%e"
		  (:eval
		   (let* ((active (powerline-selected-window-active))
			  (mode-line (if active 'mode-line 'mode-line-inactive))
			  (face1 (if active 'powerline-active1 'powerline-inactive1))
			  (face2 (if active 'powerline-active2 'powerline-inactive2))
			  (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
							  (car powerline-default-separator-dir))))
			  (separator-right (intern (format "powerline-%s-%s"
							   (powerline-current-separator)
							   (cdr powerline-default-separator-dir))))
			  (lhs (list (powerline-raw " %* " nil 'c)
				     (funcall separator-left mode-line face2)
				     (powerline-raw " %l " face2 'c)
				     (funcall separator-left face2 face1)
				     (powerline-raw " %c " face1 'c)
				     (funcall separator-left face1 mode-line)
				     (powerline-buffer-id nil 'l)
				     (powerline-raw " ")
				     (funcall separator-left mode-line face1)
				     (powerline-narrow face1 'c)
				     (powerline-vc face1)))
			  (rhs (list (powerline-raw global-mode-string face1 'c)
				     (when (and (boundp 'which-func-mode) which-func-mode)
				       (powerline-raw which-func-format face1 'c))
				     (powerline-raw " " face1 'c)
				     (funcall separator-right face1 face2)
				     (powerline-raw " " face2 'c)
				     (powerline-buffer-size face2 'c)
				     (powerline-raw " " face2 'c)
				     (funcall separator-right face2 mode-line)
				     (powerline-raw " %p " nil 'c)
				     ;; (funcall separator-right mode-line face2)
				     (powerline-hud face2 face1)
				     ))
			  (center (list (powerline-raw " " face1)
					(funcall separator-left face1 face2)
					(when (boundp 'erc-modified-channels-object)
					  (powerline-raw erc-modified-channels-object face2 'c))
					(powerline-major-mode face2 'c)
					(powerline-process face2)
					(powerline-raw ":" face2)
					(powerline-minor-modes face2 'c)
					(powerline-raw " " face2)
					(funcall separator-right face2 face1))))
		     (concat (powerline-render lhs)
			     (powerline-fill-center face1 (/ (powerline-width center) 2.0))
			     (powerline-render center)
			     (powerline-fill face1 (powerline-width rhs))
			     (powerline-render rhs)))))))

(provide 'my-defuns)
