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
(if (file-directory-p "/mnt/Blue/org" )(setq org-directory "/mnt/Blue/org"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; https://docs.projectile.mx/projectile/index.html (setq projectile-project-search-path '("~/projects/" "~/work/"))
(setq projectile-project-search-path '("~/dev/"))

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


;;(use-package! helm
;; :init
;;  (map! :map helm-map
;;        "C-M-f" #'sp-forward-sexp))

(use-package! helm-ros
 :after (helm)
 :config
  (global-helm-ros-mode t))

;; TODO
;; (require 'rtags-helm)
;; (setq rtags-use-helm t)
(use-package! rtags
:after cc-mode
 :config
 (rtags-enable-standard-keybindings)
 (setq rtags-use-helm t))

(use-package! helm-rtags
:after rtags)

(use-package! smartparens
  :init
  (map! :map smartparens-mode-map
        "C-M-f" #'sp-forward-sexp
        "C-M-b" #'sp-backward-sexp
        "C-M-u" #'sp-backward-up-sexp
        "C-M-d" #'sp-down-sexp
        "C-M-p" #'sp-backward-down-sexp
        "C-M-n" #'sp-up-sexp
        "C-M-s" #'sp-splice-sexp
        "C-)" #'sp-forward-slurp-sexp
        "C-}" #'sp-forward-barf-sexp
        "C-(" #'sp-backward-slurp-sexp
        "C-M-)" #'sp-backward-slurp-sexp
        "C-M-)" #'sp-backward-barf-sexp))

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


(setq org-capture-templates '(("w" "Web site" entry
  (file "")
  "* %a :website:\n\n%U %?\n\n%:initial")))


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


(use-package! org-journal
  :ensure t
  :after org
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "/mnt/Blue/org/journal"
        org-journal-date-format "%A, %d %B %Y"))

(use-package! org-bookmark-heading)

(use-package! org-clock-convenience
  :ensure t
  :bind (:map org-agenda-mode-map
   	   ("<S-up>" . org-clock-convenience-timestamp-up)
   	   ("<S-down>" . org-clock-convenience-timestamp-down)
   	   ("o" . org-clock-convenience-fill-gap)
   	   ("e" . org-clock-convenience-fill-gap-both)))

(use-package! bookmark+)

;;(use-package! magithub
;;  :after magit
;;  :config
;;  (magithub-feature-autoinject t)
;;  (setq magithub-clone-default-directory "~/dev"))

;; https://github.com/progfolio/doct
(use-package! doct
  :ensure t
  ;;recommended: defer until calling doct
  :defer t
  :commands (doct))

;; https://github.com/jethrokuan/dots/blob/master/.doom.d/config.el
(use-package! org-clock-convenience
  :bind (:map org-agenda-mode-map
              ("<S-up>" . org-clock-convenience-timestamp-up)
              ("<S-down>" . org-clock-convenience-timestamp-down)
              ("o" . org-clock-convenience-fill-gap)
              ("e" . org-clock-convenience-fill-gap-both)))

;; Pocket Reader - https://github.com/alphapapa/pocket-reader.el
(use-package! pocket-reader)

(use-package! undo-tree
  :ensure t
  :init
  (setq undo-limit 78643200)
  (setq undo-outer-limit 104857600)
  (setq undo-strong-limit 157286400)
  (setq undo-tree-mode-lighter " UN")
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-enable-undo-in-region nil)
  (setq undo-tree-history-directory-alist '(("." . "~/emacs.d/undo")))
 (add-hook 'undo-tree-visualizer-mode-hook (lambda ()
                                              (undo-tree-visualizer-selection-mode)
                                              (setq display-line-numbers nil)))
  :config
  (global-undo-tree-mode 1)) ;; https://www.emacswiki.org/emacs/UndoTree


;; ROSEMACS - TODO WORKS on LAPTOP - but have different distro on PC - need a multimachine config to fix
;; else we get errors when config is loaded, can look into gitstow.
;;(add-to-list 'load-path "/opt/ros/melodic/share/emacs/site-lisp")

;;(require 'rosemacs-config)

;; [[https://github.com/purcell/exec-path-from-shell][purcell/exec-path-from-shell: Make Emacs use the $PATH set up by the user's shell]]
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; (use-package exec-path-from-shell
;;   :ensure t
;;   :defer f
;;   :config
;;   (exec-path-from-shell-copy-env "GOPATH")
;;   (exec-path-from-shell-copy-env "SHELL")
;;   (exec-path-from-shell-copy-env "PATH")
;;   (when (memq window-system '(mac ns x))
;;     (exec-path-from-shell-initialize)))

;; ORG ROAM config
;; https://org-roam.readthedocs.io/en/master/configuration/
;; (setq org-roam-directory "/path/to/org/")

;; You can then bind org-roam-jump-to-index in your configuration to access it (see Basic Install and Configuration to review how to set key-bindings).
;; (setq org-roam-index-file "index.org")

;; Things to exclude from graph
;; (setq org-roam-graph-exclude-matcher '("private" "dailies"))

  (use-package! org-roam
    :config
    (setq org-roam-graph-viewer "/usr/bin/chromium-browser")
    ;;Other options included 'ido, and 'ivy'.
    (setq org-roam-completion-system 'helm))

;; Encryption (via GPG) can be enabled for all new files by setting org-roam-encrypt-files to t.

(use-package! org-protocol)
(use-package! org-roam-protocol)
;; (use-package! s)
;; (use-package! org-protocol-capture-html)

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

(server-start)

;; DIRED
;; https://writequit.org/denver-emacs/presentations/2016-05-24-elpy-and-dired.html#orgheadline7
(use-package! dired
   :config
   (setq dired-listing-switches "-lFaGh1v --group-directories-first")
   (setq dired-ls-F-marks-symlinks t)
   (setq ls-lisp-dirs-first t)
   (setq dired-recursive-copies 'always)
   (setq dired-recursive-deletes 'always))

;; http://xenodium.com/drill-down-emacs-dired-with-dired-subtree/
(use-package! dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

(use-package! dired-narrow
  :after dired
  :commands (dired-narrow-fuzzy)
  :init
  (map! :map dired-mode-map
        :desc "narrow" "/" #'dired-narrow-fuzzy))
(use-package! dired+
  :after dired
  :config
  (add-hook 'dired-before-readin-hook 'diredp-breadcrumbs-in-header-line-mode))
;; https://writequit.org/denver-emacs/presentations/2016-05-24-elpy-and-dired.html#orgheadline2
(use-package! quick-preview
  :ensure t
  :init
  (global-set-key (kbd "C-c q") 'quick-preview-at-point)
  (define-key dired-mode-map (kbd "Q") 'quick-preview-at-point))

(use-package! dired-x
    :after dired
    :init (setq-default dired-omit-files-p t)
    :config
    (add-to-list 'dired-omit-extensions ".DS_Store"))

(use-package! dired-aux
   :after dired)
(use-package! wdired  :after dired)

(use-package! deadgrep
  :if (executable-find "rg")
  :init
  (map! "M-s" #'deadgrep))


;; shell-pop http://pragmaticemacs.com/emacs/pop-up-a-quick-shell-with-shell-pop/
(use-package! shell-pop
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  ;;  (setq shell-pop-term-shell "/bin/zsh")
  (setq shell-pop-term-shell "/bin/bash")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

(use-package! gif-screencast
  :bind
  ("<f12>" . gif-screencast-start-or-stop))

(defun insert-date ()
  "Insert a timestamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

;; https://github.com/ema2159/centaur-tabs#my-personal-configuration
(use-package! centaur-tabs
   
   :config
   (setq centaur-tabs-style "bar"
	  centaur-tabs-height 32
	  centaur-tabs-set-icons t
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-show-navigation-buttons t
	  centaur-tabs-set-bar 'under
	  x-underline-at-descent-line t)
   (centaur-tabs-headline-match)
   ;; (setq centaur-tabs-gray-out-icons 'buffer)
   ;; (centaur-tabs-enable-buffer-reordering)
   ;; (setq centaur-tabs-adjust-buffer-order t)
   (centaur-tabs-mode t)
   (setq uniquify-separator "/")
   (setq uniquify-buffer-name-style 'forward)
   (defun centaur-tabs-buffer-groups ()
     "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
     (list
      (cond
	;; ((not (eq (file-remote-p (buffer-file-name)) nil))
	;; "Remote")
	((or (string-equal "*" (substring (buffer-name) 0 1))
	     (memq major-mode '(magit-process-mode
				magit-status-mode
				magit-diff-mode
				magit-log-mode
				magit-file-mode
				magit-blob-mode
				magit-blame-mode
				)))
	 "Emacs")
	((derived-mode-p 'prog-mode)
	 "Editing")
	((derived-mode-p 'dired-mode)
	 "Dired")
	((memq major-mode '(helpful-mode
			    help-mode))
	 "Help")
	((memq major-mode '(org-mode
			    org-agenda-clockreport-mode
			    org-src-mode
			    org-agenda-mode
			    org-beamer-mode
			    org-indent-mode
			    org-bullets-mode
			    org-cdlatex-mode
			    org-agenda-log-mode
			    diary-mode))
	 "OrgMode")
	(t
	 (centaur-tabs-get-group-name (current-buffer))))))
   :hook
   (dashboard-mode . centaur-tabs-local-mode)
   (term-mode . centaur-tabs-local-mode)
   (calendar-mode . centaur-tabs-local-mode)
   (org-agenda-mode . centaur-tabs-local-mode)
   (helpful-mode . centaur-tabs-local-mode)
   :bind
   ("C-<prior>" . centaur-tabs-backward)
   ("C-<next>" . centaur-tabs-forward)
   ("C-c t s" . centaur-tabs-counsel-switch-group)
   ("C-c t p" . centaur-tabs-group-by-projectile-project)
   ("C-c t g" . centaur-tabs-group-buffer-groups)
   (:map evil-normal-state-map
	  ("g t" . centaur-tabs-forward)
	  ("g T" . centaur-tabs-backward)))

(menu-bar-mode 1)

(defun ros-catkin-make (dir)
  "Run catkin_make command in DIR."
  (interactive (list (read-directory-name "Directory: ")))
  (let* ((default-directory dir)
         (compilation-buffer-name-function (lambda (major-mode-name) "*catkin_make*")))
    (compile "catkin_make"))
  )

(defun ros-catkin-make-json (dir)
  "Run catkin_make command in DIR."
  (interactive (list (read-directory-name "Directory: ")))
  (let* ((default-directory dir)
         (compilation-buffer-name-function (lambda (major-mode-name) "*catkin_make*")))
    (compile "catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ."))
  )

;; (use-package! gdb-mi
;;   :init
;;   (fmakunbound 'gdb)
;;   (fmakunbound 'gdb-enable-debug))
;; TODO
;;(global-set-key (kbd "C-x C-r M") 'ros-catkin-make)
;;(global-set-key (kbd "C-x C-r C-j") 'ros-catkin-make-json)

(use-package! conda

  :init
    (conda-env-initialize-interactive-shells)
    ;; if you want eshell support, include:
    (conda-env-initialize-eshell)
;; if you want auto-activation (see below for details), include:
    (conda-env-autoactivate-mode t)
  :config

   (setq
   conda-anaconda-home (expand-file-name "~/anaconda3/")
   conda-env-home-directory (expand-file-name "~/anaconda3/") ;; as in previous example; not required
   conda-env-subdirectory "envs"))

(use-package! sx
  :config
  (bind-keys :prefix "C-c s"
             :prefix-map my-sx-map
             :prefix-docstring "Global keymap for SX."
             ("q" . sx-tab-all-questions)
             ("i" . sx-inbox)
             ("o" . sx-open-link)
             ("u" . sx-tab-unanswered-my-tags)
             ("a" . sx-ask)
             ("s" . sx-search)))

;;https://www.reddit.com/r/emacs/comments/8ml6na/tip_how_to_make_erc_fun_to_use/
(use-package! erc
  :custom
 ;(erc-autojoin-channels-alist '(("freenode.net" "#archlinux" "#bash" "#bitcoin"
 ;                                 "#emacs" "#gentoo" "#i3" "#latex" "#org-mode" "#python")))

  (erc-autojoin-channels-alist '(("#emacs")))
  (erc-autojoin-timing 'ident)
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 22)
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-threshold-time 43200)
;;  (erc-prompt-for-nickserv-password nil)
  (erc-server-reconnect-attempts 5)
  (erc-server-reconnect-timeout 3)
  (erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
                             "324" "329" "332" "333" "353" "477"))
  :config
  (add-to-list 'erc-modules 'notifications)
  (add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules))

(use-package! visual-regexp
  :config
  (define-key global-map (kbd "C-c r") 'vr/replace)
  (define-key global-map (kbd "C-c q") 'vr/query-replace)
  ;; if you use multiple-cursors, this is for you:
  (define-key global-map (kbd "C-c m") 'vr/mc-mark)
)

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
