{
  # Extensible BPF scheduler (sched_ext). scx_lavd is latency/power aware,
  # a good fit for a laptop. Alternatives: scx_bpfland (general desktop), scx_tickless (battery), scx_flash (low latency).
  services.scx = {
  	enable = true;
  	scheduler = "scx_bpfland";
  	extraArgs = [ "-m performance" ];
  };
}
