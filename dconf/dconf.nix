# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [];
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "advanced";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      word-size = 64;
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-magnifier-enabled = false;
    };

    "org/gnome/desktop/a11y/interface" = {
      high-contrast = false;
    };

    "org/gnome/desktop/a11y/keyboard" = {
      togglekeys-enable = false;
    };

    "org/gnome/desktop/a11y/magnifier" = {
      brightness-blue = 0.0;
      brightness-green = 0.0;
      brightness-red = 0.0;
      cross-hairs-clip = false;
      cross-hairs-length = 4096;
      cross-hairs-thickness = 11;
      invert-lightness = false;
      mag-factor = 2.0;
      scroll-at-edges = true;
      show-cross-hairs = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/christopher/.local/share/backgrounds/2024-03-15-13-19-15-unova-map-large.jpg";
      picture-uri-dark = "file:///home/christopher/.local/share/backgrounds/2024-03-15-13-19-15-unova-map-large.jpg";
      primary-color = "#3071AE";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 24;
      enable-animations = true;
      enable-hot-corners = false;
      icon-theme = "Adwaita";
      overlay-scrolling = true;
      show-battery-percentage = true;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = ["org-gnome-characters" "steam" "gnome-power-panel" "org-prismlauncher-prismlauncher"];
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-characters" = {
      application-id = "org.gnome.Characters.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-fileroller" = {
      enable = true;
    };

    "org/gnome/desktop/notifications/application/org-prismlauncher-prismlauncher" = {
      application-id = "org.prismlauncher.PrismLauncher.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      natural-scroll = false;
      speed = 0.0;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.svg";
      primary-color = "#3071AE";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/search-providers" = {
      disable-external=false;
      disabled = ["org.gnome.Contacts.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Calculator.desktop" "org.gnome.clocks.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Software.desktop" "org.gnome.Settings.desktop"];
      sort-order=["org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop"];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
      show-screenshot-ui = ["<Super>s"];
      switch-applications = [];
      switch-applications-backward = [];
      screenshot = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names = ["Workspace 1"];
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [890 550];
      maximized = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/shell" = {
      disabled-extensions = ["apps-menu@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "light-style@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com"];
      enabled-extensions = ["dash-to-panel@jderose9.github.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "just-perfection-desktop@just-perfection" "caffeine@patapon.info" "advanced-alt-tab@G-dH.github.com" "blur-my-shell@aunetx"];
      favorite-apps = ["librewolf.desktop" "Alacritty.desktop" "org.gnome.Nautilus.desktop" "codium.desktop" "org.prismlauncher.PrismLauncher.desktop" "steam.desktop"];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.1";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = -1;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover = false;
      animate-appicon-hover-animation-convexity = "{'RIPPLE': 2.0, 'PLANK': 1.0, 'SIMPLE': 0.0}";
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      animate-appicon-hover-animation-rotation = "{'SIMPLE': 0, 'RIPPLE': 10, 'PLANK': 0}";
      animate-appicon-hover-animation-travel = "{'SIMPLE': 0.29999999999999999, 'RIPPLE': 0.40000000000000002, 'PLANK': 0.0}";
      animate-appicon-hover-animation-type = "SIMPLE";
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [1 0];
      primary-monitor = 1;
      desktop-line-custom-color = "rgb(191,64,64)";
      desktop-line-use-custom-color = false;
      dot-position = "BOTTOM";
      dot-style-focused = "METRO";
      group-apps = true;
      hide-overview-on-startup = true;
      hot-keys = true;
      hotkeys-overlay-combo = "NEVER";
      intellihide = true;
      intellihide-animation-time = 100;
      intellihide-close-delay = 200;
      intellihide-show-in-fullscreen = false;
      isolate-workspaces = false;
      leftbox-padding = -1;
      leftbox-size = 16;
      overview-click-to-exit = true;
      panel-anchors = ''
        {"0":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
      '';
      panel-lengths = ''
        {"0":100}
      '';
      panel-positions = ''
        {"0":"BOTTOM"}
      '';
      panel-sizes = ''
        {"0":48}
      '';
      progress-show-count = true;
      scroll-panel-action = "SWITCH_WORKSPACE";
      shortcut = ["<Super>q"];
      shortcut-text = "<Super>q";
      show-appmenu = false;
      show-apps-icon-file = "";
      show-showdesktop-delay = 100;
      show-showdesktop-hover = true;
      show-showdesktop-time = 0;
      showdesktop-button-width = 12;
      status-icon-padding = -1;
      stockgs-force-hotcorner = false;
      stockgs-keep-dash = false;
      stockgs-keep-top-panel = false;
      stockgs-panelbtn-click-only = false;
      trans-bg-color = "#bf4040";
      trans-gradient-bottom-opacity = 0.6;
      trans-gradient-top-opacity = 0.2;
      trans-panel-opacity = 0.0;
      trans-use-custom-bg = false;
      trans-use-custom-gradient = true;
      trans-use-custom-opacity = true;
      tray-padding = -1;
      tray-size = 16;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      app-menu = false;
      app-menu-icon = false;
      dash-icon-size = 16;
      hot-corner = true;
      panel = true;
      panel-arrow = false;
      panel-corner-size = 1;
      panel-in-overview = true;
      ripple-box = false;
      search = false;
      show-apps-button = false;
      startup-status = 0;
      double-super-to-appgrid = false;
      theme = true;
      window-demands-attention-focus = true;
      window-picker-icon = false;
      workspace = false;
      workspace-switcher-size = 0;
      workspaces-in-app-grid = false;
    };

    "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = {
      hot-edge-position = 0;
      switcher-popup-monitor = 3;
      switcher-popup-position = 2;
      win-switcher-popup-icon-size = 32;
      win-switcher-popup-preview-size = 128;
      win-switcher-popup-sorting = 3;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur=false;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur=false;
      style-panel=0;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      blur=true;
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      blur=false;
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [(mkTuple [0.784314 0.784314]) (mkTuple [0.74902 0.25098])];
      selected-color = mkTuple [true 0.74902];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [1080 716];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 157;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [26 23];
      window-size = mkTuple [1231 959];
    };
  };
}
