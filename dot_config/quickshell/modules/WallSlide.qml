import Quickshell
import QtQuick
import Quickshell.Io
import Qt5Compat.GraphicalEffects


import '../core'

Rectangle {
    id: wallpaperContainer
    property int containerHeight
    property int containerWidth
    property var imageList: []
    property BarConfig barConfig
    property string selectedImage;

    signal closeRequested();
    
    width: containerWidth
    height: containerHeight
    color: "transparent"


    ListView {
        id: wallList
        anchors.fill: parent
        orientation: ListView.Horizontal
        spacing: 20

        leftMargin: 40 
        rightMargin: 40

        clip: true 

        model: wallpaperContainer.imageList

        // fade stuff
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: LinearGradient {
                width: wallList.width
                height: wallList.height
                start: Qt.point(0, 0)
                end: Qt.point(wallList.width, 0)
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "transparent" }
                    GradientStop { position: 0.05; color: "white" }
                    GradientStop { position: 0.95; color: "white" }
                    GradientStop { position: 1.0; color: "transparent" }
                }
            }
        }

        delegate: Rectangle {
            id: entrySkeleton
            width: 200
            height: wallList.height - 40
            anchors.verticalCenter: parent.verticalCenter
            color: Colorscheme.bgAccent
            radius: 20
            clip: true

            Image {
                anchors.fill: parent
                source: modelData
                fillMode: Image.PreserveAspectCrop
                asynchronous: true

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: entrySkeleton.width
                        height: entrySkeleton.height
                        radius: entrySkeleton.radius
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                wallpaperSlideProc.command = ["sh", "-c", '$HOME/.config/quickshell/scripts/new-theme-manager.sh "$1"', "--", modelData]
                    wallpaperSlideProc.running = true
                    wallpaperContainer.selectedImage = modelData 
                    console.log("Applying: " + modelData)
                }

                onPressed: entrySkeleton.scale = 0.95
                onReleased: entrySkeleton.scale = 1.0

                onEntered: entrySkeleton.border.width = 2
                onExited: entrySkeleton.border.width = 0
            }
        }
    }
    Process {
        id: wallpaperSlideProc
        onExited: {
            console.log("done (system size)" + Screen.width + " " + Screen.height)
            wallpaperContainer.closeRequested();
        }
    }
}
