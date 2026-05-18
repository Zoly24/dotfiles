import Quickshell
import Quickshell.Io
import QtQuick
import "./core"
ShellRoot {
    Variants {
        model: Quickshell.screens;
        delegate: Component {
            Bar {
                required property var modelData
                screenData: modelData
            }
        }
    }
}
