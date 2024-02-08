{pkgs, ...}: {
  programs.git = {
    userName = "EOF-D";
    userEmail = "END-OFD@pm.me";

    extraConfig = {
      credential.helper = "${pkgs.git.override {withLibsecret = true;}}/bin/git-credential-libsecret";
    };
  };
}
