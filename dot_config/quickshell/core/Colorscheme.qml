pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

QtObject {
    id: colorscheme

    property color bg: "#111318"
    property color bgAccent: "#1d2024"
    property color primary: "#aac7ff"
    property color primaryAccent: "#dcbce0"
    property color fontColorGray: "#c4c6d0"
    property color unfocusedWorkspace: "#8e9099"
    property color startMenuBg: "#1d2024"

    property color hyprBg: bgAccent
    property color focusedWorkspace: primary
    property color fontColorPrimary: primary

    function applyColors(c) {
        if (c.bg !== undefined) colorscheme.bg = c.bg;
        if (c.bgAccent !== undefined) colorscheme.bgAccent = c.bgAccent;
        if (c.primary !== undefined) colorscheme.primary = c.primary;
        if (c.primaryAccent !== undefined) colorscheme.primaryAccent = c.primaryAccent;
        if (c.fontColorGray !== undefined) colorscheme.fontColorGray = c.fontColorGray;
        if (c.unfocusedWorkspace !== undefined) colorscheme.unfocusedWorkspace = c.unfocusedWorkspace;
        if (c.startMenuBg !== undefined) colorscheme.startMenuBg = c.startMenuBg;
    }

    function loadColors() {
        reader.running = true;
    }

    property Process reader: Process {
        running: true
        command: ["sh", "-c", "cat $HOME/.config/quickshell/core/quickshell-colors.json"]
        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    applyColors(JSON.parse(text));
                } catch(e) {
                    console.log("Colorscheme: could not load colors", e.toString());
                }
            }
        }
    }

    Component.onCompleted: {
        var t = Qt.createQmlObject(
            "import QtQuick; Timer { interval: 2000; repeat: true; running: true; property var cb; onTriggered: cb() }",
            colorscheme, "colorReloadTimer"
        );
        t.cb = loadColors;
    }
}
