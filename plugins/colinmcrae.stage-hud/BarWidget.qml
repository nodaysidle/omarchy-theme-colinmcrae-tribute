import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "colinmcrae.stage-hud"

  // Above this the "water temp" turns STi Cherry Red.
  readonly property int hotCelsius: 85

  property int uptimeSeconds: 0
  property int waterTemp: -1

  function pad(n) { return n < 10 ? "0" + n : String(n) }

  readonly property string stageTime: {
    var h = Math.floor(uptimeSeconds / 3600)
    var m = Math.floor((uptimeSeconds % 3600) / 60)
    return pad(h) + ":" + pad(m)
  }

  implicitWidth: row.implicitWidth
  implicitHeight: row.implicitHeight

  // One cheap read every 30 s: /proc/uptime plus the x86_pkg_temp zone,
  // found by type because thermal_zone numbering can change between boots.
  Process {
    id: probe
    command: ["sh", "-c", "cut -d. -f1 /proc/uptime; for z in /sys/class/thermal/thermal_zone*; do [ \"$(cat $z/type)\" = x86_pkg_temp ] && cat $z/temp && break; done"]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        var lines = String(text || "").trim().split("\n")
        if (lines.length > 0) root.uptimeSeconds = parseInt(lines[0]) || 0
        if (lines.length > 1) root.waterTemp = Math.round((parseInt(lines[1]) || 0) / 1000)
      }
    }
  }

  Timer {
    interval: 30000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: if (!probe.running) probe.running = true
  }

  Row {
    id: row
    anchors.verticalCenter: parent.verticalCenter
    spacing: 0

    WidgetButton {
      bar: root.bar
      text: "SS " + root.stageTime
      foreground: "#F2F5F8"
      horizontalMargin: 6
      tooltipText: "Stage time (uptime)\nClick: pace note"
      onPressed: function() { if (root.bar) root.bar.run("pacenote") }
    }

    WidgetButton {
      bar: root.bar
      visible: root.waterTemp >= 0
      text: "󰔏 " + root.waterTemp + "°C"
      foreground: root.waterTemp >= root.hotCelsius ? "#FF0055" : "#FFF200"
      horizontalMargin: 6
      tooltipText: "Water temp (CPU package)"
      pressable: false
    }
  }
}
