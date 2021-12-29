{ pkgs, fetchurl }:

pkgs._7zz.overrideAttrs (oldAttrs: rec {
  version = "21.07";
  sourceRoot = ".";
  preBuild = "cd CPP/7zip/Bundles/Alone2";
  makefile = "../../cmpl_gcc.mak";
  patches = [ ./symlink.patch ];
  src = fetchurl {
    url = "https://www.7-zip.org/a/7z2107-src.7z";
    sha256 = "d1074d56f415aab99d99e597a7b66dc455dba6349ae8a4c89df76475b6a1284c";
  };
  doInstallCheck = false;
})
