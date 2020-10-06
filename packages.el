;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

(package! helm-catkin)
(package! org-super-agenda)
(package! org-ql)
(package! org-sidebar)
(package! helm-org-rifle)
(package! org-ref)
(package! org-journal)
(package! evil-tutor)
(unpin! org-roam)
(package! org-roam-server)
(package! org-bookmark-heading)
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
(package! org-clock-convenience)
(package! company-org-roam
  :recipe (:host github :repo "jethrokuan/company-org-roam"))
(package! pocket-reader)
(package! helm-ag)
(package! exec-path-from-shell)
(package! bookmark+)
(package! icicles)
;; DIRED
(package! dired+)
(package! dired-hacks-utils)
(package! dired-filter)
(package! dired-rainbow)
(package! dired-avfs)  ;; Adds avfs support for seamless archive browsing.
(package! dired-subtree)
(package! dired-ranger)
(package! dired-narrow)
(package! dired-open)
(package! tmtxt-async-tasks :recipe (:host github :repo "tmtxt/tmtxt-async-tasks"))
(package! tmtxt-dired-async :recipe (:host github :repo "tmtxt/tmtxt-dired-async"))
(package! quick-preview)
;;
;;
(package! helm-tramp)
(package! exwm)
(package! helm-dash)
(package! worf)
(package! yankpad)
(package! emms)
(package! git-link)
(package! magithub)
(package! yaml-mode)
(package! gif-screencast
  :recipe (:host gitlab :repo "ambrevar/emacs-gif-screencast"))
(package! outshine)
;;(package! smex)
(package! shell-pop)
(package! undo-tree)
(package! dumb-jump)
(package! elfeed)
(package! deadgrep)
(package! doct)
(package! helm-ros)
(package! helm-rtags)
(package! rmsbolt)
(package! conda)
;; (package! gdb-mi  :recipe (:host github :repo "weirdNox/emacs-gdb"))
;; (package! s) ;;https://github.com/magnars/s.el
;; (package! s
;;   :recipe (:host github :repo "magnars/s.el"))
;; (package! org-protocol-capture-html
;;  :recipe (:host github :repo "alphapapa/org-protocol-capture-html"))
;; (package! dired-subtree)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))
