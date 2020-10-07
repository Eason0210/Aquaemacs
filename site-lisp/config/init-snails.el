;;; init-snails.el --- snails setup

;; Filename: init-snails.el
;; Description: Configuration for snails
;; Author: Eason Huang <aqua0210@g163.com>
;; Maintainer: Eason Huang <aqua0210@g163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-10-07 09:22:24
;; Version: 0.1
;; Last-Updated: 2020-10-07 09:22:32
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
;; Configuration for snails
;;

;;; Installation:
;;
;; Put init-snails.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-snails)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-snails RET
;;
;;; Change log:
;;
;; 2020/10/07
;;      * First released.
;;
;;; Acknowledgements:
;;

;;; TODO
;;

;;; Require
;;

;;; Code:

(setq snails-default-backends '(snails-backend-awesome-tab-group
                                snails-backend-buffer
                                snails-backend-recentf
                                snails-backend-directory-files
                                snails-backend-bookmark))

(provide 'init-snails)

;;; init-snails.el ends here
