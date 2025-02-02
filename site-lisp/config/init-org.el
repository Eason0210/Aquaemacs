;;; init-org.el --- Configure for org-mode

;; Filename: init-org.el
;; Description: Configure for org-mode
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2020, Andy Stewart, all rights reserved.
;; Created: 2020-03-31 22:32:49
;; Version: 0.1
;; Last-Updated: 2020-03-31 22:32:49
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-org.el
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
;; Configure for org-mode
;;

;;; Installation:
;;
;; Put init-org.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-org)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-org RET
;;

;;; Change log:
;;
;; 2020/03/31
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

(require 'org-capture)

;;; Code:



(with-eval-after-load 'org
  (setq org-odt-preferred-output-format "docx") ;ODT转换格式默认为docx
  (setq org-startup-folded nil)                 ;默认展开内容
  (setq org-startup-indented t)                 ;默认缩进内容

  (define-key org-mode-map (kbd "C-,") nil)     ;取消设置org-mode的按键绑定
  (define-key org-mode-map (kbd "M-h") nil)     ;取消设置org-mode的按键绑定

  (require 'init-org-gtd)

  (defun org-export-docx ()
    (interactive)
    (let ((docx-file (concat (file-name-sans-extension (buffer-file-name)) ".docx"))
          (template-file (concat (file-name-as-directory Aquaemacs-root-dir)
                                 (file-name-as-directory "template")
                                 "template.docx")))
      (shell-command (format "pandoc %s -o %s --reference-doc=%s"
                             (buffer-file-name)
                             docx-file
                             template-file
                             ))
      (message "Convert finish: %s" docx-file))))

(dolist (hook (list
               'org-mode-hook
               ))
  (add-hook hook '(lambda ()
                    (require 'valign)
                    (valign-mode)

                    (setq truncate-lines nil) ;默认换行

                    ;;Org-brain
                    (require 'org-brain)
                    (setq org-brain-path "~/org/brain")

                    (define-key org-mode-map (kbd "C-c b") org-brain-prefix-map)
                    (setq org-id-track-globally t)
                    (setq org-id-locations-file "~/Org/brain/.org-id-locations")
                    (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
                    (push '("b" "Brain" plain (function org-brain-goto-end)
                            "* %i%?" :empty-lines 1)
                          org-capture-templates)
                    (setq org-brain-visualize-default-choices 'all)
                    (setq org-brain-title-max-length 12)
                    (setq org-brain-include-file-entries nil
                          org-brain-file-entries-use-title nil)

                    ;; enable ob-mermaid
                    (require 'ob-mermaid)

                    (require 'org-web-tools)
                    )))

(provide 'init-org)

;;; init-org.el ends here
