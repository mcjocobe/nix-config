{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wge

  # Auto upgrade nix package and the daemon service.
  #services.karabiner-elements.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.allowUnfree = true;
  users.groups.josecolomer = {};

  networking.hostName = "nixos";
  networking. networkmanager.enable = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };  

  users.users.josecolomer = {
    name = "josecolomer";
    home = "/home/josecolomer";
    group = "josecolomer";
};
}
