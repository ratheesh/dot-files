;;; c-mode setup

(defun my-c-mode-init ()
  (progn
    (setq
     c-set-style "linux"
     c-brace-offset -8
     c-basic-offset 8
     c-default-style "linux"
     tab-width 8
     indent-tabs-mode t)
    (setq
     show-trailing-whitespace)
    (flyspell-prog-mode)
    ;; (which-func-mode t)
    )
)
(add-hook 'c-mode-common-hook
          (lambda ()
            (my-c-mode-init)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (abbrev-mode 1)
              (key-chord-define c-mode-map ";;" "\C-e") ;end of the line
              )))

;;fci-column-indicator mode -change based on the window width
(defun auto-fci-mode (&optional unused)
  (if (> (window-width) fci-rule-column)
      (fci-mode 1)
    (fci-mode 0)))

;;From Linux source
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
   (column (c-langelem-2nd-pos c-syntactic-element))
   (offset (- (1+ column) anchor))
   (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             ;; Add kernel style
;;             (c-add-style
;;              "linux-tabs-only"
;;              '("linux" (c-offsets-alist
;;                         (arglist-cont-nonempty
;;                          c-lineup-gcc-asm-reg
;;                          c-lineup-arglist-tabs-only))))))

;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (let ((filename (buffer-file-name)))
;;               ;; Enable kernel mode for the appropriate files
;;               (when (and filename
;;                          (string-match (expand-file-name "/")
;;                                        filename))
;;                 (setq indent-tabs-mode t)
;;                 (c-set-style "linux-tabs-only")))))

(add-hook 'c-common-mode-hook (lambda ()
				(progn
				  (clean-aident-mode t)
				  (setq clean-aindent-is-simple-indent t))))

;;; make #if 0 code to look like comment
(defun my-c-mode-font-lock-if0 (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) str start start-depth)
        (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
          (setq str (match-string 1))
          (if (string= str "if")
              (progn
                (setq depth (1+ depth))
                (when (and (null start) (looking-at "\\s-+0"))
                  (setq start (match-end 0)
                        start-depth depth)))
            (when (and start (= depth start-depth))
              (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
              (setq start nil))
            (when (string= str "endif")
              (setq depth (1- depth)))))
        (when (and start (> depth 0))
          (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  nil)

(defun my-c-mode-common-hook ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-c-mode-local-keybindings ()
  "Local key bindings for c-mode"
  (local-set-key (kbd "C-)") 'sp-forward-slurp-sexp)
  (local-set-key (kbd "C-(") 'sp-backward-barf-sexp)
  (local-set-key (kbd "C-}") 'sp-forward-barf-sexp)
  (local-set-key (kbd "C-{") 'sp-backward-slurp-sexp)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-local-keybindings)
