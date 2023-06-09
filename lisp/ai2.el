(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)
;; you can utilize :map :hook and :config to customize copilot

(defun my/copilot-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (indent-for-tab-command)))

(with-eval-after-load 'copilot
  (evil-define-key 'insert copilot-mode-map
    (kbd "<tab>") #'my/copilot-tab))

(add-hook 'prog-mode-hook 'copilot-mode)

(global-copilot-mode)

(dolist (mode '(org-mode-hook
                compilation-mode-hook
                debugger-mode-hook
                minibuffer-mode-hook
                vterm-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (copilot-mode 0))))
