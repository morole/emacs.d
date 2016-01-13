(require 'req-package)

(req-package flycheck
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

  )

(provide 'init-flycheck)