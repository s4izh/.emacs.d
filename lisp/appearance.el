;; UI
(setq inhibit-startup-message t)

;; (scroll-bar-mode -1)        ; Disable visible scrollbar
;; (tool-bar-mode -1)          ; Disable the toolbar
;; (tooltip-mode -1)           ; Disable tooltips
;; (set-fringe-mode 10)

;; (menu-bar-mode -1)            ; Disable the menu bar
(setq ring-bell-function 'ignore)
(display-battery-mode t)

;; (add-to-list 'default-frame-alist '(font . "DejaVuSansMono-12"))
(add-to-list 'default-frame-alist '(font . "LiberationMono-13"))
(setq locale-coding-system 'utf-8)

;; THEMES
;; modus
(setq ;;modus-themes-mode-line '(accented borderless)
 modus-themes-bold-constructs t
 modus-themes-italic-constructs t
 modus-themes-mode-line t
 ;; modus-themes-fringes 'subtle
 modus-themes-tabs-accented t
 modus-themes-paren-match '(bold intense)
 ;; modus-themes-prompts '(bold intense)
 modus-themes-completions 'opinionated
 modus-themes-org-blocks 'gray-background
 ;; modus-themes-org-blocks 'tinted-background
 ;; modus-themes-scale-headings t
 modus-themes-region '(bg-only))

(load-theme 'modus-operandi)

(use-package doom-themes
  :disabled t
  :config
  (load-theme 'doom-sourcerer t))

(use-package spaceway-theme
  :disabled t
  :ensure nil
  :load-path "lisp/spaceway/"
  :config
  (global-hl-line-mode t)
  (set-cursor-color "#dc322f")
  (load-theme 'spaceway t))

;; smooth scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-margin '3)
(setq use-dialog-box nil)

;; line numbers
(column-number-mode)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(set-default 'truncate-lines t)

;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

(dolist (mode '(org-mode-hook
                term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                org-agenda-mode-hook
                compilation-mode-hook
                dired-mode-hook
		woman-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

