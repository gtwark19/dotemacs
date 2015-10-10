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

; Move this to nav.el?
(defun djcb-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with root-privileges (using tramp/sudo), if the file is not writable by user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))
;; or some other keybinding...
(global-set-key (kbd "C-x F") 'djcb-find-file-as-root)
