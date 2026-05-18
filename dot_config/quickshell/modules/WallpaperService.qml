pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

QtObject {
    id: service
    property var imageList: []
    property string currentWall: ""

    property Process listProc: Process {
        running: true
        command: ["sh", "-c", 'find "$HOME/Pictures/Wallpapers" -maxdepth 1 -not -path "*/.*" | jq -R . | jq -s .']
        stdout: StdioCollector {
            onStreamFinished: {
                let jsonList = JSON.parse(text);
                jsonList.shift();
                service.imageList = jsonList;
            }
        }
    }

    property Process queryProc: Process {
        running: true
        command: ["awww", "query", "-j"]
        stdout: StdioCollector {
            onStreamFinished: {
                let lines = text.split('\n');
                let imageLine = lines.find(l => l.includes("image"));
                if (imageLine) {
                    service.currentWall = imageLine.trim().split('\"').find(s => s.includes("home"));
                }
            }
        }
    }
}
