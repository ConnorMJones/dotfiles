# Work around for pkg-config deps
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell
{
    buildInputs = with pkgs; [
        glib openssl protobuf_29
    ];
    nativeBuildInputs = with pkgs; [
        pkg-config
        python3
    ];
}
