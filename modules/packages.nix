{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.etc."gitconfig".text = ''
    [user]
      email = abhinav.is.dev@gmail.com
      name = Abhinav
  '';

  environment.systemPackages = with pkgs; [
    # Apps
    brave
    zed-editor

    # CLI essentials
    git
    wget
    curl
    unzip

    # Terminal tools
    neovim
    tmux
    eza
    zoxide
  ];
}
