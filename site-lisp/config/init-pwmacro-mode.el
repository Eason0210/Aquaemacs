;;; init-pwmacro-mode.el --- major mode for editing pwmacro. -*- coding: utf-8; lexical-binding: t; -*-


;; Filename: init-pwmacro-mode.el
;; Description: File mode setup
;; Author: Andy Stewart <andy@freedom>
;; Maintainer: Andy Stewart <andy@freedom>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-04-21 15:41:00
;; Version: 0.1
;; Last-Updated: 2020-04-21 15:41:29
;;           By: Eason Huang
;; URL:
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
;; File mode setup
;;

;;; Installation:
;;
;; Put init-pwmacro-mode.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-pwmacro-mode)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;;

;;; Change log:
;;
;; 2020/04/21
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

;;; Code:

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq pwmacro-font-lock-keywords
      (let* (
             ;; define several category of keywords
             (pwmacro-keywords '("DECLARE" "declare" "break" "BREAK" "CONTINUE" "continue" "set" "SET" "EXPR" "expr" "EXPR_I" "expr_i"
                           "SIZE" "size" "VERSION" "version" "AND" "and" "OR" "or" "NOT" "not" "else" "ELSE" "if" "IF" "elseif" "ELSEIF"
                           "ENDIF" "endif" "WHILE" "while" "ENDWHILE" "endwhile"))
             (pwmacro-types '("double" "integer" "string" ))
             (pwmacro-constants '("PI"))
             (pwmacro-events '("at_rot_target" "at_target" "attach"))
             (pwmacro-functions '("llAbs" "llAcos" "llAddToLandBanList" "llAddToLandPassList"))

             ;; generate regex string for each category of keywords
             (pwmacro-keywords-regexp (regexp-opt pwmacro-keywords 'words))
             (pwmacro-types-regexp (regexp-opt pwmacro-types 'words))
             (pwmacro-constants-regexp (regexp-opt pwmacro-constants 'words))
             (pwmacro-events-regexp (regexp-opt pwmacro-events 'words))
             (pwmacro-functions-regexp (regexp-opt pwmacro-functions 'words)))

        `(
          (,pwmacro-types-regexp . font-lock-type-face)
          (,pwmacro-constants-regexp . font-lock-constant-face)
          (,pwmacro-events-regexp . font-lock-builtin-face)
          (,pwmacro-functions-regexp . font-lock-function-name-face)
          (,pwmacro-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

;; coloring of pwmacro style commment syntax
(defvar pwmacro-mode-syntax-table nil "Syntax table for `pwmacro-mode'.")

(setq pwmacro-mode-syntax-table
      (let ( (synTable (make-syntax-table)))
        ;; pwmacro style comment: “# …”
        (modify-syntax-entry ?# "<" synTable)
        (modify-syntax-entry ?\n ">" synTable)
        synTable))

;;;###autoload
(define-derived-mode pwmacro-mode prog-mode "pwmacro mode"
  "Major mode for editing pwmacro (PolyWorks Macro Scripting Language)…"
  (setq font-lock-defaults (list nil nil))
  (set-syntax-table pwmacro-mode-syntax-table)
  ;; code for syntax highlighting
  (setq font-lock-defaults '((pwmacro-font-lock-keywords)))
  (setq-local comment-start "# ")
  (setq-local comment-end "")
  (display-line-numbers-mode)
  )

(provide 'init-pwmacro-mode)

;;; init-pwmacro-mode.el ends here
