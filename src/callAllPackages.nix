nixpkgs: extra: path:
	let
		callPackage = name: {
			inherit name;
			value = nixpkgs.callPackage (path + "/${name}") extra;
		};
		packageFolders =
			with builtins;
			attrNames
				(nixpkgs.lib.filterAttrs
					(name: type:
						type == "directory"
						&& ! (nixpkgs.lib.hasPrefix "." name)
						&& pathExists (path + "/${name}/default.nix")
					)
					(readDir path)
				);
	in
		builtins.listToAttrs (map callPackage packageFolders)
