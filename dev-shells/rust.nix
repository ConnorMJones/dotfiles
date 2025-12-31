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
    jq
    docker-compose
    postgresql_18
  ];
  nativeBuildInputs = with pkgs; [
    pkg-config
    python311
    lsof
  ];
  # shell hooks
  shellHook = ''
    alias rdev='kubectl port-forward -n cxrs pod/rust-dev 2222:22'
    echo "rust environment activated"
  '';

  # can also set env vars just by specifying variables
  # good for log levels or flags etc.
  # ENV_VAR = "example";
  DATABASE_URL="postgres://root:toor@localhost:5432/root";
}
