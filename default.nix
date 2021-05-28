rec {
	overlay = final: prev: {
		mylib = import ./lib prev;
		mypkgs = import ./pkgs prev;
	};
	module = { pkgs, ... }: {
		nixpkgs.overlays = [
			overlay
		];
		imports = (pkgs.mylib.nixImportable ./modules);
	};
}
