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
    (transient-mark-mode 1)
    (set-mark(end-of-line))
    (line-beginning-position)))

;;; kill line backwards
(defun kill-line-backward ()
  "kill line backwards from point to beginning of the line"
  (interactive)
  (kill-line 0))

;;; My handwritten eLisp functions :-)
(defun insert-line-above ()
  "Insert empty line above current one"
  (interactive)
  (progn
    (beginning-of-line)
    (open-line 1)
    (indent-for-tab-command)))

(defun insert-line-below ()
  "Insert empty line below the current one"
  (interactive)
  (progn
    (end-of-line)
    (newline)
    (indent-for-tab-command)))

(provide 'my-snippets)
