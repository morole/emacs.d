;;; init-projectile.el --- 
;; 
;; Filename: init-projectile.el
;; Description: 
;; Author: phenix3443(phenix3443@gmail.com)
;; Maintainer: 
;; Created: 周二 一月 13 19:42:55 2015 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 周六 二月  7 17:41:01 2015 (+0800)
;;           By: chengxu70
;;     Update #: 10
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

(require-package 'projectile)

(require 'projectile)
(projectile-global-mode)
;; Helm Integration
(require-package 'helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)

(require-package 'helm-ag)
(defun my-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))

;; indexing
;;(setq projectile-indexing-method 'alien)
;; caching
(when (equal system-type 'windows-nt)
  (setq projectile-enable-caching t))
;; switching projects
(setq projectile-remember-window-configs t)
(setq projectile-switch-project-action 'helm-projectile-find-file)
;; completion
(setq projectile-completion-system 'helm)

;;perspective
(require-package 'perspective)
(persp-mode)
(require-package 'persp-projectile)

(provide 'init-projectile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-projectile.el ends here
