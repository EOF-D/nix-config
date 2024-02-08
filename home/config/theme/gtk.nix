{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Classic";

    theme.package = pkgs.gruvbox-dark-gtk;
    theme.name = "gruvbox-dark-gtk";

    iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    iconTheme.name = "gruvbox-dark-icons-gtk";
  };

  home.sessionVariables = {
    GTK_THEME = config.gtk.theme.name;
  };
}
