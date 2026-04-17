{ ... }:
{
  programs.firefox = {
    enable = true;

    # about:policies
    policies = {
      # Disable Firefox Sync.
      DisableFirefoxAccounts = true;
      # Disable the option to "Set as Desktop Background" when right-clicking
      # on an image.
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      # Disable Generative AI features.
      GenerativeAI = {
        Enabled = false;
        Chatbot = false;
        LinkPreviews = false;
        TabGroups = false;
        Locked = true;
      };
      # Disable autofill.
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      # Only allow HTTPS.
      HttpsOnlyMode = "force_enabled";
      # Disable DNS prefetching.
      NetworkPrediction = false;
      # Disable the new tab page.
      NewTabPage = false;

      # Do not offer to save logins.
      OfferToSaveLogins = false;
      # Disable search suggestions.
      SearchSuggestEnabled = false;
      # Install extensions.
      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          "installation_mode" = "normal_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
        };
        # Foxy Proxy
        "foxyproxy@eric.h.jung" = {
          "installation_mode" = "normal_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/foxyproxy@eric.h.jung/latest.xpi";
        };
        # Yomitan - popup dictionary for language learning
        "{6b733b82-9261-47ee-a595-2dda294a4d08}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/yomitan/latest.xpi";
        };
      };
    };
  };
}
