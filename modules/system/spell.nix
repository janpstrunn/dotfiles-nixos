{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (aspellWithDicts (dicts: with dicts; [en pt_BR]))
  ];
}
