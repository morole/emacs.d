;;; init-cedet.el --- 
;; 
;; Filename: init-cedet.el
;; Description: 
;; Author: phenix<phenix3443@gmail.com>
;; Maintainer: 
;; Created: 二  1月 20 01:48:51 2015 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 周六 二月  7 18:04:18 2015 (+0800)
;;           By: chengxu70
;;     Update #: 27
;; URL: 
;; Doc URL: 
;; Keywords: 
;; Compatibility: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

(require-package 'cedet)

(require 'cedet)
(require 'cedet-files)
(require 'cedet-global)
(require 'cedet-idutils)

;; global support
(setq cedet-global-command "global")

;; ede
(setq ede-locate-setup-options '(ede-locate-global ede-locate-base))
(global-ede-mode t)
(defvar tmp-dir)
(setq ede-project-placeholder-cache-file (concat tmp-dir "ede-projects.el"))

;; configure from semantic manual
;; https://www.gnu.org/software/emacs/manual/html_mono/semantic.html
(require 'semantic)
;; 2.1 Semantic mode
(setq semantic-default-submodes '(global-semanticdb-minor-mode
								  global-semantic-decoration-mode
								  ;;global-semantic-highlight-func-mode
								  global-semantic-idle-local-symbol-highlight-mode
								  global-semantic-idle-scheduler-mode
                                  global-semantic-idle-summary-mode
								  global-semantic-idle-completions-mode
								  ;;global-semantic-mru-bookmark-mode
								  ;;global-semantic-stickyfunc-mode
								  ))
;; 2.2.1 Semanticdb Tag Storage
(setq semantic-default-save-directory (concat tmp-dir "semanticdb/"))

;; 2.2.2.2 SemanticDB project roots
(defun get-semantic-project-root()
  (let((semantic-projct-root-markers . '(".git" ".svn" "GTAGS" "TAGS")))
	)) 
(add-hook 'semanticdb-project-root-functions 'projectile-project-root)
;; 2.2.2.3 Include Paths
(defvar user-include-dirs (list "." "./include" ".." "../include"))
(defvar win-include-dirs (list "C:/MinGW/include" "C:/msys64/usr/include" "C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/include"))
(require 'semantic/bovine/c)
(let ((include-dirs user-include-dirs))
  (when (eq system-type 'window-nt)
	(semantic-reset-system-include 'c-mode)
	(semantic-reset-system-include 'c++-mode)
	(append include-dirs win-include-dirs))
  (mapc (lambda (dir)
		  (semantic-add-system-include dir 'c-mode)
		  (semantic-add-system-include dir 'c++-mode))
		include-dirs))

;; 2.5 Speedbar
(require 'semantic/sb)

(semantic-mode 1)


;; srecode
;;(add-hook 'prog-mode-hook '(lambda()
;;							 (global-srecode-minor-mode 1)))

(provide 'init-cedet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cedet.el ends here
