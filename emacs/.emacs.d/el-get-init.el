;;; el-get init

(setq el-get-sources
      '((:name undo-tree
               :type git
               :url "git clone http://www.dr-qubit.org/git/undo-tree.git"
               :website "http://www.dr-qubit.org/emacs.php#undo-tree"
               :description "undo tree.")
	(:name lice
               :type git
               :url "https://github.com/leoliu/ack-el.git"
               :website "https://github.com/leoliu/ack-el"
               :description "Emacs Interface to command-line tool ack")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq elget-packages-list
      '(hungry-delete jedi linum+ org2blog xlicense goto-last-change))

(el-get 'sync elget-packages-list)

(provide 'el-get-init)
