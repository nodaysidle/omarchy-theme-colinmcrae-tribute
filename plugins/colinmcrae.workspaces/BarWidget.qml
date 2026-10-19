import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "colinmcrae.workspaces"

  function workspaceById(id) {
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      if (values[i].id === id) return values[i]
    }
    return null
  }

  function workspaceIds() {
    var ids = [1, 2, 3, 4, 5]
    var values = Hyprland.workspaces.values

    for (var i = 0; i < values.length; i++) {
      var id = values[i].id
      if (id > 0 && id <= 10 && ids.indexOf(id) === -1) ids.push(id)
    }

    ids.sort(function(left, right) { return left - right })
    return ids
  }

  function focusWorkspace(id) {
    if (!root.bar) return
    root.bar.run("hyprctl dispatch workspace " + id)
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(2)

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : root.workspaceIds().length
    columnSpacing: root.vertical ? 0 : Style.space(2)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIds()

      Item {
        required property int modelData
        readonly property var workspace: root.workspaceById(modelData)
        readonly property bool occupied: workspace !== null && workspace.toplevels.values.length > 0
        readonly property bool focused: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === modelData

        width: root.vertical ? root.barSize : Style.space(22)
        height: root.barSize

        Rectangle {
          id: pill
          anchors.centerIn: parent
          width: parent.width - 2
          height: 18
          radius: 3

          // Active = Speedline Gold rim tint background; Occupied = SWRT subtle blue wash; Empty = transparent
          color: focused ? "rgba(212, 175, 55, 0.28)" : (occupied ? "rgba(18, 85, 204, 0.20)" : "transparent")
          border.color: focused ? "#D4AF37" : (occupied ? "rgba(76, 107, 153, 0.45)" : "transparent")
          border.width: focused ? 1 : (occupied ? 1 : 0)

          Behavior on color { ColorAnimation { duration: 140 } }
          Behavior on border.color { ColorAnimation { duration: 140 } }

          Text {
            anchors.centerIn: parent
            text: modelData === 10 ? "0" : String(modelData)
            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 11
            font.bold: focused || occupied
            renderType: Text.NativeRendering

            // Active/focused = Speedline Gold (#D4AF37 / #E5C158)
            // Occupied with windows = SWRT Cyan/White (#66D9FF)
            // Empty = Subtle Muted Blue (#4C6B99)
            color: focused ? "#E5C158" : (occupied ? "#70B8FF" : "#3B5377")
          }
        }

        MouseArea {
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: root.focusWorkspace(modelData)
        }
      }
    }
  }
}
