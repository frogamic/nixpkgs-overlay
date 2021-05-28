nixpkgs:
	let
		nixImportable = import ../src/nixImportable.nix nixpkgs;
		callAllPackages = import ../src/callAllPackages.nix nixpkgs;
	in
		(callAllPackages ./. {}) // {
			inherit nixImportable callAllPackages;
		}
