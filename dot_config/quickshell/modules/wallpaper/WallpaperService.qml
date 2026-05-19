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
                try {
                    let data = JSON.parse(text);
                    for (let key in data) {
                        for (let disp of data[key]) {
                            if (disp.displaying && disp.displaying.image) {
                                service.currentWall = disp.displaying.image;
                                return;
                            }
                        }
                    }
                } catch (e) {
                    console.error("Failed to parse awww output:", e);
                }
            }
        }
    }
}
