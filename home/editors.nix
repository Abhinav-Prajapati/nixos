{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Abhinav";
    userEmail = "abhinav.is.dev@gmail.com";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
