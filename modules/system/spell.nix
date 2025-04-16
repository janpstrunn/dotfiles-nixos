{ pkgs, ... }:

}
  environment.systemPackages = with pkgs; [
    aspell
    aspellDicts.pt_BR
    aspellDicts.en
];
}
