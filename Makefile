HOSTNAME := $(shell hostname)

build:
	sudo nixos-rebuild switch --flake .#$(HOSTNAME)

hm:
	home-manager switch --flake .#connor --impure

update:
	nix flake update

clean:
	sudo nix-collect-garbage --delete-older-than 7d