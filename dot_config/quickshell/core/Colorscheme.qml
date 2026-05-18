pragma Singleton

import Quickshell
import QtQuick

QtObject {
    // General
    property color bg: "#2c2c2c"
    property color bgAccent: "#4a4a4a"
    property color primary: "#72efdd"
    property color primaryAccent: "#14b89f"

    // Hyprland
    property color hyprBg: bgAccent
    property color focusedWorkspace: primary
    property color unfocusedWorkspace: "#5a5a5a"

    // Start Menu Button
    property color startMenuBg: "#4a4a4a"


    // Fonts
    property color fontColorGray: "#9c9c9c"
    property color fontColorPrimary: primary
}
