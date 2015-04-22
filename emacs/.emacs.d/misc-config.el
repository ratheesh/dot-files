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


(use-package skype
  :disabled t
  :init
  (progn
    (setq skype--my-user-handle "ratheesh.reddy")))

(provide 'misc-config)
