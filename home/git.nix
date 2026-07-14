{ pkgs, ... }:
{

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "joseporcar";
        email = "joseaporcar@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
