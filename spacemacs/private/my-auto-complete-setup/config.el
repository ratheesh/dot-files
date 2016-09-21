;;; misc configuration for my-auto-complete layer

(with-eval-after-load 'auto-complete
  (add-hook 'c++-mode (lambda () (add-to-list 'ac-sources 'ac-source-semantic ac-source-gtags))))

;;; End of File
