;;; package --- summary  yaml-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package yaml-mode
  :ensure t
  :hook (cmake-mode . untabify-buffer)
  )

(provide 'yaml-ide)
;;; yaml-ide.el ends here
