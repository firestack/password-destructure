{
  description = "Flake utils demo";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
	 flake-utils.lib.eachDefaultSystem (system:
		let pkgs = nixpkgs.legacyPackages.${system}; in
		{
		  packages = rec {
			 pages = pkgs.stdenv.mkDerivation {
				pname = "password destructure app";
				version = "0.0.1";

				src = self;

				installPhase = ''
					mkdir $out
					cp offline-password.app.html $out/
					cp offline-password.app.html $out/index.html
				'';
			 };
			 default = pages;
		  };
		}
	 );
}
