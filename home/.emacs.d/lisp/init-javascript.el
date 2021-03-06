;;; init-javascript.el -- javascript setup

;;; Commentary:
;;; js2 mode setup and related stuff

;;; Code:
(require 'use-package)

(use-package js2-mode
  :config
  (setq js2-basic-offset 2
        js-indent-level 2
        js2-global-externs '("module" "require" "setTimeout" "clearTimeout"
                             "setInterval" "clearInterval" "location"
                             "__dirname" "console" "JSON")
        js2-idle-timer-delay 0.1
        js2-concat-multiline-strings 'eol
        js2-mode-show-strict-warnings nil
        js2-mode-show-parse-errors nil)
  :mode ("\\.js\\'" . js2-mode)
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  :interpreter ("node" . js2-mode))

(use-package js2-refactor
  :config
  (js2r-add-keybindings-with-prefix "C-c C-r")
  :commands (js2-refactor-mode)
  :diminish js2-refactor-mode)

(use-package json-mode
  :commands (json-mode)
  :config
  (setq js-indent-level 2
        json-reformat:indent-width 2)
  :init
  (add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))
  :mode "\\.json'")

(use-package web-beautify
  :commands (web-beautify-css web-beautify-html web-beautify-js))

(provide 'init-javascript)
;;; init-javascript.el ends here
