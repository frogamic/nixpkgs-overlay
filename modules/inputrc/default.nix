{ lib, ... }:
	with lib;
	{
		environment.etc.inputrc.text = mkDefault builtins.readFile ./inputrc;
	}
