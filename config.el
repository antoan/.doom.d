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
;;(setq org-directory "~/org/")
(setq org-directory "~/Dropbox/org/roam/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; https://docs.projectile.mx/projectile/index.html (setq projectile-project-search-path '("~/projects/" "~/work/"))
(setq projectile-project-search-path '("~/dev/"))

;; (global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; TODO replace with: set gptel-api-key to a function which returns the key, gets in from enviroment
(use-package! gptel
 :config
 (setq! gptel-api-key "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"))
;; (helm-mode 1)


;;(use-package! helm
;; :init
;;  (map! :map helm-map
;;        "C-M-f" #'sp-forward-sexp))

;; (use-package! helm-ros
;;  :after (helm)
;;  :config
;;   (global-helm-ros-mode t))

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

;; (use-package! smartparens
;;   :init
;;   (map! :map smartparens-mode-map
;;         "C-M-f" #'sp-forward-sexp
;;         "C-M-b" #'sp-backward-sexp
;;         "C-M-u" #'sp-backward-up-sexp
;;         "C-M-d" #'sp-down-sexp
;;         "C-M-p" #'sp-backward-down-sexp
;;         "C-M-n" #'sp-up-sexp
;;         "C-M-s" #'sp-splice-sexp
;;         "C-)" #'sp-forward-slurp-sexp
;;         "C-}" #'sp-forward-barf-sexp
;;         "C-(" #'sp-backward-slurp-sexp
;;         "C-M-)" #'sp-backward-slurp-sexp
;;         "C-M-)" #'sp-backward-barf-sexp))

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


;; (setq org-capture-templates '(("w" "Web site" entry
;;   (file "")
;;   "* %a :website:\n\n%U %?\n\n%:initial")))
;; (after! org
;;   (add-to-list 'org-roam-capture-templates
;;                '("w" "web" plain
;;                  (function org-roam-capture--get-point)
;;                  "* ${title} :${tag}:\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n\n  %?"
;;                  :file-name "web/${slug}"
;;                  :head "#+title: ${title}\n"
;;                  :unnarrowed t)))

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
;; (setq org-agenda-files '("~/org/roam/"))
(setq org-agenda-files '("20230615195249-gpt_dev.org" "20220414172206-agenda.org" "20230528163516-exit.org"))
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
;; (setq org-refile-targets (quote (("/mnt/Blue/org/roam/20201027190541-refactor.org" :maxlevel . 6))))
                                 ;("organizer.org" :maxlevel . 6)
                                 ;("someday.org" :maxlevel . 6))))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

;;[org mode - how to jump directly to an org-headline? - Emacs Stack Exchange](https://emacs.stackexchange.com/questions/32617/how-to-jump-directly-to-an-org-headline/32625)

(setq org-goto-interface 'outline-path-completion)


(use-package! org-journal

  :after org
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Dropbox/org/journal"
        org-journal-date-format "%A, %d %B %Y"))

(use-package! org-bookmark-heading)


(use-package! org-bullets
    :hook (org-mode . org-bullets-mode))

(use-package! bookmark+)

;;(use-package! magithub
;;  :after magit
;;  :config
;;  (magithub-feature-autoinject t)
;;  (setq magithub-clone-default-directory "~/dev"))

;; https://github.com/progfolio/doct
(use-package! doct

  ;;recommended: defer until calling doct
  :defer t
  :commands (doct))

;; https://github.com/jethrokuan/dots/blob/master/.doom.d/config.el
;; (use-package! org-clock-convenience
;;   :bind (:map org-agenda-mode-map
;;               ("<S-up>" . org-clock-convenience-timestamp-up)
;;               ("<S-down>" . org-clock-convenience-timestamp-down)
;;               ("o" . org-clock-convenience-fill-gap)
;;               ("e" . org-clock-convenience-fill-gap-both)))

;; Pocket Reader - https://github.com/alphapapa/pocket-reader.el
;; (use-package! pocket-reader)

;; (use-package! undo-tree

;;   :init
;;   (setq undo-limit 78643200)
;;   (setq undo-outer-limit 104857600)
;;   (setq undo-strong-limit 157286400)
;;   (setq undo-tree-mode-lighter " UN")
;;   (setq undo-tree-auto-save-history t)
;;   (setq undo-tree-enable-undo-in-region nil)
;;   (setq undo-tree-history-directory-alist '(("." . "~/emacs.d/undo")))
;;  (add-hook 'undo-tree-visualizer-mode-hook (lambda ()
;;                                               (undo-tree-visualizer-selection-mode)
;;                                               (setq display-line-numbers nil)))
;;   :config
;;   (global-undo-tree-mode 1))
;; https://www.emacswiki.org/emacs/UndoTree


;; ROSEMACS - TODO WORKS on LAPTOP - but have different distro on PC - need a multimachine config to fix
;; else we get errors when config is loaded, can look into gitstow.
;;(add-to-list 'load-path "/opt/ros/melodic/share/emacs/site-lisp")

;;(require 'rosemacs-config)

;; [[https://github.com/purcell/exec-path-from-shell][purcell/exec-path-from-shell: Make Emacs use the $PATH set up by the user's shell]]
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; (use-package exec-path-from-shell

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

  ;; (use-package! org-roam
  ;;     :commands (org-roam-insert org-roam-node-find org-roam-switch-to-buffer org-roam)
  ;;     :hook
  ;;     (after-init . org-roam-mode)

  ;;     :init

  ;;     (map! :leader
  ;;       :prefix "n"
  ;;       :desc "org-roam" "l" #'org-roam
  ;;       :desc "org-roam-insert" "i" #'org-roam-insert
  ;;       :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
  ;;       :desc "org-roam-node-find" "f" #'org-roam-node-find
  ;;       :desc "org-roam-show-graph" "g" #'org-roam-show-graph
  ;;       :desc "org-roam-insert" "i" #'org-roam-insert
  ;;       :desc "org-roam-capture" "c" #'org-roam-capture)
  ;;     (setq org-roam-directory "/mnt/Blue/org/roam")

  ;;     :config
  ;;     (setq org-roam-graph-viewer "/usr/bin/google-chrome")
  ;;     ;;Other options included 'ido, and 'ivy'.
  ;;     (setq org-roam-completion-system 'helm)
  ;;     (add-to-list 'exec-path "/usr/bin/sqlite3"))
  ;;
  (use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Dropbox/org/roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Encryption (via GPG) can be enabled for all new files by setting org-roam-encrypt-files to t.

(use-package! org-protocol)
(use-package! org-roam-protocol)
;; (use-package! s)
;; (use-package! org-protocol-capture-html)


;; DIRED
;; https://writequit.org/denver-emacs/presentations/2016-05-24-elpy-and-dired.html#orgheadline7
(after! dired

   (setq dired-listing-switches "-lFaGh1v --group-directories-first")
   (setq dired-ls-F-marks-symlinks t)
   (setq ls-lisp-dirs-first t)
   (setq dired-recursive-copies 'always)
   (setq dired-recursive-deletes 'always))

;; http://xenodium.com/drill-down-emacs-dired-with-dired-subtree/
(use-package! dired-subtree
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
;;
;; (use-package! shell-pop
;;   :bind (("C-t" . shell-pop))
;;   :config
;;   (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
;;   ;;  (setq shell-pop-term-shell "/bin/zsh")
;;   (setq shell-pop-term-shell "/bin/bash")
;;   ;; need to do this manually or not picked up by `shell-pop'
;;   (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

;; (use-package! gif-screencast
;;   :bind
;;   ("<f12>" . gif-screencast-start-or-stop))

(defun insert-date ()
  "Insert a timestamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

;; https://github.com/ema2159/centaur-tabs#my-personal-configuration
;;
;; (use-package! centaur-tabs
   
;;    :config
;;    (setq centaur-tabs-style "bar"
;; 	  centaur-tabs-height 32
;; 	  centaur-tabs-set-icons t
;; 	  centaur-tabs-set-modified-marker t
;; 	  centaur-tabs-show-navigation-buttons t
;; 	  centaur-tabs-set-bar 'under
;; 	  x-underline-at-descent-line t)
;;    (centaur-tabs-headline-match)
;;    ;; (setq centaur-tabs-gray-out-icons 'buffer)
;;    ;; (centaur-tabs-enable-buffer-reordering)
;;    ;; (setq centaur-tabs-adjust-buffer-order t)
;;    (centaur-tabs-mode t)
;;    (setq uniquify-separator "/")
;;    (setq uniquify-buffer-name-style 'forward)
;;    (defun centaur-tabs-buffer-groups ()
;;      "`centaur-tabs-buffer-groups' control buffers' group rules.

;;  Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
;;  All buffer name start with * will group to \"Emacs\".
;;  Other buffer group by `centaur-tabs-get-group-name' with project name."
;;      (list
;;       (cond
;; 	;; ((not (eq (file-remote-p (buffer-file-name)) nil))
;; 	;; "Remote")
;; 	((or (string-equal "*" (substring (buffer-name) 0 1))
;; 	     (memq major-mode '(magit-process-mode
;; 				magit-status-mode
;; 				magit-diff-mode
;; 				magit-log-mode
;; 				magit-file-mode
;; 				magit-blob-mode
;; 				magit-blame-mode
;; 				)))
;; 	 "Emacs")
;; 	((derived-mode-p 'prog-mode)
;; 	 "Editing")
;; 	((derived-mode-p 'dired-mode)
;; 	 "Dired")
;; 	((memq major-mode '(helpful-mode
;; 			    help-mode))
;; 	 "Help")
;; 	((memq major-mode '(org-mode
;; 			    org-agenda-clockreport-mode
;; 			    org-src-mode
;; 			    org-agenda-mode
;; 			    org-beamer-mode
;; 			    org-indent-mode
;; 			    org-bullets-mode
;; 			    org-cdlatex-mode
;; 			    org-agenda-log-mode
;; 			    diary-mode))
;; 	 "OrgMode")
;; 	(t
;; 	 (centaur-tabs-get-group-name (current-buffer))))))
;;    :hook
;;    (dashboard-mode . centaur-tabs-local-mode)
;;    (term-mode . centaur-tabs-local-mode)
;;    (calendar-mode . centaur-tabs-local-mode)
;;    (org-agenda-mode . centaur-tabs-local-mode)
;;    (helpful-mode . centaur-tabs-local-mode)
;;    :bind
;;    ("C-<prior>" . centaur-tabs-backward)
;;    ("C-<next>" . centaur-tabs-forward)
;;    ("C-c t s" . centaur-tabs-counsel-switch-group)
;;    ("C-c t p" . centaur-tabs-group-by-projectile-project)
;;    ("C-c t g" . centaur-tabs-group-buffer-groups)
;;    (:map evil-normal-state-map
;; 	  ("g t" . centaur-tabs-forward)
;; 	  ("g T" . centaur-tabs-backward)))

(menu-bar-mode 1)

;; TODO put in separate usr lisp file. set this up.
;; (defun ros-catkin-make (dir)
;;   "Run catkin_make command in DIR."
;;   (interactive (list (read-directory-name "Directory: ")))
;;   (let* ((default-directory dir)
;;          (compilation-buffer-name-function (lambda (major-mode-name) "*catkin_make*")))
;;     (compile "catkin_make")))

;; (defun ros-catkin-make-json (dir)
;;   "Run catkin_make command in DIR."
;;   (interactive (list (read-directory-name "Directory: ")))
;;   (let* ((default-directory dir)
;;          (compilation-buffer-name-function (lambda (major-mode-name) "*catkin_make*")))
;;     (compile "catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .")))

;; (use-package! gdb-mi
;;   :init
;;   (fmakunbound 'gdb)
;;   (fmakunbound 'gdb-enable-debug))

;; TODO
;;(global-set-key (kbd "C-x C-r M") 'ros-catkin-make)
;;(global-set-key (kbd "C-x C-r C-j") 'ros-catkin-make-json)

;; (use-package! conda

;;   :init
;;     (conda-env-initialize-interactive-shells)
;;     ;; if you want eshell support, include:
;;     (conda-env-initialize-eshell)
;; ;; if you want auto-activation (see below for details), include:
;;     (conda-env-autoactivate-mode t)
;;   :config

;;    (setq
;;    conda-anaconda-home (expand-file-name "~/anaconda3/")
;;    conda-env-home-directory (expand-file-name "~/anaconda3/") ;; as in previous example; not required
;;    conda-env-subdirectory "envs"))

;; (use-package! sx
;;   :config
;;   (bind-keys :prefix "C-c s"
;;              :prefix-map my-sx-map
;;              :prefix-docstring "Global keymap for SX."
;;              ("q" . sx-tab-all-questions)
;;              ("i" . sx-inbox)
;;              ("o" . sx-open-link)
;;              ("u" . sx-tab-unanswered-my-tags)
;;              ("a" . sx-ask)
;;              ("s" . sx-search)))

;;https://www.reddit.com/r/emacs/comments/8ml6na/tip_how_to_make_erc_fun_to_use/
;; (use-package! erc
;;   :custom
;;  ;(erc-autojoin-channels-alist '(("freenode.net" "#archlinux" "#bash" "#bitcoin"
;;  ;                                 "#emacs" "#gentoo" "#i3" "#latex" "#org-mode" "#python")))

;;   (erc-autojoin-channels-alist '(("#emacs")))
;;   (erc-autojoin-timing 'ident)
;;   (erc-fill-function 'erc-fill-static)
;;   (erc-fill-static-center 22)
;;   (erc-hide-list '("JOIN" "PART" "QUIT"))
;;   (erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
;;   (erc-lurker-threshold-time 43200)
;; ;;  (erc-prompt-for-nickserv-password nil)
;;   (erc-server-reconnect-attempts 5)
;;   (erc-server-reconnect-timeout 3)
;;   (erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
;;                              "324" "329" "332" "333" "353" "477"))
;;   :config
;;   (add-to-list 'erc-modules 'notifications)
;;   (add-to-list 'erc-modules 'spelling)
;;   (erc-services-mode 1)
;;   (erc-update-modules))

(use-package! visual-regexp)
(use-package! visual-regexp-steroids :after visual-regexp)

  ;; (define-key global-map (kbd "C-c r") 'vr/replace)
  ;; (define-key global-map (kbd "C-c q") 'vr/query-replace)
  ;; ;; if you use multiple-cursors, this is for you:
  ;; (define-key global-map (kbd "C-c m") 'vr/mc-mark)

(use-package! bm

         :demand t

         :init
         ;; restore on load (even before you require bm)
         (setq bm-restore-repository-on-load t)


         :config
         ;; Allow cross-buffer 'next'
         (setq bm-cycle-all-buffers t)

         ;; where to store persistant files
         (setq bm-repository-file "~/.emacs.d/bm-repository")

         ;; save bookmarks
         (setq-default bm-buffer-persistence t)

         ;; Loading the repository from file when on start up.
         (add-hook 'after-init-hook 'bm-repository-load)

         ;; Saving bookmarks
         (add-hook 'kill-buffer-hook #'bm-buffer-save)

         ;; Saving the repository to file when on exit.
         ;; kill-buffer-hook is not called when Emacs is killed, so we
         ;; must save all bookmarks first.
         (add-hook 'kill-emacs-hook #'(lambda nil
                                          (bm-buffer-save-all)
                                          (bm-repository-save)))

         ;; The `after-save-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state.
         (add-hook 'after-save-hook #'bm-buffer-save)

         ;; Restoring bookmarks
         (add-hook 'find-file-hooks   #'bm-buffer-restore)
         (add-hook 'after-revert-hook #'bm-buffer-restore)

         ;; The `after-revert-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state. This hook might cause trouble when using packages
         ;; that automatically reverts the buffer (like vc after a check-in).
         ;; This can easily be avoided if the package provides a hook that is
         ;; called before the buffer is reverted (like `vc-before-checkin-hook').
         ;; Then new bookmarks can be saved before the buffer is reverted.
         ;; Make sure bookmarks is saved before check-in (and revert-buffer)
         (add-hook 'vc-before-checkin-hook #'bm-buffer-save)


         :bind (("<f2>" . bm-next)
                ("S-<f2>" . bm-previous)
                ("C-<f2>" . bm-toggle))
         )

(use-package! dired-git-info
  :config
  (with-eval-after-load 'dired
    (define-key dired-mode-map ")" 'dired-git-info-mode))
  (setq dgi-auto-hide-details-p nil)
  (add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)
)

;; https://www.emacswiki.org/emacs/SyslogMode 
(use-package! syslog-mode
  :config
  (add-to-list 'auto-mode-alist '("/var/log.*\\'" . syslog-mode))
  )

;; IDE FEATURES -  LSP, DAP, Company
;; https://github.com/daviwil/emacs-from-scratch/blob/dd9320769f3041ac1edca139496f14abe147d010/Emacs.org#ide-features-with-lsp-mode
;; https://emacs-lsp.github.io/lsp-mode/page/installation/#use-package
;;
;;(defun efs/lsp-mode-setup ()
;;  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
;;  (lsp-headerline-breadcrumb-mode))

;; (use-package! lsp-mode
;;   :commands (lsp lsp-deferred)
;;  ;;  :hook (lsp-mode . efs/lsp-mode-setup)
;;   :init
;; ;;  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
;;    (lsp-enable-which-key-integration t)
;;   (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
;;   (lsp-headerline-breadcrumb-mode))
;;   :config

;; (after! lsp-mode
;;   (progn
;;     (add-hook 'prog-mode-hook #'lsp)
;;     (lsp-register-client
;;      (make-lsp-client :new-connection (lsp-tramp-connection
;; 				       "/snap/bin/clangd")
;;                       :major-modes '(c-mode c++-mode)
;;                       :remote? t
;;                       :server-id 'clangd-remote))))

;;    (setq lsp-pyls-plugins-pylint-enabled t)
;;    (setq lsp-pyls-plugins-autopep8-enabled nil)
;;    (setq lsp-pyls-plugins-yapf-enabled t)
;;    (setq lsp-pyls-plugins-pyflakes-enabled nil))

 ;; (after! lsp-ui (setq lsp-headerline-breadcrumb-enable t ))


;;  (use-package! lsp-ui
;; ;;   :hook (lsp-mode . lsp-ui-mode)
;;    :after lsp
;;    :custom
;;    (lsp-ui-sideline-show-diagnostics t))

;; (use-package! lsp-treemacs
;;   :after lsp)

;; (use-package! lsp-ivy)

;; (use-package! dap-mode
;;   ;; Uncomment the config below if you want all UI panes to be hidden by default!
;;   ;; :custom
;;   ;; (lsp-enable-dap-auto-configure nil)
;;   ;; :config
;;   ;; (dap-ui-mode 1)

;;   :config
;;   ;; Set up Node debugging
;;  ;; (require 'dap-node)
;;  ;; (dap-node-setup) ;; Automatically installs Node debug adapter if needed

;;   ;; Bind `C-c l d` to `dap-hydra` for easy access
;   (general-define-key
;;     :keymaps 'lsp-mode-map
;;     :prefix lsp-keymap-prefix
;;     "d" '(dap-hydra t :wk "debugger")))

;; TODO Add DAP HYDRA
;; 
 ;; (after! dap

 ;;   (map!
 ;;    :map lsp-mode-map "z" #'dap-hydra
 ;;    :prefix lsp-keymap-prefix
 ;;    :desc "hydra"))
 ;;

;;https://www.reddit.com/r/emacs/comments/doxfya/how_to_add_a_keybinding_to_an_existing_prefix/
;; https://www.masteringemacs.org/article/mastering-key-bindings-emacs
;; (map! (:leader (:prefix "c" :desc "dhydra" :nv "1" #'dap-hydra)))


;; ;; The package is "python" but the mode is "python-mode":
;; [[https://github.com/jwiegley/use-package][jwiegley/use-package: A use-package declaration for simplifying your .emacs]]
;;
;; (after! python

;;   ;; NOTE: Set these if Python 3 is called "python3" on your system!

;;   (setq python-shell-interpreter "python3")
;;   (setq dap-python-executable "python3")

;;   (setq dap-python-debugger 'debugpy))

;;  (require 'dap-python))

;;  use after! check if we are ovewriting base config
;; (use-package! company
;;   :after lsp-mode
;;   :hook (lsp-mode . company-mode)
;;   :bind (:map company-active-map
;;          ("<tab>" . company-complete-selection))
;;         (:map lsp-mode-map
;;          ("<tab>" . company-indent-or-complete-common))
;;   :custom
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0.0))

;; (use-package! company-box
;;   :hook (company-mode . company-box-mode))

;; TODO GPG pinentry
;; (after! epa
;;   (setenv "GPG_AGENT_INFO" nil)
;;   (setq epg-gpg-program "gpg")
;;   (setq epg-pinentry-mode 'loopback)


;;   ;; Start GPG agent with SSH support
;;   ;;(shell-command "gpg-connect-agent /bye")
;;   (pinentry-start)

;;   ;; Update the TTY for gpg-agent
;;   ;;(setenv "GPG_TTY" "/dev/pts/0")
;;   (shell-command "gpgconf --launch-agent")
;;   (shell-command "gpg-connect-agent updatestartuptty /bye >/dev/null"))


;;(use-package! posframe)

;;(use-package! command-log-mode  :after posframe)
;; -----------------------------------------------------------------------------

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
