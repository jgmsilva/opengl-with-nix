{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixgl.url = "github:guibou/nixGL";
    nixvim.url = github:pta2002/nixvim;
  };

  outputs = { self, nixpkgs, nixgl, nixvim }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [ nixgl.overlay ]; };
    in
    with pkgs; {
      defaultPackage.x86_64-linux = callPackage ./nix/main.nix { };
      devShell.x86_64-linux = callPackage ./nix/shell.nix { };
    };

}
