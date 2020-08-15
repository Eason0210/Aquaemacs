;;; init-imbot.el --- imbot configuration

;; Filename: init-imbot.el
;; Description: imbot configuration
;; Author: Eason Huang <aqua0210@163.com>
;; Maintainer: Eason Huang <aqua0210@163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-07-24 19:00:33
;; Version: 0.1
;; Last-Updated: 2020-07-24 19:00:25
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
;; imbot configuration
;;

;;; Installation:
;;
;; Put init-imbot.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-imbot)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-imbot RET
;;

;;; Change log:
;; 2020/07/24
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


(require 'imbot)

;;; Code:

(when (eq system-type 'darwin)
  (setq imbot-command "macism")
  (setq imbot-arg-cn "im.rime.inputmethod.Squirrel.Rime")
  (setq imbot-arg-en "com.apple.keylayout.ABC"))
(when (eq system-type 'gnu/linux)
  (setq imbot-command "fcitx-remote")
  (setq imbot-arg-cn "-o")
  (setq imbot-arg-en "-c"))

(provide 'init-imbot )

;;; init-imbot.el ends here
