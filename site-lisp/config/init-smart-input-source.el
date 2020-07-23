;;; init-smart-input-source.el --- sis configuration

;; Filename: init-smart-input-source.el
;; Description: sis configuration
;; Author: Eason Huang <aqua0210@163.com>
;; Maintainer: Eason Huang <aqua0210@163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-06-19 19:26:00
;; Version: 0.1
;; Last-Updated: 2020-07-23 11:03:02
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
;; sis configuration
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
;; 2020-07-23
;;      * Rename smart-input-source as sis
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


(require 'sis)

;;; Code:

(when (eq system-type 'windows-nt)
  (sis-ism-lazyman-config "1033" "2052" 'im-select))

(when (eq system-type 'darwin)
  (sis-ism-lazyman-config
   "com.apple.keylayout.ABC" "im.rime.inputmethod.Squirrel.Rime"))

;; enable the /respect/ mode
(add-to-list 'sis-prefix-override-keys "C-z")
(add-to-list 'sis-prefix-override-keys "s-x")
(add-to-list 'sis-prefix-override-keys "s-j")
(add-to-list 'sis-prefix-override-keys "C-.")

;; switch to English in i-search
(setq sis-preserve-go-english-triggers
      (list 'isearch-forward 'isearch-backward))
(setq sis-preserve-restore-triggers
      (list 'isearch-exit 'isearch-abort))

;; change cursor color
(sis-global-cursor-color-mode t)
(setq sis-default-cursor-color "red")
(setq sis-other-cursor-color "orange")

;; enable the /respect/ mode
(sis-global-respect-mode t)

;; enable the /follow context/ mode for all buffers
(sis-global-follow-context-mode t)
;; enable the /inline english/ mode for all buffers
(sis-global-inline-mode t)

(provide 'init-smart-input-source )

;;; init-smart-input-source.el ends here
