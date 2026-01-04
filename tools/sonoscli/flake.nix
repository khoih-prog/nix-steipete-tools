{
  description = "clawdbot plugin: sonoscli";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=16c7794d0a28b5a37904d55bcca36003b9109aaa&narHash=sha256-fFUnEYMla8b7UKjijLnMe%2BoVFOz6HjijGGNS1l7dYaQ%3D";
    root.url = "path:../..";
  };

  outputs = { self, nixpkgs, root }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
      sonoscli = root.packages.${system}.sonoscli;
    in {
      packages.${system}.sonoscli = sonoscli;

      clawdbotPlugin = {
        name = "sonoscli";
        skills = [ ./skills/sonoscli ];
        packages = [ sonoscli ];
        needs = {
          stateDirs = [];
          requiredEnv = [];
        };
      };
    };
}
