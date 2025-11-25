# Work around for pkg-config deps
# rust is installed through rustup from modules/dev.nix
{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    glib
    openssl
    protobuf_29
    kubectl
    awscli
    rusty-hook
  ];
  nativeBuildInputs = with pkgs; [
    pkg-config
    python311
  ];
  # shell hooks
  shellHook = ''
    alias rdev='kubectl port-forward -n cxrs pod/rust-dev 2222:22'
    echo "rust environment activated"
  '';

  # can also set env vars just by specifying variables
  # good for log levels or flags etc.
  ENV_VAR = "example";
}
