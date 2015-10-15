;;; my-packages.el --  Checks for/installs desired packages

(require 'cl)
(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize)


(defvar required-packages
  '(
    bongo
    column-marker
    company
    csharp-mode
    edit-server
    exec-path-from-shell
    expand-region
    google-maps
    hl-indent
    ido-vertical-mode
    linum-relative
    magit
    matlab-mode
    multiple-cursors
    neotree
    nyan-mode
    pacmacs
    page-break-lines
    projectile
    rainbow-mode
    rbenv
    ruby-guard
    scss-mode
    smartparens
    smex
    web-mode
    zenburn-theme
  ))

(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "GNU Emacs in now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
