;;;  init-common-lisp.el --- Configuration for common-lisp

;; Filename: init-common-lisp.el
;; Description: Configuration for common-lisp
;; Author: Eason Huang <aqua0210@g163.com>
;; Maintainer: Eason Huang <aqua0210@g163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-05-24 14:52:23
;; Version: 0.1
;; Last-Updated: 2020-05-24 14:52:23
;;           By: Eason Huang
;; Keywords:
;; Compatibility: GNU Emacs 27.0.91
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
;; Configuration for common-lisp
;;

;;; Installation:
;;
;; Put init-common-lisp.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-common-lisp)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-common-lisp RET
;;

;;; Change log:
;;
;; 2020/05/24
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


;;; Code

(add-hook 'lisp-mode-hook (lambda ()
                            (unless (featurep 'slime)
                              (load (expand-file-name "~/quicklisp/slime-helper.el"))
                              (require 'slime-autoloads)
                              (normal-mode))))

(setq inferior-lisp-program "sbcl")

;; From http://bc.tech.coop/blog/070515.html
(defun lispdoc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                 "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not
                                                   symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                          "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string= inp "")
                                default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                                "full+text+search"
                              "basic+search")))))))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)

(provide 'init-common-lisp)

;;; init-common-lisp.el ends here
