; Time-stamp: <2014-08-27 09:54:15 chengxu70>
; https://https://github.com/syohex/emacs-helm-gtags
; required by program-conf.el

(require-package 'helm-gtags)

(require 'helm-gtags)
(add-hook 'prog-mode-hook 'helm-gtags-mode)

(setq helm-gtags-ignore-case t
	  helm-gtags-auto-update t
	  helm-gtags-use-input-at-cursor t
	  helm-gtags-pulse-at-cursor t
	  helm-gtags-prefix-key (kbd "C-c g")
	  helm-gtags-suggested-key-mapping t)

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
	 ;(define-key helm-gtags-mode-map (kbd "M-c") 'helm-gtags-create-tags)
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
 	 (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)))

(provide 'init-helm-gtags)


