;;; package --- summary python-ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）
(use-package company-jedi
  :ensure t
  :after (company)
  :config
  (setq jedi:complete-on-dot t)
  )

(defun company-python-mode-hook()
  "Create python company backend."
  (setq-local company-backends '(
                                 (
                                  company-jedi
                                  )
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )
              ))


(add-hook 'python-mode-hook 'company-python-mode-hook)


;;; 编辑辅助(Code generation helpers)

;;; Lint, style and syntax checkers
(use-package yapfify
  ;; 需要安装 sudo pip3 install yapf
  :ensure t
  :hook (python-mode . yapf-mode)
  :config
  )

;;; code navigation

;;; compile

;;; run test

;;; Interactive environments

(provide 'python-ide)
;;; python-ide.el ends here
