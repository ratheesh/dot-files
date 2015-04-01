;;; Helm mode configuration

(use-package helm
  :ensure helm
  :diminish helm-mode
  :init
  (progn
    (use-package helm-config)
    (use-package helm-projectile
      :ensure t
      :bind
      (
       ("C-c h" . helm-projectile)
       ("C-x C-r" . helm-recentf)))
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode 1))
  :bind (
         ("C-h a" . helm-apropos)
         ("M-y" . helm-show-kill-ring)))

(use-package helm-descbinds
  :defer t
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

(setq helm-idle-delay 0.1
          helm-exit-idle-delay 0.1
          helm-input-idle-delay 0
          helm-buffers-fuzzy-matching t
          ;; truncate long lines in helm completion
          helm-truncate-lines t
          ;; may be overridden if 'ggrep' is in path (see below)
          helm-grep-default-command
          "grep -a -d skip %e -n%cH -e %p %f"
          helm-grep-default-recurse-command
          "grep -a -d recurse %e -n%cH -e %p %f"
          ;; do not display invisible candidates
          helm-quick-update t
          ;; be idle for this many seconds, before updating in delayed sources.
          helm-idle-delay 0.01
          ;; be idle for this many seconds, before updating candidate buffer
          helm-input-idle-delay 0.01
          ;; open helm buffer in another window
          helm-split-window-default-side 'other
          ;; open helm buffer inside current window, don't occupy whole other window
          helm-split-window-in-side-p t
          ;; limit the number of displayed canidates
          helm-candidate-number-limit 200
          ;; don't use recentf stuff in helm-ff
          helm-ff-file-name-history-use-recentf nil
          ;; move to end or beginning of source when reaching top or bottom
          ;; of source
          helm-move-to-line-cycle-in-source t
          ;; don't displace the header line
          helm-display-header-line nil
          ;; fuzzy matching
          helm-buffers-fuzzy-matching t
          helm-semantic-fuzzy-match t
          helm-imenu-fuzzy-match t
          helm-completion-in-region-fuzzy-match t
	  helm-M-x-fuzzy-match        t
	  helm-buffers-fuzzy-matching t
	  helm-recentf-fuzzy-match    t
          ;; Here are the things helm-mini shows, I add `helm-source-bookmarks'
          ;; here to the regular default list
          helm-mini-default-sources '(helm-source-buffers-list
                                      helm-source-recentf
                                      helm-source-bookmarks
                                      helm-source-buffer-not-found))

(provide 'helm-mode-config)
;;; End of File
