{config, ...}:
{
    hardware.graphics = {
        enable = true;
    };
    #hardware.graphics.extraPackages = with pkgs; [
    #    vulkan-loader
    #    vulkan-validation-layers
    #    vulkan-extension-layer
    #];

    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}