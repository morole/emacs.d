;;; package --- summary python-ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）
(defun set-company-backends-for-python ()
  "Create python company backend."
  (setq-local company-backends '(
                                 ;; company-jedi
                                 (
                                  company-lsp
                                  company-yasnippet
                                  )
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )
              ))

(use-package lsp-python-ms
  :demand
  :ensure nil
  :load-path "~/github/lsp-python-ms"
  :hook (python-mode . lsp)
  :config
  ;; for dev build of language server
  (setq lsp-python-ms-dir
        (expand-file-name "~/github/python-language-server/output/bin/Release/"))
  ;; for executable of language server, if it's not symlinked on your PATH
  (setq lsp-python-ms-executable "~/github/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer")
  )
;;; 编辑辅助(Code generation helpers)

;;; Lint, style and syntax checkers
(use-package yapfify
  :ensure t
  :disabled t
  :hook (python-mode . yapf-mode)
  :config
  )

(use-package python
  :hook (python-mode . set-company-backends-for-python)
  :config
  (setq python-shell-interpreter 'python3)
  )
;; ;;; Lint, style and syntax checkers

;;; code navigation

;;; compile

;;; run test

;;; Interactive environments

(provide 'python-ide)
;;; python-ide.el ends here
