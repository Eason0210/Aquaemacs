;;; init-org-gtd.el --- org-gtd configuration

;; Filename: init-org-gtd.el
;; Description: org-gtd configuration
;; Author: Eason Huang <aqua0210@163.com>
;; Maintainer: Eason Huang <aqua0210@163.com>
;; Copyright (C) 2020, Eason Huang, all rights reserved.
;; Created: 2020-09-01 12:45:00
;; Version: 0.1
;; Last-Updated: 2020-09-01 12:45:41
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
;; org-gtd configuration
;;

;;; Installation:
;;
;; Put init-org-gtd.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-org-gtd)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-org-gtd RET
;;

;;; Change log:
;;
;; 2020/08/31
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

(require 'org-gtd)
;;set status for TODO.
(setq org-todo-keywords
      '((sequence "NEXT(n)" "TODO(t)" "WAIT(w@)" "|" "DONE(d)" "CANCELED(c@)")))

;;set priority
(setq org-highest-priority ?A)
(setq org-lowest-priority ?D)
(setq org-default-priority ?A)

;; where org-gtd will put its files. This value is also the default one.
(setq org-gtd-directory "~/beorg/")
;; package: https://github.com/Malabarba/org-org-gtd-property
;; this is so you can see who an item was delegated to in the org-gtd
(setq org-org-gtd-property-list '("DELEGATED_TO"))
;; I think this makes the org-gtd easier to read
(setq org-org-gtd-property-position 'next-line)
;; package: https://www.nongnu.org/org-edna-el/
;; org-edna is used to make sure that when a project task gets DONE,
;; the next TODO is automatically changed to NEXT.
(setq org-edna-use-inheritance t)

(org-edna-load)

;; (define-key org-mode-map (kbd "C-c a") 'org-agenda)
;; (define-key org-mode-map (kbd "C-c d c") 'org-gtd-capture)  ;; add item to inbox
;; (define-key org-mode-map (kbd "C-c d a") 'org-agenda-list) ;; see what's on your plate today
(define-key org-mode-map (kbd "C-c d p") 'org-gtd-process-inbox) ;; process entire inbox
(define-key org-mode-map (kbd "C-c d n") 'org-gtd-show-all-next) ;; see all NEXT items
(define-key org-mode-map (kbd "C-c d s") 'org-gtd-show-stuck-projects) ;; see projects that don't have a NEXT item
;; the keybinding to hit when you're done editing an item in the processing phase
(define-key org-mode-map (kbd "C-c c") 'org-gtd-clarify-finalize)


;; because we need to add the org-gtd directory to the org-gtd files
;; use as-is if you don't have an existing org-org-gtd setup
;; otherwise push the directory to the existing list
(setq org-org-gtd-files `(,org-gtd-directory))
;; a useful view to see what can be accomplished today
(setq org-org-gtd-custom-commands '(("g" "Scheduled today and all NEXT items"
                                     ((org-gtd "" ((org-org-gtd-span 1))) (todo "NEXT")))))


;; note that org-gtd has to be loaded before this
;; use as-is if you don't have an existing set of org-capture templates
;; otherwise add to existing setup
;; you can of course change the letters, too
(setq org-capture-templates `(("i" "Inbox"
                               entry (file ,(org-gtd--path org-gtd-inbox-file-basename))
                               "* %?\n%U\n\n  %i"
                               :kill-buffer t)
                              ("l" "Todo with link"
                               entry (file ,(org-gtd--path org-gtd-inbox-file-basename))
                               "* %?\n%U\n\n  %i\n  %a"
                               :kill-buffer t)))
(provide 'init-org-gtd)
;;; init-agenda.el ends here
