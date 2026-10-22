{ pkgs, ... }:

{
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    pkief.material-icon-theme
    github.github-vscode-theme
  ];

  userSettings = {
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "editor.fontLigatures" = true;
    "workbench.iconTheme" = "material-icon-theme";
    "workbench.colorTheme" = "GitHub Dark";

    "editor.formatOnSave" = true;
    "editor.tabSize" = 2;
    "editor.insertSpaces" = true;

    "vim.leader" = " ";
    "vim.useSystemClipboard" = true;
    "vim.highlightedyank.enable" = true;
    "vim.highlightedyank.duration" = 200;
    "vim.insertModeKeyBindings" = [
      {
        before = [ "j" "k" ];
        after = [ "<Esc>" ];
      }
    ];
    "vim.normalModeKeyBindings" = [
      {
        before = [ "<leader>" "f" "f" ];
        commands = [ "workbench.action.quickOpen" ];
      }
      {
        before = [ "<leader>" "e" ];
        commands = [ "workbench.action.toggleSidebarVisibility" ];
      }
    ];
  };
}
