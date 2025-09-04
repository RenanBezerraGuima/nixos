# Audio configuration with PipeWire
{ config, pkgs, ... }:

{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # Important for ALSA device state persistence
  hardware.alsa.enablePersistence = true;
}
