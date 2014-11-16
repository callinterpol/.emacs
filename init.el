(require 'package)
(package-initialize)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)

(require 'ido)
(ido-mode t)

(require 'evil)
(evil-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)

(load-theme 'zenburn t)

(tool-bar-mode -1)

(setq evil-normal-state-cursor '("green" hbar))
(setq evil-insert-state-cursor '("green" bar))

;;messagging buffer
(setq message-log-max t)

;;highlightning
(global-hl-line-mode 1)
(show-paren-mode 1)

;;setup buffers
;;remove scratch buffer
(setq initial-scratch-message "")
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))

(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

(setq inhibit-startup-buffer-menu t)

;;remove startup screen
(setq inhibit-startup-message t)

(add-hook 'window-setup-hook 'delete-other-windows)

;;avoid typing full yes or no 
(fset 'yes-or-no-p 'y-or-n-p)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;;make completion buffer dissappear after 3 seconds
(add-hook 'completion-setup-hook
	  (lambda () (run-at-time 3 nil
	       (lambda () (delete-windows-on "*Completions*")))))

;;autoinsert matching parentheses, braces, etc.
(electric-pair-mode 1)
