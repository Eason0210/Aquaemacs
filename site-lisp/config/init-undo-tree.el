;;; init-undo-tree.el --- Configuration for undo-tree

;; Filename: init-undo-tree.el
;; Description: Configuration for undo-tree
;; Author: Eason Huang <aqua0210@g163.com>
;; Maintainer: Eason Huang <aqua0210@g163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-12-28 19:30:24
;; Version: 0.1
;; Last-Updated: 2020-12-28 19:30:31
;;           By: Eason Huang
;; Keywords:
;; Compatibility: GNU Emacs 27.1
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
;; Configuration for undo-tree
;;

;;; Installation:
;;
;; Put init-undo-tree.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-undo-tree)
;;
;; No need more.

;;; Customize:
;;
;;
;;; Change log:
;;
;; 2020/12/28
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

(require 'undo-tree)

;;; code

(global-undo-tree-mode)

(lazy-load-set-keys
 '(
   ("C-/" . undo-tree-undo)
   ("C-?" . undo-tree-redo)
   ))

(provide 'init-undo-tree)

;;; init-undo-tree.el ends here
