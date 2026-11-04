{
  config,
  pkgs,
  lib,
  ...
}: let
  # nofail: boot continues if the disk is missing
  # x-systemd.automount: mounts on first access instead of during boot
  common = ["nofail" "x-systemd.automount" "x-systemd.device-timeout=10s"];
  # NTFS has no unix permissions, so files belong to jolitp:users
  ntfs = common ++ ["uid=1000" "gid=100" "umask=022" "windows_names"];
in {
  config = {
    # The default dirty_ratio lets ~3GB pile up for slow disks (the SMR Seagate),
    # which stalls the whole system while it flushes
    boot.kernel.sysctl = {
      "vm.dirty_bytes" = 268435456; # 256MB
      "vm.dirty_background_bytes" = 67108864; # 64MB
    };

    # Seagate 6TB (NTFS)
    fileSystems."/mnt/Storage" = {
      device = "/dev/disk/by-uuid/01D62E2CEEFD6170";
      fsType = "ntfs3";
      options = ntfs;
    };

    # MB2000GCWDA 2TB (NTFS)
    fileSystems."/mnt/NewDrive" = {
      device = "/dev/disk/by-uuid/01D6CABAD7F39140";
      fsType = "ntfs3";
      options = ntfs;
    };

    # VM images live on the NVMe: the root SSD is DRAM-less and stalls under
    # the VMs' random writes. Bind mount keeps the path, so snapshots still
    # find their backing files
    fileSystems."/var/lib/libvirt/images" = {
      device = "/mnt/HOME/libvirt/images";
      fsType = "none";
      options = ["bind" "x-systemd.requires-mounts-for=/mnt/HOME"];
    };
  }; # config = {
}
