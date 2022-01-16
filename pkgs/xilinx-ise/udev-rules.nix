{ stdenv, pkgs, callPackage }:

let
  fw = callPackage ./jtag-fw.nix { };
in
pkgs.writeTextFile {
  name = "xilinx-udev-rules";
  destination = "/etc/udev/rules.d/10-xilinx.rules";
  text = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0008", MODE="0660", TAG+="uaccess", GROUP+="plugdev"
    SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0007", RUN+="${pkgs.fxload}/sbin/fxload -v -t fx2 -I ${fw}/share/xusbdfwu.hex -D $tempnode"
    SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0009", RUN+="${pkgs.fxload}/sbin/fxload -v -t fx2 -I ${fw}/share/xusb_xup.hex -D $tempnode"
    SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="000d", RUN+="${pkgs.fxload}/sbin/fxload -v -t fx2 -I ${fw}/share/xusb_emb.hex -D $tempnode"
    SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="000f", RUN+="${pkgs.fxload}/sbin/fxload -v -t fx2 -I ${fw}/share/xusb_xlp.hex -D $tempnode"
    SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0013", RUN+="${pkgs.fxload}/sbin/fxload -v -t fx2 -I ${fw}/share/xusb_xp2.hex -D $tempnode"
    SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0015", RUN+="${pkgs.fxload}/sbin/fxload -v -t fx2 -I ${fw}/share/xusb_xse.hex -D $tempnode"
  '';
}
