(require-package 'chruby)
(require-package 'inf-ruby)
(require-package 'rinari)
(require-package 'robe)
(require-package 'rspec-mode)
(require-package 'ruby-end)
(require-package 'ruby-hash-syntax)
(require-package 'ruby-refactor)

(require 'chruby)
(require 'compile)
(require 'robe)
(require 'ruby-end)
(require 'ruby-refactor)

(global-rinari-mode 1)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (outline-minor-mode)
             (subword-mode)
             (setq outline-regexp
                   " *\\(def \\|class\\|module\\|describe \\|it \\)")))

(add-hook 'ruby-mode-hook
          (function (lambda ()
                      (setq evil-shift-width ruby-indent-level))))

(add-to-list 'auto-mode-alist
             '("\\.rake$" . ruby-mode))

(setq flycheck-ruby-executable "/opt/rubies/ruby-2.1.5/bin/ruby")
(setq flycheck-ruby-rubocop-executable "~/rubocop.sh")

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s; docker-compose run --rm web bundle exec rspec %s"
                   (projectile-project-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s; docker-compose run --rm web bundle exec rspec %s -l %s"
                   (projectile-project-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)
                   ) t))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c r f") 'rspec-compile-file)
            (local-set-key (kbd "C-c r n") 'rspec-compile-on-line)
            ))

(diminish 'rinari-minor-mode)
(diminish 'ruby-end-mode)

(provide 'init-ruby)
