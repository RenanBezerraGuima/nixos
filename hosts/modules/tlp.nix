# Power Management via TLP
{config, pkgs, ...}:

{
	# Built-in NixOS power management module
	powerManagement = {
		enable = true;
		powertop.enable = true;	
	};

	services = {
		# Disable Gnome power profile daemon to prevent conflict
		power-profiles-daemon.enable = false;

		# Helps manage CPU temperature,
		# Can improve performance and reduce power draw
		thermald.enable = true;

		tlp = {
			enable = true;
			settings = {
				CPU_SCALING_GOVERNOR_ON_AC = 	"performance";
		      	CPU_SCALING_GOVERNOR_ON_BAT = 	"powersave";

		      	CPU_ENERGY_PERF_POLICY_ON_AC = 	"performance";
		      	CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

				# Reduces latency, and there is little drawback
				# on battery
		      	CPU_HWP_DYN_BOOST_ON_AC = 	1;
		      	CPU_HWP_DYN_BOOST_ON_BAT = 	1;

				# Range of CPU that can be used
		      	CPU_MIN_PERF_ON_AC = 	0;
		      	CPU_MAX_PERF_ON_AC = 	100;
		      	#CPU_MIN_PERF_ON_BAT = 	0;
		      	#CPU_MAX_PERF_ON_BAT = 	20;

		      	START_CHARGE_THRESH_BAT0 = 	65;
		      	STOP_CHARGE_THRESH_BAT0 = 	80;
		      	RESTORE_THRESHOLDS_ON_BAT = 1;
			};	
		};
	};
}
