;;; package -- emacs 配置文件
;;; Commentary:
;; -*- coding:utf-8; -*-

;;; code:

(require 'package)
;; (setq package-enable-at-startup nil)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "tsinghua-gnu" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")) t)
  (add-to-list 'package-archives (cons "tsinghua-melpa" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")) t)
  (add-to-list 'package-archives (cons "tsinghua-marmalade" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")) t)
  (add-to-list 'package-archives (cons "tsinghua-org" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/org/")) t)

  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(add-to-list 'load-path (expand-file-name "lisps" user-emacs-directory))

(require 'misc)
(require 'buildin-cfg)
(require 'aux-utils-cfg)
(require 'theme-cfg)

(require 'editor-cfg)

(require 'common-ide)
(require 'lisp-ide)
(require 'cxx-ide)
(require 'cmake-ide)
(require 'golang-ide)
(require 'lua-ide)
(require 'json-ide)
(require 'ruby-ide)
(require 'python-ide)
(require 'protobuf-ide)
(require 'sql-ide)
(require 'php-ide)
(require 'powershell-ide)
(require 'web-ide)


(require 'crontab-ide)
(require 'markdown-ide)
(require 'docker-ide)
(require 'tex-ide)
(require 'yaml-ide)
(require 'nginx-ide)

(require 'project-cfg)
(require 'vcs-cfg)
(require 'org-cfg)
(require 'github-cfg)
(require 'tramp-cfg)

;; GNU Emacs Lisp reference manual.
;; An Introduction to Programming in Emacs Lisp.
;; GNU Emacs FAQ.
;; GNU Emacs on MS Windows FAQ.
;; GNU Emacs reference cards.
;; Ada-mode(Emacs mode for editing Ada code.)
;; Auth-source Emacs library for storing and sharing secret data.
;; 在 window 下莫名卡顿，先注释
;; (require 'auth-source)
;; (add-to-list 'auth-sources "~/.emacs.d/.authinfo.gpg")
;; start pageant first
;; (when (equal system-type 'windows-nt)
;;   (let ((str (shell-command-to-string "tasklist /FI \"IMAGENAME eq pageant.exe\"")))
;;  (when (not (string-match "pageant.exe" str))
;;    (when (executable-find "pageant")
;;      ;;  (shell-command-to-string "taskkill /IM pageant.exe")
;;      (start-process "pageant" nil "pageant")))))

;; Autotype Features for frequently-entered text.
;; Calc Calc is an advanced calculator and mathematical tool.

;; CC mode Mode for editing C, C++, Objective C, Java, Pike, and IDL code.
;; CL   GNU Emacs Common Lisp support.
;; D-Bus    Emacs API for using the D-Bus message bus system.
;; Dired-X  Extra Dired features.
;; Ebrowse  C++ class browser.
;; EDE  Package to simplify building and debugging programs.
;;  (require 'init-cedet)
;; EDT  EDT Emulator.
;; Ediff    Visual interface for comparing and merging programs.
;; EIEIO    Common Lisp Object System library for Emacs.
;; Emacs GnuTLS Emacs interface to the GnuTLS library.
;; Emacs MIME   Emacs library for composing and showing MIME messages.
;; EasyPG Assistant Emacs user interface to the GNU Privacy Guard.
;; ERC  Modular and extensible IRC client for Emacs.
;; ERT  The Emacs Lisp Regression Testing tool.
;; Eshell   Command shell implemented in Emacs Lisp.
;; EUDC The Emacs Unified Directory Client.
;; EWW  A web browser.
;; Forms    Mode for manipulating text forms.
;; Flymake  On-the-fly programming language syntax checker.
;; Gnus Mail and news reader.
;; Htmlfontify  Export buffers to HTML.
;; IDLWAVE  Major mode and shell for IDL and WAVE/CL files.
;; IDO  A package for interactively doing things.
;; Info The Info documentation browser.
;; Mairix   Emacs interface to the Mairix email indexing tool.
;; Message  Mail and news composition mode for Gnus.
;; MH-E Interface to the MH mail system.
;; Newsticker   A newsticker for Emacs.
;; nXML XML editing mode with RELAX NG support.
;; Octave mode  Major mode for GNU Octave code.
;; Org mode Outline-based note manager and organizer.
;; PCL-CVS  Front-end to CVS.
;; PGG  Obsolete interface library for secure communication; see EasyPG.
;; RCIRC    IRC client for Emacs.
;; RefTeX   Manage labels, references, citations and index entries.
;; Remember Tool for managing todo lists, schedules, and other data.
;; SASL Emacs interface to the SASL (Simple Authentication and Security Layer) framework.
;; Semantic Source code parsing utilities for Emacs.
;; Semantic parser (bovine) The original Semantic parser.
;; Semantic Recoder Converts information from Semantic back into code.
;; SES  The Simple Emacs Spreadsheet.
;; Sieve    Mode for the Sieve mail filtering language.
;; SMTP Emacs library for sending mail via SMTP.
;; Speedbar File and tag summarizing utility.
;; Supercite    Package for citing and attributing messages.
;; Todo mode    Keeping track of things to do.
;; URL  Library for manipulating and retrieving URLs and URIs.
;; 5 General Facilities
;; 5.2 Proxies and Gatewaying
;; (setq url-proxy-services
;;    '(
;;      ("http" . "127.0.0.1:10086")
;;      ("https" . "127.0.0.1:10086")
;;      ))

;; Vip  An older VI emulator.
;; Viper    VI emulator.
;; Widget   Library for graphical widgets.
;; Wisent   An Emacs implementation of the GNU Compiler Compiler Bison.
;; Woman    Browsing UN*X pages without man.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
