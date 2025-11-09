HOSTNAME := $(shell hostname)

build:
	sudo nixos-rebuild switch --flake .#$(HOSTNAME)

update:
	nix flake update

clean:
	sudo nix-collect-garbage --delete-older-than 7d