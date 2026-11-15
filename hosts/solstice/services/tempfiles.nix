{
  systemd.tmpfiles.settings."10-noctalia-chromium"."/etc/chromium/policies/managed/noctalia-color.json".f = {
    user = "hung";
    group = "users";
    mode = "0644";
    argument = "{}";
  };
}
