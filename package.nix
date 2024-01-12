{ lib
, stdenvNoCC

, src ? ./.
, version ? "0.0.1"
}:
stdenvNoCC.mkDerivation {
	pname = "password destructure app";

	inherit src version;

	installPhase = lib.concatStringsSep "\n" [
		"mkdir $out"
		"cp offline-password.app.html $out/"
		"cp offline-password.app.html $out/index.html"
	];
}
