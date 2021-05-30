rec {
	overlay = final: prev: {
		mylib = import ./lib prev;
		mypkgs = import ./pkgs prev;
	};
	nixosModule = { pkgs, ... }: {
		nixpkgs.overlays = [
			overlay
		];
		imports = import ./src/nixImportable.nix ./modules;
	};
}
