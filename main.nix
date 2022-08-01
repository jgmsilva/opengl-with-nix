{stdenv, freeglut, glew} :
      	# Notice the reference to nixpkgs here.
     	  stdenv.mkDerivation {
        	name = "glutWindow";
		src = ./src;
		buildInputs = [glew freeglut ];
        	buildPhase = "gcc main.c -o glutWindow -lGL -lglut -lGLEW";
        	installPhase = "mkdir -p $out/bin; install -t $out/bin glutWindow";
      	  }
