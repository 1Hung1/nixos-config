{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dotnetCorePackages.sdk_11_0
    csharp-ls
  ];
  programs.micro.settings = {
    "lsp.server" = "csharp=csharp-ls";
    "lsp.autocompleteDetails" = true;
    "lsp.formatOnSave" = true;
  };
}
