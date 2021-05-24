final: prev:
	let
		callAllPackages = import ./src/callAllPackages.nix prev {};
	in
		{
			mylib = callAllPackages ./lib;
			mypkgs = callAllPackages ./pkgs;
		}
