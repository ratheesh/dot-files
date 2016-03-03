;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion   :variables
                        auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     (git :variables
          git-magit-status-fullscreen t
          )
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     themes-megapack
     (colors :variables
             colors-enable-rainbow-identifiers t)
     (python :variables
             python-test-runner 'pytest
                                        ; python-enable-yapf-format-on-save t
             )
     (c-c++ :variables
            c-c++-enable-clang-support t
            )
     semantic
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     fasd
     smex
     gtags
     ibuffer
     spell-checking

     ;;private layers
     my-common-setup
     my-helm-setup
     my-progmode-setup
     my-c-mode-setup
     my-gitmode-setup
     my-orgmode-setup)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'emacs
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 15
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(sanityinc-tomorrow-bright
                         solarized-dark
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-helm-micro-state t
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  (setq-default
   vc-follow-symlinks t
   )
  (setq-default git-enable-magit-svn-plugin t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (global-subword-mode 1)
  (global-hl-line-mode 1)
  ;; (global-linum-mode 1)
  (setq linum-format 'dynamic)
  (fancy-battery-mode)
  (delete-selection-mode 1)             ;replace selected text on yank!

  ;; set the font here
  (set-face-attribute 'default nil :family "MonacoB")
  (set-face-attribute 'default nil :height 130)

  ;; Semantic to ignore c-pre-processor
  (setq semantic-c-obey-conditional-section-parsing-flag 'nil)
  (setq semanticdb-default-save-directory "/home/ratheesh/.emacs.d/.cache/semanticdb/")

  ;; avoid annoying message about shell configuration
  (setq exec-path-from-shell-arguments '("-l"))

  ;; Set initial buffer to *spacemacs*
  (setq initial-buffer-choice (lambda () (get-buffer spacemacs-buffer-name)))

  (global-git-commit-mode t)

  ;; C - mode hooks - need to move this elsewhere -- ???
  ;; enable clean-aindent-mode for programming mode
  (add-hook 'prog-mode-hook 'clean-aindent-mode)
  (global-aggressive-indent-mode 1)
  (setq powerline-default-separator 'box)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(diff-hl-side (quote left))
 '(global-semantic-highlight-edits-mode t)
 '(global-semantic-show-parser-state-mode t)
 '(paradox-github-token t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(diff-hl-change ((t (:background "wheat4" :foreground "wheat4"))))
 '(diff-hl-delete ((t (:background "red" :foreground "red"))))
 '(diff-hl-insert ((t (:background "green" :foreground "green")))))
