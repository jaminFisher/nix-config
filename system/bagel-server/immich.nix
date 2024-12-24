{ ... }:
{
  # Immich
  services.immich.enable = true;
  users.users.immich.extraGroups = [
    "video"
    "render"
  ];
}
