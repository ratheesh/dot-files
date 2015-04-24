(deftheme mytheme-dark
  "My emacs 24 theme(dark)")

(custom-theme-set-faces
 'mytheme-dark
 '(default ((t (:width normal :weight normal :foreground "#ffffff" :background "#0B0B0B"))))
 '(underline ((t (:underline t))))
 '(italic ((t (:italic t))))
 '(bold-italic ((t (:bold t :italic t))))
 '(linum ((t (:background "#0b0b0b" :foreground "gray"))))
 '(cursor ((t (:background "white" :inverse-video t))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((t (:weight bold :foreground "#ddaa6f"))))
 '(minibuffer-prompt ((t (:foreground "#e5786d"))))
 '(highlight ((t (:underline (:color foreground-color :style line) :foreground "#ffffff" :background "#454545"))))
 '(region ((t (:foreground "#f6f3e8" :background "#404040"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((t (:foreground "#f6f3e8" :background "#333366"))))
 '(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 '(highlight-changes ((t (:foreground nil :background "midnight blue"))))
 '(highlight-changes-delete ((t (:foreground nil :background "chocolate4" :underline nil))))
 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#8c8c8c" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "indianred"))))
 '(font-lock-number-face ((t (:foreground "indianred" :weight bold))))
 '(font-lock-doc-string-face ((t (:foreground "SeaGreen2" :bold t))))
 '(font-lock-doc-face ((t (:inherit (font-lock-comment-face :slant italic)))))
 '(font-lock-function-name-face ((t (:foreground "steelblue"))))
 '(font-lock-keyword-face ((t (:weight normal :foreground "SkyBlue"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "RosyBrown" :slant italic))))
 '(font-lock-type-face ((t (:weight normal :foreground "PaleGreen" :slant italic))))
 '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
 '(font-lock-warning-face ((t (:foreground "#ccaa8f" :inherit (error)))))
 '(font-lock-operator-face ((t (:foreground "#32cd32"))))
 '(button ((t (:foreground "#f6f3e8" :background "#333333" :inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "#8ac6f2"))))
 '(link-visited ((t (:underline (:color foreground-color :style line) :foreground "#e5786d" :inherit (link)))))
 '(fringe ((t (:background "#303030"))))
 '(header-line ((t (:box nil :foreground "#e7f6da" :background "#303030" :inherit (mode-line)))))
 '(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
 '(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :inverse-video nil :foreground "black" :background "grey85"))))
 '(mode-line-buffer-id ((t (:foreground "#00bfff" :weight normal))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:weight light :box (:line-width -1 :color "grey40" :style nil) :inverse-video nil :foreground "grey20" :background "#fdf6e3" :inherit (mode-line)))))
 '(isearch ((t (:foreground "red4" :background "CadetBlue4"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((t (:foreground "#a0a8b0" :background "#384048"))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))
 '(show-paren-match-face ((t (:background "#404040" :inverse-video t))))
 '(show-paren-mismatch-face ((t (:background "red" :inverse-video t))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#a0522d"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#f4a460"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#ffff00"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#ff3e96"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#4eee94"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#00bfff"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#ff00ff"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#ff0000"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#ffff00"))))
 '(footnote-spaced-footnotes nil)
 '(git-gutter+-separator ((t (:foreground "yellow" :weight normal))))

;;; helm colors
 '(helm-match ((t (:foreground "DodgerBlue" :inverse-video t))))
 '(helm-selection ((t (:background "gray20" :underline t))))
 '(helm-selection-line ((t (:background "gray20"  :underline nil)))))

(provide-theme 'mytheme-dark)
