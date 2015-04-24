;;; This file has configuration which are not strictly for developement purpose

;;; keybinding help after a delay
(use-package guide-key
  :ensure t
  :diminish guide-key-mode
  :init
  (progn
    (setq guide-key/guide-key-sequence t))
  :config
  (progn
    (guide-key-mode)))

(use-package highlight-tail
  :ensure t
  :disabled t
  :config
  (progn
    (setq highlight-tail-steps 3
	  highlight-tail-timer 0.1
	  highlight-tail-const-width 3)
    (highlight-tail-mode)))

(use-package skype
  :disabled t
  :init
  (progn
    (setq skype--my-user-handle "ratheesh.reddy")))

(provide 'misc-config)
