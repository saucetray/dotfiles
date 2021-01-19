;; removes bars that just get in the way
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; set up ido because it is amazing.
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;; tells ido to create buffer without asking
(setq ido-create-new-buffer 'always)

(defvar initPackages
  '(better-defaults
    material-theme
    magit
    )
  )

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      initPackages)

;; load theme
(load-theme 'material t)
(global-linum-mode t)

;; Python Config
(load-file "~/.emacs.d/python/pyinit.el")

;; Haskell Config
(load-file "~/.emacs.d/haskell/haskellinit.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(elpy material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
