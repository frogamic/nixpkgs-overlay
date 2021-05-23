path: final: prev:
	let
		mkOverlayPackage = folder: {
			name = folder;
			value = import (path + "/${folder}") final prev;
	};
	in
	with prev.lib;
		builtins.listToAttrs (
			map mkOverlayPackage (
				attrNames (
					filterAttrs
      (filename: entryType: entryType == "directory" && ! (hasPrefix "." filename))
						(builtins.readDir path)
				)
			)
		)
