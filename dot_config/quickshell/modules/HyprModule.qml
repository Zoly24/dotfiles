import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import '../core'

Rectangle {
    id: hyprBackground

    property color focusedColor: Colorscheme.focusedWorkspace;
    property color unfocusedColor: Colorscheme.unfocusedWorkspace;
    property BarConfig barConfig;

    height: hyprRow.height + barConfig.moduleMargin
    width: hyprRow.width + barConfig.moduleMargin * 2
    radius: Math.min(height, width) / 2

    anchors.margins: barConfig.moduleMargin

    color: Colorscheme.hyprBg

    RowLayout {
        id: hyprRow
        anchors.centerIn: hyprBackground
        spacing: barConfig.workSpacing
        Repeater {
            id: hyprRepeater
            model: barConfig.workspaceNumber

            Rectangle {
                property int workId: index + 1
                property bool isFocused: Hyprland.focusedWorkspace?.id == workId
                color: isFocused ? focusedColor : unfocusedColor
                id: hyprRect
                Layout.preferredHeight: isFocused ? barConfig.workspaceHeight : barConfig.workspaceHeight / 2
                Layout.preferredWidth: isFocused ? barConfig.workspaceWidth : barConfig.workspaceWidth / 2

                radius: barConfig.workspaceRadius
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch("workspace " + workId)
                }
            }
        }
    }
}
