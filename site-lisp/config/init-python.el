;;; init-python.el --- Init python

;; Filename: init-python.el
;; Description: Init python
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2014, Andy Stewart, all rights reserved.
;; Created: 2014-01-04 11:10:45
;; Version: 0.1
;; Last-Updated: 2014-01-04 11:10:45
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-python.el
;; Keywords:
;; Compatibility: GNU Emacs 24.3.50.1
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
;; Init python
;;

;;; Installation:
;;
;; Put init-python.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-python)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-python RET
;;

;;; Change log:
;;
;; 2014/01/04
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
(require 'python)

;;; Code:

(lazy-load-local-keys
 '(
   ("C-S-j" . jump-to-import)
   )
 python-mode-map
 "python-extension")

(setq python-shell-interpreter "python3")

(provide 'init-python)

;;; init-python.el ends here
