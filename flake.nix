{
  description = "FPGA tools for Nix.";

  inputs.nixpkgs.url = "nixpkgs/release-21.11";

  outputs = { self, nixpkgs }:
    let
      # System types to support.
      supportedSystems = [ "x86_64-linux" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

    in
    {
      # A Nixpkgs overlay.
      overlay = self: super: {
        xilinx-ise = super.callPackage ./pkgs/xilinx-ise { };
        xilinx-udev-rules = super.callPackage ./pkgs/xilinx-ise/udev-rules.nix { };
      };

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system:
        {
          inherit (nixpkgsFor.${system}) xilinx-ise xilinx-udev-rules;
        });

      # Add the wrapper to apps for nix run.
      apps = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in {
          xilinx-ise = {
            type = "app";
            program = "${pkgs.xilinx-ise}/bin/xilinx-ise";
          };
        });
    };
}
