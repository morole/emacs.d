;;; package --- summary php ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package php-mode
  :ensure t
  :config
  )

;; (use-package phpunit
;;   :ensure t
;;   )

;;; 代码补全
;; (use-package php-auto-yasnippets
;;   :ensure t
;;   )

;;; 代码格式化

;; 语法检查

;; 文档化
(use-package php-eldoc
  :ensure t)

(provide 'php-ide-cfg)
;;; php-ide-cfg.el ends here
