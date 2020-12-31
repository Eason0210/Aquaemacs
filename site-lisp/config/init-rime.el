;;; init-rime.el --- Configuration for emacs-rime

;; Filename: init-rime.el
;; Description: Configuration for emacs-rime
;; Author: Eason Huang <aqua0210@g163.com>
;; Maintainer: Eason Huang <aqua0210@g163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-03-22 14:52:23
;; Version: 0.1
;; Last-Updated: 2020-05-22 14:52:23
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
;; Configuration for emacs-rime
;;

;;; Installation:
;;
;; Put init-rime.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-rime)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-rime RET
;;

;;; Change log:
;;
;; 2020/05/22
;;      * Improved to use predicate functions
;;
;; 2020/03/22
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
(require 'rime)

;;; Code:
(when (eq system-type 'windows-nt)
  (setq rime-user-data-dir "~/.emacs.d/emacs-rime/Rime")
  (setq rime-share-data-dir "~/.emacs.d/emacs-rime/data")
  (setq rime-posframe-properties
        (list :background-color "#333333"
              :foreground-color "#dcdccc"
              :font "微软雅黑-15"
              :internal-border-width 10)))

(when (eq system-type 'gnu/linux)
  (setq rime-posframe-properties
        (list :background-color "#333333"
              :foreground-color "#dcdccc"
              :font "Noto Sans Mono CJK SC"
              :internal-border-width 10)))

(when (eq system-type 'darwin)
  (setq rime-librime-root "~/.emacs.d/librime/dist")
  (setq rime-user-data-dir "~/erime/")
  (setq rime-posframe-properties
        (list :background-color "#333333"
              :foreground-color "#dcdccc"
              :font "冬青黑体简体中文-18"
              :internal-border-width 10)))

(setq default-input-method "rime"
      rime-show-candidate nil)

(setq rime-show-preedit t)

;;代码中直接英文，注释和其他模式中根据断言选择输入模式
(setq rime-disable-predicates '(rime-predicate-prog-in-code-p
                                rime-predicate-current-uppercase-letter-p
                                rime-predicate-after-alphabet-char-p
                                rime-predicate-punctuation-after-space-cc-p
                                rime-predicate-punctuation-line-begin-p
                                rime-predicate-space-after-cc-p
                                ))

(lazy-load-set-keys
 '(
   ("M-o" . rime--backspace)
   ("M-m" . rime--return)
   ("M-h" . rime--escape))
 rime-active-mode-map)

;; toggle to English when using ace-jump
(add-hook 'awesome-tab-ace-jump-hook
          (lambda ()
            (if (equal current-input-method "rime")
                (toggle-input-method))))

(provide 'init-rime)

;;; init-rime.el ends here
