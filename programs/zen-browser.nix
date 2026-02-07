{ pkgs, inputs, ...}: 
# https://github.com/0xc000022070/zen-browser-flake?tab=readme-ov-file#home-manager-reference
{
    imports = [
        inputs.zen-browser.homeModules.beta
    ];
    programs.zen-browser = { 
        enable = true;
        nativeMessagingHosts = [pkgs.firefoxpwa];
    };
}