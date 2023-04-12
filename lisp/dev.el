(use-package lsp-mode
  ;; :ensure t
  ;; :hook((lsp-mode . corfu-mode))
  :config
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  (lsp-enable-which-key-integration t)
  :custom (lsp-headerline-breadcrumb-enable nil))

(ss/leader-key-def
  "l"  '(:ignore t :which-key "lsp")
  "ld" 'xref-find-definitions
  "lr" 'xref-find-references
  ;; "ln" 'lsp-ui-find-next-reference
  ;; "lp" 'lsp-ui-find-prev-reference
  ;; "lw" 'lsp-ivy-workspace-symbol
  ;; "ls" 'counsel-imenu
  ;; "le" 'lsp-ui-flycheck-list
  ;; "lS" 'lsp-ui-sideline-mode
  "la" 'lsp-execute-code-action)

(use-package rust-mode
  :ensure t
  :hook ((rust-mode . flycheck-mode)
         (rust-mode . lsp-deferred))
  :init (setq rust-format-on-save t))

(setq lsp-completion-provider :none)
(defun corfu-lsp-setup ()
  (setq-local completion-styles '(orderless)
              completion-category-defaults nil))
(add-hook 'lsp-mode-hook #'corfu-lsp-setup)

(use-package nix-mode
  :mode "\\.nix\\'")
