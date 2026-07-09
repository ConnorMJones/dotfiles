{
  hel,
  helheim-emacs,
  base16,
}:
{
  pkgs,
  lib,
  ...
}:
let

  helPackage =
    epkgs:
    epkgs.trivialBuild {
      pname = "hel";
      version = "0.10.0-main";
      src = hel;
      packageRequires = with epkgs; [
        s
        dash
        avy
        pcre2el
        paredit
      ];
    };

  emacsWithPackages = pkgs.emacs-pgtk.pkgs.withPackages (
    epkgs:
    (with epkgs; [
      org
      org-modern
      org-roam
      org-roam-ui
      vertico
      consult
      marginalia
      orderless
      which-key
      embark
      dash
      avy
      pcre2el
      org-super-agenda
      org-ql
      org-download
      magit
      denote
      paredit
    ])
    ++ [
      (helPackage epkgs)
    ]
  );

  themeEl = ''
    (deftheme connor-base16 "Base16 theme generated from the dotfiles Stylix palette.")
    (let ((base00 "${base16.base00}")
          (base01 "${base16.base01}")
          (base02 "${base16.base02}")
          (base03 "${base16.base03}")
          (base04 "${base16.base04}")
          (base05 "${base16.base05}")
          (base06 "${base16.base06}")
          (base07 "${base16.base07}")
          (base08 "${base16.base08}")
          (base09 "${base16.base09}")
          (base0A "${base16.base0A}")
          (base0B "${base16.base0B}")
          (base0C "${base16.base0C}")
          (base0D "${base16.base0D}")
          (base0E "${base16.base0E}")
          (base0F "${base16.base0F}"))
      (custom-theme-set-faces
       'connor-base16
       `(default ((t (:background ,base00 :foreground ,base05))))
       `(cursor ((t (:background ,base06))))
       `(region ((t (:background ,base02))))
       `(fringe ((t (:background ,base00 :foreground ,base03))))
       `(mode-line ((t (:background ,base01 :foreground ,base05 :box nil))))
       `(mode-line-inactive ((t (:background ,base01 :foreground ,base03 :box nil))))
       `(minibuffer-prompt ((t (:foreground ,base0D :weight bold))))
       `(font-lock-builtin-face ((t (:foreground ,base0C))))
       `(font-lock-comment-face ((t (:foreground ,base03 :slant italic))))
       `(font-lock-constant-face ((t (:foreground ,base09))))
       `(font-lock-function-name-face ((t (:foreground ,base0C))))
       `(font-lock-keyword-face ((t (:foreground ,base0E))))
       `(font-lock-string-face ((t (:foreground ,base0A))))
       `(font-lock-type-face ((t (:foreground ,base0B))))
       `(font-lock-variable-name-face ((t (:foreground ,base0D))))
       `(font-lock-warning-face ((t (:foreground ,base08 :weight bold))))
       `(link ((t (:foreground ,base0D :underline t))))
       `(org-level-1 ((t (:foreground ,base0D :weight bold :height 1.2))))
       `(org-level-2 ((t (:foreground ,base0B :weight bold :height 1.1))))
       `(org-level-3 ((t (:foreground ,base0A :weight bold))))
       `(org-level-4 ((t (:foreground ,base0E :weight bold))))
       `(org-date ((t (:foreground ,base0C :underline t))))
       `(org-done ((t (:foreground ,base0B :weight bold))))
       `(org-todo ((t (:foreground ,base08 :weight bold))))
       `(org-block ((t (:background ,base01))))
       `(org-block-begin-line ((t (:background ,base01 :foreground ,base03))))
       `(org-block-end-line ((t (:background ,base01 :foreground ,base03))))
       `(org-modern-label ((t (:height 0.9 :weight regular))))
       `(which-key-key-face ((t (:foreground ,base0D :weight bold))))
       `(orderless-match-face-0 ((t (:foreground ,base0D :weight bold))))
       `(orderless-match-face-1 ((t (:foreground ,base0B :weight bold))))
       `(orderless-match-face-2 ((t (:foreground ,base0A :weight bold))))
       `(orderless-match-face-3 ((t (:foreground ,base0E :weight bold))))))
    (provide-theme 'connor-base16)
  '';
in
{
  home.packages = with pkgs; [
    graphviz
    sqlite
  ];

  programs.emacs = {
    enable = true;
    package = emacsWithPackages;
  };

  services.emacs = {
    enable = true;
    package = emacsWithPackages;
    client.enable = true;
  };

  xdg.configFile = {
    "emacs/early-init.el".text = ''
      ;;; early-init.el -*- lexical-binding: t; -*-
      (setq package-enable-at-startup nil)
      (setq inhibit-startup-screen t
            inhibit-startup-buffer-menu t
            inhibit-startup-echo-area-message user-login-name
            frame-inhibit-implied-resize t
            read-process-output-max (* 2 1024 1024))
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
    '';

    "emacs/connor-base16-theme.el".text = themeEl;

    "emacs/init.el".text = ''
      ;;; init.el -*- lexical-binding: t; -*-

      (add-to-list 'custom-theme-load-path user-emacs-directory)
      (load-theme 'connor-base16 t)

      (setopt use-default-font-for-symbols t)
      (set-face-attribute 'default nil :family "Iosevka" :height 120)
      (set-face-attribute 'fixed-pitch nil :family "Iosevka" :height 120)
      (set-face-attribute 'variable-pitch nil :family "DejaVu Sans" :height 120)

      (setopt backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))
              auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
              create-lockfiles nil
              ring-bell-function 'ignore
              use-short-answers t)

      (require 'orderless)
      (require 'vertico)
      (require 'marginalia)
      (require 'which-key)

      (setq completion-styles '(orderless basic)
              completion-category-defaults nil
              completion-category-overrides '((file (styles partial-completion))))
      (vertico-mode 1)
      (marginalia-mode 1)
      (which-key-mode 1)

      (require 'org)
      (require 'org-modern)
      (require 'org-ql)

      (setopt org-directory (expand-file-name "~/notes/")
              org-agenda-files (list org-directory)
              org-default-notes-file (expand-file-name "inbox.org" org-directory)
              org-log-done 'time
              org-startup-indented t
              org-hide-emphasis-markers t
              org-pretty-entities t
              org-return-follows-link t
              org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)"))
              org-capture-templates
              '(("t" "Task" entry (file "inbox.org") "* TODO %?\n  %U\n  %a")
                ("n" "Note" entry (file "notes.org") "* %?\n  %U\n  %a")
                ("j" "Journal" entry (file+olp+datetree "journal.org") "* %U\n%?")))

      (with-eval-after-load 'org
        (global-org-modern-mode 1)
        (require 'org-super-agenda)
        (org-super-agenda-mode 1)
        (setq org-agenda-custom-commands
              '(("d" "Dashboard"
                 ((agenda "" ((org-agenda-span 7)))
                  (todo "NEXT")
                  (todo "TODO"))))))

      (require 'org-roam)

      (setopt org-roam-directory (expand-file-name "roam" org-directory)
              org-roam-db-location (expand-file-name "org-roam.db" org-directory))
      (org-roam-db-autosync-mode 1)

      (setopt denote-directory org-directory
              denote-known-keywords '("note" "task" "project" "reference"))

      (setopt org-download-method 'directory
              org-download-image-dir (expand-file-name "attachments" org-directory)
              org-download-heading-lvl nil)

      (require 'hel)
      (hel-mode 1)

      ;; Optional reference config. This is intentionally inert by default:
      ;; uncomment when you want to experiment with the upstream Helheim tree.
      ;; (add-to-list 'load-path "${helheim-emacs}/user-lisp")
    '';
  };

  assertions = [
    {
      assertion = lib.versionAtLeast pkgs.emacs.version "29.1";
      message = "Hel requires GNU Emacs 29.1 or newer.";
    }
  ];
}
