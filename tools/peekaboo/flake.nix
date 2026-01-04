{
  description = "clawdbot plugin: peekaboo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=16c7794d0a28b5a37904d55bcca36003b9109aaa&narHash=sha256-fFUnEYMla8b7UKjijLnMe%2BoVFOz6HjijGGNS1l7dYaQ%3D";
    root.url = "path:../..";
  };

  outputs = { self, nixpkgs, root }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
      peekaboo = root.packages.${system}.peekaboo;
    in {
      packages.${system}.peekaboo = peekaboo;

      clawdbotPlugin = {
        name = "peekaboo";
        skills = [ ./skills/peekaboo ];
        packages = [ peekaboo ];
        needs = {
          stateDirs = [];
          requiredEnv = [];
        };
      };
    };
}
