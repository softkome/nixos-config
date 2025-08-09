// Privacy basics
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
user_pref("privacy.trackingprotection.cryptomining.enabled", true);
user_pref("privacy.resistFingerprinting", true);
user_pref("network.http.referer.XOriginPolicy", 2);
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
user_pref("browser.send_pings", false);
user_pref("dom.battery.enabled", false);

// HTTPS-Only
user_pref("dom.security.https_only_mode", true);

// Telemetry off
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("browser.discovery.enabled", false);

// Disable Pocket & sponsored content
user_pref("extensions.pocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Performance tweaks
user_pref("gfx.webrender.all", true);
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.memory.enable", true);

