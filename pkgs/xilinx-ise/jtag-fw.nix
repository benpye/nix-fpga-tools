{ stdenv, callPackage }:

let
  unwrapped = callPackage ./unwrapped.nix { };
in
stdenv.mkDerivation {
  name = "xilinx-jtag-fw";
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/share
    cp ${unwrapped}/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/*.hex $out/share/
  '';

  outputHashMode = "recursive";
  outputHashAlgo = "sha256";
  outputHash = "sha256-27wbXFe/vDvMS09bwgTewzQgGGcvdReQLQnqex+v+Uo=";
}
