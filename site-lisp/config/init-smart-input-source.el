;;; init-smart-input-source.el --- smart-input-source configuration

;; Filename: init-smart-input-source.el
;; Description: smart-input-source configuration
;; Author: Eason Huang <aqua0210@163.com>
;; Maintainer: Eason Huang <aqua0210@163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-06-19 19:26:00
;; Version: 0.1
;; Last-Updated: 2020-06-19 19:26:08
;;           By: Eason Huang
;; Keywords:
;; Compatibility: GNU Emacs 28.0.50
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; smart-input-source configuration
;;

;;; Installation:
;;
;; Put init-smart-input-source.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-smart-input-source)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-smart-input-source RET
;;

;;; Change log:
;;
;; 2020/06/19
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require


(require 'smart-input-source)

;;; Code:

(when (eq system-type 'windows-nt)
  (setq smart-input-source-external-ism "im-select.exe")
  (setq smart-input-source-english "1033")
  (setq-default smart-input-source-other "2052"))

(when (eq system-type 'darwin)
  (setq smart-input-source-english "com.apple.keylayout.ABC")
  (setq-default smart-input-source-other "im.rime.inputmethod.Squirrel.Rime"))

;; enable the /respect/ mode
(add-to-list 'smart-input-source-prefix-override-keys "C-z")
(add-to-list 'smart-input-source-prefix-override-keys "s-x")

;; change cursor color
(smart-input-source-global-cursor-color-mode t)
(setq smart-input-source-other-cursor-color "orange")

;; enable the /respect/ mode
(smart-input-source-global-respect-mode t)

;; enable the /follow context/ mode for all buffers
(smart-input-source-global-follow-context-mode t)
;; enable the /inline english/ mode for all buffers
(smart-input-source-global-inline-mode t)

(provide 'init-smart-input-source)

;;; init-smart-input-source.el ends here
