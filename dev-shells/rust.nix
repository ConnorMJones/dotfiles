# Work around for pkg-config deps
# rust is installed through rustup from modules/dev.nix
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell
{
    buildInputs = with pkgs; [
        glib openssl protobuf_29 kubectl awscli
    ];
    nativeBuildInputs = with pkgs; [
        pkg-config
        python311
    ];
    # shell hooks
    shellHook = ''
        echo "rust environment activated"
    '';

    # can also set env vars just by specifying variables
    # good for log levels or flags etc.
    ENV_VAR="example";
}
