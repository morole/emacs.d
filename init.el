
; Time-stamp: <2014-08-08 14:05:15 chengxu70>

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

;加载配置文件，按照 Emacs Manual 章节顺序 
(defun load-package-init-files()
	"load most packages init files"
	(let ((default-directory "~/.emacs.d/lisps"))
		(normal-top-level-add-to-load-path '(".." "."))
		(normal-top-level-add-subdirs-to-load-path))
	(require 'misc)
	(require 'packages-conf) ;47
	(require 'minibuffer-conf) ; 8
	(require 'killing-conf) ; 12
	(require 'display-conf) ; 14
	(require 'files-conf) ; 18
	(require 'frames-conf) ; 21
	(require 'indentation-conf) ; 24
	(require 'text-conf) ; 25
	(require 'program-conf) ; 26
	(require 'customization-conf) ; 48
	)
(add-hook 'after-init-hook 'load-package-init-files)
