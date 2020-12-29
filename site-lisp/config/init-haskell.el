;;; init-haskell.el --- Haskell configuration

;; Filename: init-haskell.el
;; Description: Haskell configuration
;; Author: Andy Stewart lazycat.manatee@gmail.com
;; Maintainer: Andy Stewart lazycat.manatee@gmail.com
;; Copyright (C) 2008, 2009, Andy Stewart, all rights reserved.
;; Created: 2008-10-20 09:50:26
;; Version: 0.1
;; Last-Updated: 2008-10-20 09:50:26
;;           By: Andy Stewart
;; URL:
;; Keywords: haskell
;; Compatibility: GNU Emacs 23.0.60.1
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
;; Haskell configuration
;;

;;; Installation:
;;
;; Put init-haskell.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-haskell)
;;
;; No need more.

;;; Change log:
;;
;; 2008/10/20
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
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list
             (concat Aquaemacs-extension-dir "/haskell-mode/"))
(require 'haskell-indentation)
(require 'haskell-extension)
(require 'dante)

;;; Code:

(add-hook 'haskell-mode-hook 'turn-on-font-lock) ;高亮模式
(add-hook 'haskell-mode-hook 'haskell-indentation-mode) ;智能缩进模式
(add-hook 'haskell-mode-hook 'hs-lint-mode-hook) ;代码建议

(add-hook 'haskell-mode-hook 'subword-mode)
(add-hook 'haskell-cabal-mode 'subword-mode)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'dante-mode)

(setq haskell-font-lock-symbols t)               ;美化符号

;; Source code helpers

(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(lazy-load-local-keys
 '(
   ("C-c l" . hs-lint)
   )
 haskell-mode-map
 "hs-lint"
 )

(lazy-load-set-keys
 '(
   ("M-;" . comment-dwim-with-haskell-style) ;注释
   ("C-c g" . hoogle)
   )
 haskell-mode-map
 )

(provide 'init-haskell)

;;; init-haskell.el ends here
