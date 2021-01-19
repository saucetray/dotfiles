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

;; BACKUP HANDLING
;; Copying set so I do not lose creating times
(setq backup-by-copying t)

;; make backup to a designated dir, mirroring the full path

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "~/.emacs.d/backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)

(setq make-backup-file-name-function 'my-backup-file-name)

;; LOCKFILES
;; I do not need them right now
(setq create-lockfiles nil)

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
