;;; package --- summary 程序外观配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package moe-theme
  :ensure t
  :config
  ;; (load-theme 'moe-dark)
  ;; (add-to-list 'custom-theme-load-path (get-package-install-path "moe-theme"))
  (setq moe-theme-highlight-buffer-id t)

  (if (package-installed-p 'markdown-mode)
      (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0)))

  (if (package-installed-p 'org)
      (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0)))

  ;; (setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))
  ;; (if (package-installed-p 'powerline)
  ;;     (powerline-moe-theme))

  (moe-dark)
  )

(use-package diminish
  :ensure t
  :config
  (diminish 'auto-revert-mode)
  (diminish 'visual-line-mode)
  (diminish 'eldoc-mode)
  (diminish 'subword-mode)
  )


(use-package powerline
  :ensure t
  :disabled
  :config
  (powerline-default-theme)
  )

(use-package smart-mode-line
  :ensure t
  :disabled
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  )
(provide 'theme-cfg)

;;; theme-cfg.el ends here