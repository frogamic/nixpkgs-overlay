nixpkgs: path: extra:
	let
		callPackage = name: {
			inherit name;
			value = nixpkgs.callPackage (path + "/${name}") extra;
		};
		packageFolders = import ./nixImportable.nix nixpkgs path;
	in
		builtins.listToAttrs (map callPackage packageFolders)
