pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

import '../core'

Rectangle {
    id: root

    BarConfig { id: barConfig }
        anchors.margins: barConfig.moduleMargin

    property string time: ""

    Process {
        id: clockProc
        command:["date", "+%H:%M:%S"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.time = text
            }
        }
        running: true
    }
    Timer {
        interval: barConfig.interval
        repeat: true
        running: true
        onTriggered: clockProc.running = true
    }

}


