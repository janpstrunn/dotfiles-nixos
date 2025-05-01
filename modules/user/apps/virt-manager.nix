{pkgs, ...}: {
  home.packages = with pkgs; [
    libvirt
    virt-manager
    qemu
    uefi-run
    lxc
    swtpm
    dosfstools
  ];
}
