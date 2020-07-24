;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/mnt/Blue/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;; (setq

;;  org-refile-targets (quote ((nil :maxlevel . 1)))
;;  org-capture-templates '(("x" "Note" entry
;;                           (file+olp+datetree "journal.org")
;;                           "**** [ ] %U %?" :prepend t :kill-buffer t)
;;                          ("t" "Task" entry
;;                           (file+headline "tasks.org" "Inbox")
;;                           "* [ ] %?\n%i" :prepend t :kill-buffer t))
;;  +doom-dashboard-banner-file (expand-file-name "logo.png" doom-private-dir)
;;  +org-capture-todo-file "tasks.org")
;; see https://github.com/zaiste/.doom.d/blob/master/config.el

(org-super-agenda-mode t)
(setq
 org-super-agenda-groups '((:name "Emacs"
                                  :tag "em")
                           (:name "DEV"
                                  :tag "dev")
                           (:name "JDAM"
                                  :tag "jdam")
                           ))

;; Org-Mode config
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

;;[org mode - how to jump directly to an org-headline? - Emacs Stack Exchange](https://emacs.stackexchange.com/questions/32617/how-to-jump-directly-to-an-org-headline/32625)

(setq org-goto-interface 'outline-path-completion)

;; Pocket Reader - https://github.com/alphapapa/pocket-reader.el
(use-package! pocket-reader)

;; ROSEMACS
;;(add-to-list 'load-path "/opt/ros/kinetic/share/emacs/site-lisp")

;;(require 'rosemacs-config)

;; [[https://github.com/purcell/exec-path-from-shell][purcell/exec-path-from-shell: Make Emacs use the $PATH set up by the user's shell]]
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; https://org-roam.readthedocs.io/en/master/configuration/
;; ORG ROAM config
;; (setq org-roam-directory "/path/to/org/")
(use-package! org-roam)


;; You can then bind org-roam-jump-to-index in your configuration to access it (see Basic Install and Configuration to review how to set key-bindings).
;; (setq org-roam-index-file "index.org")

(setq org-roam-graph-viewer "/usr/bin/chromium-browser")

;; Things to exclude from graph
;; (setq org-roam-graph-exclude-matcher '("private" "dailies"))

;;Other options included 'ido, and 'ivy'.
(setq org-roam-completion-system 'helm)

;; Encryption (via GPG) can be enabled for all new files by setting org-roam-encrypt-files to t.

(server-start)
(use-package! org-protocol)
(use-package! org-roam-protocol)

(use-package! org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org-roam-server))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
