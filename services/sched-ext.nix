{ pkgs, ... }:

{
  # Extensible BPF scheduler (sched_ext). scx_bpfland (general desktop),
  # a good fit for a laptop. Alternatives: scx_lavd (latency/power aware), scx_tickless (battery), scx_flash (low latency).
  services.scx-loader = {
  	enable = true;
  	schedsPackages = [ pkgs.scx.full ];
  	config.default_sched = "scx_bpfland";
  };
}
