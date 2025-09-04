{ inputs, ... }:

{
  imports = [
    ./configuration.nix

    inputs.stylix.nixosModules.stylix

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.renanbg = {
        imports = [
          ../../home/home.nix
          ../../home/battery.nix
          ../../home/wifi.nix
        ];
      };
      home-manager.backupFileExtension = "hm-backup";
    }
  ];
}
