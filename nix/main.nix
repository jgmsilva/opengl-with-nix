{ stdenv, which, nixgl, freeglut, glew, glArg ? "nixGLIntel" }:
# Notice the reference to nixpkgs here.
let
  main = stdenv.mkDerivation {
    name = "main";
    srcs = ../src;
    buildInputs = [ glew freeglut ];
    buildPhase = "gcc main.c -o main -lGL -lglut -lGLEW";
    installPhase = "mkdir -p $out/bin; install -t $out/bin main;runHook postInstall";
  };

  glutWindow = stdenv.mkDerivation {
    name = "glutWindow";
    unpackPhase = "true";
    buildInputs = [ main which nixgl.nixGLIntel ];
    installPhase = ''
      mkdir -p $out/bin
      echo "#! ${stdenv.shell}" >> "$out/bin/glutWindow"
      echo "$(which nixGLIntel) $(which main)" >> "$out/bin/glutWindow"
      chmod +x $out/bin/glutWindow
    '';
  };

in
glutWindow
