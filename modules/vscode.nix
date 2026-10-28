{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    programs.vscode = {
      enable = true;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          ms-vscode-remote.remote-containers
          github.codespaces
          github.github-vscode-theme
          jnoortheen.nix-ide
          streetsidesoftware.code-spell-checker
        ];

        userSettings = {
          "diffEditor.ignoreTrimWhitespace" = false;
          "editor.cursorBlinking" = "smooth";
          "editor.cursorStyle" = "block";
          "editor.cursorSmoothCaretAnimation" = "on";
          "editor.fontLigatures" = true;
          "editor.formatOnSave" = true;
          "editor.linkedEditing" = true;
          "editor.renderWhitespace" = "boundary";
          "editor.smoothScrolling" = true;
          "files.insertFinalNewline" = true;
          "files.trimFinalNewlines" = true;
          "files.trimTrailingWhitespace" = true;
          "git.autoStash" = true;
          "git.confirmSync" = false;
          "git.enableSmartCommit" = true;
          "terminal.integrated.smoothScrolling" = true;
          "terminal.integrated.fontLigatures.enabled" = true;
          "workbench.colorTheme" = "GitHub Dark";
          "workbench.iconTheme" = "vs-minimal";
          "workbench.editor.highlightModifiedTabs" = true;
          "workbench.list.smoothScrolling" = true;
          "workbench.startupEditor" = "none";
          "window.restoreWindows" = "none";
        };
      };
    };
  };
}
