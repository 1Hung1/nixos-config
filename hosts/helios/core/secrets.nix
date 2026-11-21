{
  # Github token secret
  age.secrets.github-token = {
    file = ../../../secrets/github-token.age;
    owner = "hung";
    mode = "0400";
  };

  # Password secret
  age.secrets.login-password-hash = {
    file = ../../../secrets/login-password-hash.age;
    mode = "0400";
  };

  # Proton VPN private key secret
  age.secrets.wireguard-protonvpn-key = {
    file = ../../../secrets/wireguard-protonvpn-key.age;
    owner = "systemd-network";
    group = "systemd-network";
    mode = "0640";
  };
}
