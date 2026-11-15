{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dotnetCorePackages.sdk_10_0
    csharp-ls
  ];
  programs.micro.settings = {
    "lsp.server" = "csharp=csharp-ls";
  };
}
