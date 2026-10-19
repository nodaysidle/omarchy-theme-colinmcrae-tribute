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
    // Explicit fixed width with clean breathing room so it doesn't touch or overlap the clock
    fixedWidth: 84
    horizontalMargin: 8
    verticalPadding: 2
    tooltipText: "Colin McRae Tribute — 1997 Subaru WRC97 (P2 WRC)"

    onPressed: function(code) {
      if (code === Qt.LeftButton) {
        if (root.bar && root.bar.run) {
          root.bar.run("notify-send -a 'Colin McRae 555' '\"If in doubt, flat out.\"' 'Subaru World Rally Team — 1997 WRC97 (P2 WRC)' -i emblem-default")
        }
      } else if (code === Qt.RightButton) {
        if (root.bar && root.bar.run) {
          root.bar.run("omarchy-theme-switcher")
        }
      }
    }

    Rectangle {
      id: badge
      anchors.centerIn: parent
      width: 76
      height: 20
      radius: 4

      // Deep World Rally Blue background
      color: button.tooltipHovered ? "#002875" : "#001A4E"
      border.color: button.tooltipHovered ? "#FFF200" : "#D4AF37"
      border.width: 1

      Behavior on color { ColorAnimation { duration: 150 } }
      Behavior on border.color { ColorAnimation { duration: 150 } }

      Row {
        anchors.centerIn: parent
        spacing: 5

        // STi Cherry Red racing notch
        Rectangle {
          width: 3
          height: 11
          anchors.verticalCenter: parent.verticalCenter
          radius: 1.5
          color: "#FF0055"
        }

        // The authentic crescent emblem cropped straight from the car
        Image {
          anchors.verticalCenter: parent.verticalCenter
          source: Qt.resolvedUrl("crescent.png")
          width: 32
          height: 15
          fillMode: Image.PreserveAspectFit
          smooth: true
          mipmap: true
        }

        // 555 text in SWRT rally yellow
        Text {
          anchors.verticalCenter: parent.verticalCenter
          text: "555"
          font.family: "JetBrainsMono Nerd Font"
          font.pixelSize: 11
          font.bold: true
          color: "#FFF200"
          renderType: Text.NativeRendering
        }
      }
    }
  }
}
