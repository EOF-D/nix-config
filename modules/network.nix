{
  config,
  pkgs,
  lib,
  ...
}: {
  networking = {
    wireless = {
      enable = true;

      userControlled = {
        group = "wheel";
        enable = true;
      };

      environmentFile = config.sops.secrets."wireless.env".path;
      networks = {
        "@work@" = {
          auth = ''
            key_mgmt=WPA-EAP
            eap=PEAP
            phase2="auth=MSCHAPV2"
            identity="@identity@"
            password="@password@"
          '';
        };

        "@home@" = {
          auth = ''
            ssid="@home@"
            psk="@psk@"
          '';
        };

        "@studio@" = {
          auth = ''
            ssid="@studio@"
            psk="@studio_psk@"
          '';
        };
      };
    };
  };
}
