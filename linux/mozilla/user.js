// Note, this has to be copied to ~/.mozilla/firefox/<profilename>.default/user.js
//

// Don't hide toolbars in fullscreen
user_pref("browser.fullscreen.autohide", false);

// Don't let sites disable the right click
// if necessary, hold right-click, and close the FF menu with esc
user_pref("dom.event.contextmenu.enabled", false);

user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");

user_pref("font.name.monospace.x-western", "Source Code Pro");
user_pref("font.name.sans-serif.x-western", "Noto Sans");
user_pref("font.name.serif.x-western", "Source Code Pro");
user_pref("font.size.variable.x-western", 14);

// Scroll speed
//user_pref("mousewheel.default.delta_multiplier_y", 250);
user_pref("mousewheel.default.delta_multiplier_y", 500);

user_pref("pref.browser.homepage.disable_button.restore_default", true);
user_pref("pref.general.disable_button.default_browser", false);

user_pref("widget.chrome.allow-gtk-dark-theme", true);
user_pref("widget.content.allow-gtk-dark-theme", true);
