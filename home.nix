{pkgs, ...}: let
  testPackage = pkgs.writeScriptBin "hi" "echo ${pkgs.lib.testString}";

  overlay = final: prev: prev.lib.attrsets.recursiveUpdate prev {
    lib.testString = "ho";
  };
in {
  home = {
    stateVersion = "24.11";
    username = "test";
    homeDirectory = "/home/test";
    packages = [testPackage];
  };

  nixpkgs.overlays = [overlay];
}
