import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "colinmcrae.wrc-badge"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: ""
    hasVisualContent: true
    horizontalMargin: 8
    verticalPadding: 4
    tooltipText: "Colin McRae Tribute — 1997 Subaru WRC97 (P2 WRC)"

    onPressed: function(code) {
      if (code === Qt.LeftButton) {
        // Run quick notification with iconic Colin McRae quote
        if (root.bar && root.bar.run) {
          root.bar.run("notify-send -a 'Colin McRae 555' '\"If in doubt, flat out.\"' 'Subaru World Rally Team — 1997 WRC97 (P2 WRC)' -i emblem-default")
        }
      } else if (code === Qt.RightButton) {
        // Toggle theme selector
        if (root.bar && root.bar.run) {
          root.bar.run("omarchy-theme-switcher")
        }
      }
    }

    Rectangle {
      id: badge
      anchors.centerIn: parent
      width: contentRow.implicitWidth + 14
      height: Math.min(button.height - 6, 22)
      radius: height / 2

      // World Rally Blue / Cockpit Carbon background with subtle frosted border
      color: button.tooltipHovered ? "#1a2c4e" : "#0d1b33"
      border.color: button.tooltipHovered ? "#FFF200" : "#D4AF37"
      border.width: 1

      Behavior on color { ColorAnimation { duration: 150 } }
      Behavior on border.color { ColorAnimation { duration: 150 } }

      Row {
        id: contentRow
        anchors.centerIn: parent
        spacing: 5

        // STi Cherry Red rally dash pill
        Rectangle {
          width: 3
          height: 10
          anchors.verticalCenter: parent.verticalCenter
          radius: 1.5
          color: "#FF0055"
        }

        // 555 Rally Logo Text
        Text {
          text: "555"
          anchors.verticalCenter: parent.verticalCenter
          font.family: "JetBrainsMono Nerd Font"
          font.pixelSize: 11
          font.bold: true
          color: "#FFF200" // 555 Neon Yellow
          renderType: Text.NativeRendering
        }

        // WRC emblem
        Text {
          text: "WRC"
          anchors.verticalCenter: parent.verticalCenter
          font.family: "JetBrainsMono Nerd Font"
          font.pixelSize: 8
          font.weight: Font.DemiBold
          color: "#F2F5F8" // Monte Carlo White
          opacity: 0.85
          renderType: Text.NativeRendering
        }
      }
    }
  }
}
