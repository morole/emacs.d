;;; package --- summary c/c++ ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全
(use-package irony
  :ensure t
  :disabled t
  :hook (((c-mode c++-mode) . irony-mode)
         (irony-mode . irony-cdb-autosetup-compile-options))
  :init
  :config
  (setq irony-additional-clang-options '("-std=c++11"))
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  ;; (defun my-irony-mode-hook ()
  ;;   (define-key irony-mode-map [remap completion-at-point]
  ;;     'irony-completion-at-point-async)
  ;;   (define-key irony-mode-map [remap complete-symbol]
  ;;     'irony-completion-at-point-async))

  ;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  )

(use-package company-irony
  :ensure t
  :disabled t
  :after (company irony))

(use-package irony-eldoc
  :ensure t
  :disabled t
  :after (irony)
  :hook (irony-mode . irony-eldoc))

(use-package company-irony-c-headers
  :ensure t
  :disabled t
  :after (company irony)
  :config)

(use-package company-c-headers
  :ensure t
  :after (company)
  :config
  )

;; 语法检查
(use-package flycheck-irony
  :ensure t
  :disabled t
  :after (flycheck irony)
  :hook (irony-mode . flycheck-irony-setup))

;; (defun cquery//enable()
;;   (condition-case nil
;;       (lsp-cquery-enable)
;;     (user-error nil)))

;; (use-package cquery
;;   :commands lsp-cquery-enable
;;   :hook (c-mode-common . cquery//enable)
;;   :ensure t
;;   :config
;;   (setq cquery-executable (concat (getenv "HOME") "/github/cquery/build/release/bin/cquery")))

(use-package ccls
  :ensure t
  ;; :hook ((c-mode c++-mode objc-mode) .
  ;;        (lambda () (require 'ccls) (lsp))))
  :config
  ;; (setq lsp-prefer-flymake nil)
  ;; (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  )

(defun set-company-backends-for-cxx()
  "C/C++ company补全后端设置."
  (setq-local company-backends '(
                                 company-lsp
                                 company-keywords
                                 company-gtags
                                 company-yasnippet
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )))

;;; 代码格式化
(use-package clang-format
  :ensure t
  :commands clang-format-region clang-format-buffer
  :bind (
         ("C-c i" . clang-format-region)
         ("C-c b" . clang-format-buffer))

  :config
)

(use-package cc-mode
  :ensure t
  :hook ((c-mode c++-mode) . set-company-backends-for-cxx)
  :config
  (c-toggle-auto-newline 1)
  (setq-default c-basic-offset 4)
  (defconst my-c-style
    '((c-tab-always-indent . t)
      (c-comment-only-line-offset . 4)
      (c-hanging-braces-alist . ((substatement-open after)
                                 (brace-list-open)))
      (c-hanging-colons-alist . ((member-init-intro before)
                                 (inher-intro)
                                 (case-label after)
                                 (label after)
                                 (access-label after)))
      (c-cleanup-list . (scope-operator empty-defun-braces defun-close-semi))
      (c-offsets-alist . (
                          (block-close . 0)
                          (case-label . +)
                          (defun-block-intro . +)
                          (defun-close . 0)
                          (statement . 0)
                          (statement-block-intro . +)
                          (statement-case-intro . +)
                          (topmost-intro . 0)
                          ))
      (c-echo-syntactic-information-p . t))
    "My C Programming Style")
  (c-add-style "lsl" my-c-style)
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          ;; (protobuf-mode . "protobuf")
                          (other . "linux")
                          ))

  )


(provide 'cxx-ide)
;;; cxx-ide.el ends here
