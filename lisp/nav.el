;;; nav.el -- Navigation and file formatting

(require 'ido-vertical-mode)
(require 'rbenv)
(require 'smartparens-config)
(require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (setq web-mode-enable-auto-pairing -1)


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq rbenv-modeline-function 'rbenv--modeline-plain)
(global-rbenv-mode)

(add-hook 'after-init-hook  'global-company-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(ido-mode 1)
  (ido-vertical-mode 1)
    (setq ido-vertical-define-keys 'C-n-and-C-p-only)
(smex-initialize)
  (defadvice smex (around space-inserts-hyphen activate compile)
    (let ((ido-cannot-complete-command
           `(lambda ()
              (interactive)
              (if (string= " " (this-command-keys))
                  (insert ?-)
                (funcall ,ido-cannot-complete-command)))))
      ad-do-it))

(projectile-global-mode)
(smartparens-global-mode 1)
(global-page-break-lines-mode)

(setq-default indent-tab-mode             nil)
(setq-default indent-tabs-mode             -1)
(setq-default tab-width                     2)
(setq         c-basic-offset                2)
(setq         css-indent-offset             2)
(setq         web-mode-markup-indent-offset 2)

(setq mouse-wheel-scroll-amount (quote (0.01)))

(defun my-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with root-privileges (using tramp/sudo), if the file is not writable by user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

(defun my-untabify-everything ()
  (untabify (point-min) (point-max)))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
