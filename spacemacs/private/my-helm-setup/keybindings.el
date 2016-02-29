;; key bindings for my-helm-setup

(with-eval-after-load 'helm
  (global-set-key (kbd "M-i") 'helm-semantic-or-imenu)
  (global-set-key (kbd "s-r") 'helm-projectile-recentf)
  (global-set-key (kbd "C-c h") 'helm-projectile)

  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "M-o") 'helm-global-mark-ring)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)

  ;;; helm-resume
  (global-set-key (kbd "C-c r") 'helm-resume))

;;; rebind tab to run persistent action
;;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;;; make TAB works in terminal
;;;(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
;;; list actions using C-z
;;;(define-key helm-map (kbd "C-z")  'helm-select-action)


;; (global-set-key (kbd "C-c p p") 'helm-projectile-switch-project)
