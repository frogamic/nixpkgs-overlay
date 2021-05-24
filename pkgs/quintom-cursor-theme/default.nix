{ stdenv, fetchFromGitLab, lib, mylib }:
	stdenv.mkDerivation rec {
		name = "${package-name}-${version}";
		package-name = "quintom-cursor-theme";
		version = "d23e5733";

		src = fetchFromGitLab {
			owner = "Burning_Cube";
			repo = "quintom-cursor-theme";
			rev = version;
			hash = "sha256-Sec2DSnWYal6wzYzP9W+DDuTKHsFHWdRYyMzliMU5bU=A";
		};

		installPhase = ''
			mkdir -p $out/share/icons
			for theme in "Quintom_Ink" "Quintom_Snow"; do
				cp -r "$theme Cursors/$theme" $out/share/icons/
			done
		'';

		meta = {
			description = "This is an x-cursor theme designed to look decent.";
			platforms = lib.platforms.unix;
			license = with lib.licenses; [ cc-by-sa-40 gpl3 ];
			maintainers = [ mylib.maintainers.me ];
		};
	}
