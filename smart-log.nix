{
  config,
  pkgs,
  lib,
  ...
}: {
  systemd.timers."smart-log" = {
    description = "logs SMART data";
    requires = ["smart-log.service"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "smart-log.service";
    };
    wantedBy = ["timers.target"];
  };

  systemd.services."smart-log" = {
    description = "logs SMART data";
    wants = ["smart.timer"];
    script = ''
      date >> /home/christopher/ssd_smart_data_log.txt
      ${pkgs.smartmontools}/bin/smartctl -a /dev/nvme0 | grep "Data Units Written" --color=never >> /home/christopher/ssd_smart_data_log.txt
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    wantedBy = ["multi-user.target"];
  };
}
