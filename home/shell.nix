{ config, pkgs, lib, ...}:

{
	programs.zsh = {
    	enable = true;
			    
	    enableCompletion = true;
	    autosuggestion.enable = true;
	    syntaxHighlighting.enable = true;
	
		shellAliases = {
			cd = "z";
			ls = "eza";
		};

		initContent = ''
		      export DIRENV_LOG_FORMAT=""
	    '';
  	};

  	programs.direnv = {
  		enable = true;
  		enableZshIntegration = true;	
  	};
}
