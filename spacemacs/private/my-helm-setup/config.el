;;; helm mode configuration

(with-eval-after-load 'helm
  (setq
   helm-move-to-line-cycle-in-source t
   helm-buffers-fuzzy-matching t
   )
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  ;;; Save current position to mark ring
  (add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring))
