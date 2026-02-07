{ pkgs, ...}:
{
  programs.git = {
    enable = true;
    settings.user = {
        name = "joseporcar";
        email = "joseaporcar@gmail.com";
    }
    settings = {
      init.defaultBranch = "main";
    };
  };
}