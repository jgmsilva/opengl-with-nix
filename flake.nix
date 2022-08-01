{
  description = "A very basic flake";

  inputs = {
  	nixpkgs.url = "nixpkgs/nixos-unstable";
  	nixgl.url = "github:guibou/nixGL";
	};

  outputs = { self, nixpkgs, nixgl }: 
  	let pkgs = import nixpkgs {system = "x86_64-linux"; overlays = [ nixgl.overlay ]; };
	in with pkgs; {
	defaultPackage.x86_64-linux = callPackage ./main.nix { } ;
  	devShell.x86_64-linux = mkShell {
	buildInputs = [nixgl.nixGLIntel];
	};
   	};

}
