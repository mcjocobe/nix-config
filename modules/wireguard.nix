{
  pkgs,
  config,
  ...
}: {
  networking.wg-quick.interfaces = let
    server_ip = "138.199.234.210";
  in {
    wg0 = {
      # IP address of this machine in the *tunnel network*
      address = [
        "10.20.10.4/32"
      ];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 30003;

      # Path to the private key file.
      privateKeyFile = "${config.users.users."josecolomer".home}/.config/wireguard/client-privatekey";
      dns = ["1.1.1.1"];
      # dns = ["127.0.0.1"];

      peers = [
        {
          publicKey = "PCcvplpdBftll4XOUo2a5tb9m5wXbwxN3ojBOcUmRmg=";
          allowedIPs = ["0.0.0.0/0" "::/0"];
          endpoint = "${server_ip}:30003";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
