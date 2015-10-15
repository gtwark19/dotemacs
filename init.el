;;; init.el -- The first thing GNU Emacs runs

(run-with-idle-timer
 5 nil
 (lambda ()
   (setq     gc-cons-threshold 1000000)
   (message "gc-cons-threshold to restored to %S"
             gc-cons-threshold)))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defvar my-load-libs
  '(
    "my-packages"
    "ui"
    "nav"
    "keys"
  ))

(dolist (p my-load-libs)
  (load-library p))

(autoload 'pianobar "pianobar" nil t)
