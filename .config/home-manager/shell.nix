{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nodejs_22
    pnpm

    python3
    go

    rustc
    cargo
  ];
}
