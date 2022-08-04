{ mkShell, ruby, neovim, nixgl }:
mkShell {
  nativeBuildInputs = [
    neovim
    nixgl.nixGLIntel
  ];

}
