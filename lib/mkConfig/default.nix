final: prev: dirName: hostName: fileName: attrs:
	with final; let
		defaultAttrs = {
			args = [ ./mkConfig.sh fileName hostName ];
			baseInputs = [ coreutils gawk gnused gnugrep ];
			buildInputs = [ python3 perl deno nodejs ];
			name = fileName;
			src = [ dirName ];
		};
	in stdenv.mkDerivation (defaultAttrs // attrs)
