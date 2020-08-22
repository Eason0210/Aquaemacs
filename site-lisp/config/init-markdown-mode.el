;;; init-markdown-mode.el --- Configure for markdown mode.

;; Filename: init-markdown-mode.el
;; Description: Configure for markdown mode.
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2019, Andy Stewart, all rights reserved.
;; Created: 2019-09-22 08:25:25
;; Version: 0.1
;; Last-Updated: 2019-09-22 08:25:25
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-markdown-mode.el
;; Keywords:
;; Compatibility: GNU Emacs 26.3
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
;; Configure for markdown mode.
;;

;;; Installation:
;;
;; Put init-markdown-mode.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-markdown-mode)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-markdown-mode RET
;;

;;; Change log:
;;
;; 2019/09/22
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
(require 'markdown-mode)

;;; Code:

(dolist (hook (list
               'markdown-mode-hook
               ))
  (add-hook hook
            '(lambda ()
               (setq markdown-command "pandoc")
               (require 'olivetti)
               (olivetti-mode 1)
               (olivetti-set-width 120)

               ;; markdown preview, support syntax highlight and different diagrams
               (setq markdown-enable-wiki-links t
                     markdown-italic-underscore t
                     markdown-asymmetric-header t
                     markdown-make-gfm-checkboxes-buttons t
                     markdown-gfm-uppercase-checkbox t

                     markdown-content-type "application/xhtml+xml"
                     markdown-css-paths '("https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css"
                                          "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/styles/github.min.css")
                     markdown-xhtml-header-content "
<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
<style>
body {
  box-sizing: border-box;
  max-width: 740px;
  width: 100%;
  margin: 40px auto;
  padding: 0 10px;
}
</style>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/styles/default.min.css'>
<script src='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js'></script>
<script>
document.addEventListener('DOMContentLoaded', () => {
  document.body.classList.add('markdown-body');
  document.querySelectorAll('pre code').forEach((code) => {
    if (code.className != 'mermaid') {
      hljs.highlightBlock(code);
    }
  });
});
</script>
<script src='https://unpkg.com/mermaid/dist/mermaid.min.js'></script>
<script>
mermaid.initialize({
  theme: 'default',  // default, forest, dark, neutral
  startOnLoad: true
});
</script>
"
                     markdown-gfm-additional-languages "Mermaid")

               ;; `multimarkdown' is necessary for `highlight.js' and `mermaid.js'
               (when (executable-find "multimarkdown")
                 (setq markdown-command "multimarkdown"))

               ;; Preview with built-in webkit
               (with-no-warnings
                 (defun my-markdown-export-and-preview (fn)
                   "Preview with `xwidget' if applicable, otherwise with the default browser."
                   (if (featurep 'xwidget-internal)
                       (progn
                         (xwidget-webkit-browse-url (concat "file://" (markdown-export)))
                         (let ((buf (xwidget-buffer (xwidget-webkit-current-session))))
                           (when (buffer-live-p buf)
                             (and (eq buf (current-buffer)) (quit-window))
                             (pop-to-buffer buf))))
                     (funcall fn)))
                 (advice-add #'markdown-export-and-preview :around #'my-markdown-export-and-preview)))))

(provide 'init-markdown-mode)

;;; init-markdown-mode.el ends here
