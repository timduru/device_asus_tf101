#include <errno.h>
#include <fcntl.h>
#include <healthd.h>
#include <stdio.h>
#include <unistd.h>

// from BatteryManager.java
#define BATTERY_STATUS_UNKNOWN 1
#define BATTERY_STATUS_CHARGING 2
#define BATTERY_STATUS_DISCHARGING 3
#define BATTERY_STATUS_NOT_CHARGING 4
#define BATTERY_STATUS_FULL 5

bool healthd_board_isDockPresent() {
    int fd = open("/sys/class/power_supply/dock_battery/uevent", O_RDONLY, 0);
    if (fd == -1) return false;

    const int SIZE = 2;
    char buf[SIZE];
    ssize_t count = TEMP_FAILURE_RETRY(read(fd, buf, SIZE));

    close(fd);
    return count == SIZE;
}

void healthd_board_init(struct healthd_config *config)
{
    config->batteryStatusPath            = "/sys/class/power_supply/battery/status";
    config->batteryHealthPath            = "/sys/class/power_supply/battery/health";
    config->batteryPresentPath           = "/sys/class/power_supply/battery/present";
    config->batteryCapacityPath          = "/sys/class/power_supply/battery/capacity";
    config->batteryVoltagePath           = "/sys/class/power_supply/battery/voltage_now";
    config->batteryTemperaturePath       = "/sys/class/power_supply/battery/temp";
    config->batteryTechnologyPath        = "/sys/class/power_supply/battery/technology";

    config->dockBatterySupported         = true;
    config->dockBatteryStatusPath        = "/sys/class/power_supply/dock_battery/status";
    config->dockBatteryCapacityPath      = "/sys/class/power_supply/dock_battery/capacity";
}

int healthd_board_battery_update(struct android::BatteryProperties *props)
{
    // board doesn't have the present sysfs for dock battery, so we need to
    // fill it from the uevent sysfs. If the uevent sysfs have some data then
    // the dock battery is present. The status will be UNKNOWN
    props->dockBatteryPresent = healthd_board_isDockPresent();
    if (!props->dockBatteryPresent) {
        props->dockBatteryStatus = BATTERY_STATUS_UNKNOWN;
    }


    // To follow the AOSP battery contract, the board only should report itself
    // as pluggable when is charging or full charging
    if (props->batteryStatus != BATTERY_STATUS_CHARGING &&
        props->batteryStatus != BATTERY_STATUS_FULL) {

        props->chargerAcOnline = false;
        props->chargerUsbOnline = false;
        props->chargerWirelessOnline = false;
    }
    if (props->dockBatteryStatus != BATTERY_STATUS_CHARGING &&
        props->dockBatteryStatus != BATTERY_STATUS_FULL) {

        props->chargerDockAcOnline = false;
    }

    // return 0 to log periodic polled battery status to kernel log
    return 0;
}


