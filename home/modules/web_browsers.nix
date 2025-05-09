{ config, pkgs, pkgs-unstable, lib, inputs, userSettings, ... }:

{
  config = {
    home.packages = 
    # Stable Packages
    (with pkgs; [
      mullvad-browser
      google-chrome
      brave
      librewolf
      floorp
      tor
    ]) # (with pkgs;
    ++
    # Unstable Packages
    (with pkgs-unstable; [
    ]) # (with pkgs-unstable;
    # Unstable Packages
    ; # home.packages

    programs.firefox = {
      enable = true;
      profiles.jolitp = {
        # bookmarks sync is done using floccus browser extension & NextCloud bookmarks
        #https://floccus.org/

        #bookmarks.configfile = ./config/firefox/firefox-bookmarks.html;
        #bookmarks = [
        #  {
              #     name = "MyNisOS";
        #     url = "https://mynixos.com/";
        #  }
        #]; # bookmarks = [

        settings = {
          # ... look them up
        };
            
        search.engines = {
          "Nix Packages" = {
            urls = [
              {
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ]; # params
                  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                  definedAliases = [ "@np" ];
              }
            ]; # urls
          }; # "Nix Packages"
        }; # search.engines
        search.force = true;
        
        userChrome = # CSS to change the browser theme
        ''  
        ''; # userChrome = # CSS to change the browser theme

        #extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          ublock-origin
          languagetool
          #enhancer-for-nebula
          noscript
          privacy-badger
          # share-backported # not found
          sidebery
          single-file
          stylebot-web
          tranquility-1 # tranquility reader
          translate-web-pages
          # yet another speeddial # not found
          enhancer-for-youtube
          youtube-high-definition
          downthemall
          markdownload
          # whatsapp redirect # not found
          # whatsend # not found
          canvasblocker
          # duplicate tabs closer # not found
          # hide youtube fullscreen controls # not found
          # medium parser # not found 
          # path of exile trade - fuzzy search # not found
          sponsorblock # youtube sponsorblock
          user-agent-string-switcher # should be the same (without the "string")
          vimium-c
          # web signer (softplan) # not found
          floccus
          # auto-highlight # not found
        ]; # extensions
      }; # profiles.jolitp = {
    }; # programs.firefox = {

    programs.chromium = {
      enable = true;

      extensions = [
        "cfhdojbkjhnklbpkdaibdccddilifddb" # Adblock Plus - free ad blocker
        "gighmmpiobklfepjocnamgkkbiglidom" # AdBlock — block ads across the web
        "oldceeleldhonbafppcapldpdifcinji" # AI Grammar Checker & Paraphraser – LanguageTool
        "fhlinfpmdlijegjlpgedcmglkakaghnk" # Better PathOfExile Trading
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
        "fnaicdffflnofjppbagibeoednhnbjhg" # floccus bookmarks sync
        "hmgdpdkbogmjhompkkeafjjpndfnghei" # Group download files by hostname
        "bmhfelbhbkeoldaiphchjibggnoodpcj" # Mobile View Switcher
        "mpiodijhokgodhhofbcjdecpffjipkle" # SingleFile
        "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
        "mbflpfaamifmmmkdjkcmpofpccfmlmap" # Video Downloader - MPMux
        "penndbmahnpapepljikkjmakcobdahne" # Vimeo™ Video Downloader Pro
        "bbafmabaelnnkondpfpjmdklbmfnbmol" # Web Signer
      ];

    }; # programs.chromium
  }; # config
}
