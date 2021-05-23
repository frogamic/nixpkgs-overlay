{
	description = "Personalised nixpkgs overlay";
	outputs = { self }: {
		lib = import ./.;
	};
}
