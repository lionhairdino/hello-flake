{
  description = "Hello World package";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.hello = with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        pname = "hello";
        version = "1.0";
        src = ./.;
        buildPhase = "echo 'Hello from external flake!' > hello.txt";
        installPhase = "mkdir -p $out; cp hello.txt $out/";
      };
  };
}
