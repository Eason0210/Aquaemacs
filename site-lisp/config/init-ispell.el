;;; init-ispell.el --- Ispell configuration

;; Filename: init-ispell.el
;; Description: Ispell configuration
;; Author: Eason Huang aqua0210@163.com
;; Maintainer: Eason Huang aqua0210@163.com
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-05-30 21:26:55
;; Version: 0.1
;; Last-Updated: 2020-05-30 21:27:03
;;           By: Eason Huang
;; URL:
;; Keywords: ispell
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
;; Ispell configuration
;;

;;; Installation:
;;
;; Put init-ispell.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-ispell)
;;
;; No need more.

;;; Change log:
;;
;; 2020/05/30
;;      First released.
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

(require 'flyspell-correct)
(require 'flyspell-correct-ido)

;;; Code:

(setq ispell-silently-savep t)          ;保存自己的个人词典不需要询问
(setq flyspell-issue-message-flag nil)
(setq ispell-dictionary "en_US"
      ispell-program-name "aspell")

(setq ispell-personal-dictionary (expand-file-name "flyspell/.aspell.en.pws" user-emacs-directory))

(setq ispell-extra-args '("--sug-mode=ultra"))


(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))                ;文本模式启动拼写检查
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))               ;更改日志和日志编辑模式关闭拼写检查

(add-hook 'prog-mode-hook                                  ;编程模式仅在注释启用拼写检查
          (lambda ()
            (flyspell-prog-mode)
            ))

(add-to-list 'ispell-skip-region-alist '("^#+BEGIN_SRC" . "^#+END_SRC")) ;不检查Org-mode的内嵌代码

;; unset keybindings of flyspell
(with-eval-after-load "flyspell"
  (define-key flyspell-mode-map (kbd "C-.") nil)
  (define-key flyspell-mode-map (kbd "C-;") nil)
  (define-key flyspell-mode-map (kbd "C-,") nil)
  (define-key flyspell-mode-map (kbd "C-M-i") nil)
  )

(provide 'init-ispell)

;;; init-ispell.el ends here
