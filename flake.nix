{
  description = "Hello World package";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.hello = pkgs.stdenv.mkDerivation {
        pname = "hello";
        version = "1.0";
        src = ./.;
        buildPhase = "echo 'Hello from external flake!' > hello.txt";
        installPhase = "mkdir -p $out; cp hello.txt $out/";
      };
    defaultPackage.${system} = self.packages.${system}.hello;
  };
}
