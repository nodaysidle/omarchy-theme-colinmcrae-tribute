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
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : root.workspaceIds().length
    columnSpacing: root.vertical ? 0 : Style.space(1)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIds()

      WidgetButton {
        required property int modelData

        readonly property var workspace: root.workspaceById(modelData)
        readonly property bool occupied: workspace !== null && workspace.toplevels.values.length > 0
        readonly property bool focused: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === modelData

        bar: root.bar
        // Stage numbers: the focused workspace reads "SS3", the rest stay bare digits.
        readonly property string digit: modelData === 10 ? "0" : String(modelData)
        text: focused ? "SS" + digit : digit
        readonly property real stageWidth: focused ? Style.space(34) : Style.space(20)

        // Exact requested color scheme:
        // - Active/Focused (current desktop): Bright Speedline Gold (#D4AF37)
        // - Occupied with background windows (e.g. desktop 3): Muted Gold (#C5A059 / #B38F46)
        // - Empty / Unused desktops: SWRT Rally Blue (#2B5B9E / #3B6DB5)
        foreground: focused ? "#D4AF37" : (occupied ? "#C5A059" : "#3B6DB5")

        // Pure numbers, zero boxes, zero squares
        opacity: focused ? 1.0 : (occupied ? 0.90 : 0.55)
        horizontalMargin: 6
        verticalPadding: 6
        fixedWidth: root.vertical ? root.barSize : stageWidth
        fixedHeight: root.barSize

        onPressed: function() { root.focusWorkspace(modelData) }
      }
    }
  }
}
