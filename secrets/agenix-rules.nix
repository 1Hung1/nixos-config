let
  hung = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHj2SXoiD9yy3bLu1I/Lq7cixt3u3er3x+FxQQSsNQxu hung@solstice";

  solstice = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqIX353ETERQc85Zf5HFmG2LY71W2cpKP2aBaqWoYsI root@solstice";
in
{
  "wireguard-protonvpn-key.age".publicKeys = [ hung solstice ];
  "login-password-hash.age".publicKeys = [ hung solstice ];
  "github-token.age".publicKeys = [ hung solstice ];
}
