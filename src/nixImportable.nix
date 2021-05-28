pkgs: path:
	with builtins;
		attrNames
			(pkgs.lib.filterAttrs
				(name: type:
					(! (pkgs.lib.hasPrefix "." name))
					&& (
							(type == "directory" && pathExists (path + "/${name}/default.nix"))
						||
							(type == "regular" && (pkgs.lib.hasSuffix ".nix" name) && name != "default.nix")
						)
				)
				(readDir path)
			)
