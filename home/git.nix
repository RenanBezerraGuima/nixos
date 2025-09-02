{ config, pkgs, lib, ...}:

{
	programs.git = {
		enable = true;
		userName = "Renan Bezerra Guimarães";
		userEmail = "renanbezerraguima@proton.me";
	};

	programs.gh = {
		enable = true;
		gitCredentialHelper.enable = true;	
	};
}
