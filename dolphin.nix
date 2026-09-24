{ pkgs, ...  }:

{
   xdg.configFile."dolphinrc".text = ''
		[Main View]
		HiddenFiles=true
	'';

  }
