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
      width: logoCanvas.width + 16
      height: 20
      radius: 4

      // Iconic SWRT Deep World Rally Blue background
      color: button.tooltipHovered ? "#002B7A" : "#001A4E"
      border.color: button.tooltipHovered ? "#FFDD00" : "#D4AF37"
      border.width: 1

      Behavior on color { ColorAnimation { duration: 150 } }
      Behavior on border.color { ColorAnimation { duration: 150 } }

      Canvas {
        id: logoCanvas
        anchors.centerIn: parent
        width: 48
        height: 14

        onPaint: {
          var ctx = getContext("2d")
          ctx.reset()

          // Draw the iconic 3 State Express 555 glyphs
          // Exact SWRT pure racing yellow
          ctx.fillStyle = "#FFDD00"

          function drawFive(startX) {
            ctx.save()
            ctx.translate(startX, 0)
            
            // Authentic 555 slanted geometric profile (Prodrive / State Express)
            // Top horizontal roof bar
            ctx.beginPath()
            ctx.moveTo(1.5, 0.5)
            ctx.lineTo(12.5, 0.5)
            ctx.lineTo(12.0, 2.8)
            ctx.lineTo(3.8, 2.8)
            ctx.closePath()
            ctx.fill()

            // Vertical upper spine with characteristic slant
            ctx.beginPath()
            ctx.moveTo(3.6, 2.4)
            ctx.lineTo(1.8, 6.2)
            ctx.lineTo(4.4, 6.2)
            ctx.lineTo(5.8, 2.4)
            ctx.closePath()
            ctx.fill()

            // Distinctive loop with flat top connection and curved racing belly
            ctx.beginPath()
            ctx.moveTo(3.2, 5.6)
            ctx.lineTo(10.2, 5.6)
            ctx.bezierCurveTo(13.2, 5.6, 13.8, 8.2, 13.0, 10.4)
            ctx.bezierCurveTo(12.0, 13.2, 8.8, 13.8, 4.8, 13.8)
            ctx.bezierCurveTo(1.8, 13.8, 0.2, 12.8, 0.0, 12.4)
            ctx.lineTo(1.2, 9.8)
            ctx.bezierCurveTo(2.4, 10.6, 4.4, 11.2, 6.4, 11.2)
            ctx.bezierCurveTo(8.6, 11.2, 10.0, 10.4, 10.4, 9.2)
            ctx.bezierCurveTo(10.8, 7.8, 9.4, 7.4, 7.2, 7.4)
            ctx.lineTo(3.2, 7.4)
            ctx.closePath()
            ctx.fill()

            ctx.restore()
          }

          // Draw the three 5s overlapping/staggered as on the car
          drawFive(0)
          drawFive(12.5)
          drawFive(25)

          // Accent dot or crescent tail
          ctx.fillStyle = "#FF0055"
          ctx.beginPath()
          ctx.arc(43, 7, 2.2, 0, 2 * Math.PI)
          ctx.fill()
        }
      }
    }
  }
}
