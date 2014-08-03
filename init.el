;;Time-stamp: <2014-08-03 13:51:29 phenix>
;;---------------------------------------------------------------------
;;different OS configures
;;---------------------------------------------------------------------
(setq default-directory "~/.emacs.d/")

(defconst is-gnu-os (equal system-type 'gnu) "GNU Hurd system")
(defconst is-gnu-linux-os (equal system-type 'gnu/linux) "GNU/Linux system")
(defconst is-gnu-kfreebsd-os (equal system-type 'gnu/kfreebsd) "GNU system with a FreeBSD kernel")
(defconst is-darwin-os (equal system-type 'darwin) "Darwin")
(defconst is-ms-dos-os (equal system-type 'ms-dos) "MS-DOS system")
(defconst is-windows-nt-os (equal system-type 'windows-nt) "native win32 application")
(defconst is-cygwin-os (equal system-type 'cygwin) "cygwin")

(cond (is-gnu-os ())
      (is-gnu-linux-os ())
      (is-gnu-kfreebsd-os ())
      (is-darwin-os())
      (is-ms-dos-os ())
      (is-windows-nt-os())
      (cygmin-os ()))

;;---------------------------------------------------------------------
;;custom view
;;---------------------------------------------------------------------
(setq inhibit-startup-message t)
(global-linum-mode t) 
(fset 'yes-or-no-p 'y-or-n-p) ;

;;----------------------------------------------------------------------
;;require packages and load their init files
;;----------------------------------------------------------------------
(defun load-package-init-files()
	"load most packages init files"
	(let ((default-directory "~/.emacs.d/lisps"))
		(normal-top-level-add-to-load-path '(".." "."))
		(normal-top-level-add-subdirs-to-load-path))
	(require 'misc)
	(require 'init-elpa)
	(require 'init-basic)
	(require 'init-display)
	(require 'init-file-handle)
	(require 'init-frames)
	(require 'init-indentation)
	(require 'init-invocation)
	(require 'init-killing)
	(require 'init-desktop)
	(require 'init-program)
	(require 'init-text)
	(require 'init-color-theme)
	(require 'init-org)
	(require 'init-org2blog)
	)
(add-hook 'after-init-hook 'load-package-init-files)

;;----------------------------------------------------------------------
;;init c/C++ mode
;;----------------------------------------------------------------------
(add-hook 'c-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))

(add-hook 'c++-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))

;;----------------------------------------------------------------------
;;Lua mode
;;----------------------------------------------------------------------

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
    (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
    (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;----------------------------------------------------------------------XS
