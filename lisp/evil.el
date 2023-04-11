(use-package undo-fu)

(use-package undo-tree
  :disabled t
  :config
  (setq undo-tree-auto-save-history nil)
  (global-undo-tree-mode 1))

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-M-u") 'universal-argument)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :demand t
  ;:bind (("‹escape›" . keyboard-escape-quit))
  :init
  (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  (setq evil-want-minibuffer nil)
  (setq evil-undo-system 'undo-fu)
  ;;(setq evil-undo-system 'undo-tree)
  (setq evil-want-C-u-scroll t)
  (setq evil-respect-visual-line-mode t) ;; basically gj gk etc
  (setq evil-want-Y-yank-to-eol t)
  :config
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :bind (:map evil-normal-state-map
              ("gc" . evil-commentary)))
