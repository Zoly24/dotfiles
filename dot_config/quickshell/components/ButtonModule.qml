import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects

import "../core/"


Rectangle {
    id: button
    property int buttonWidth;
    property int buttonHeight;
    property int buttonRadius: (buttonHeight + buttonWidth) / 2;
    property BarConfig config;
    property string imagePath: "";
    property string icon: "";

    property int buttonBorderWidth: 0;

    signal clicked();

    clip: true
    width: buttonWidth;
    height: buttonHeight;
    radius: buttonRadius;
    border.color: Colorscheme.primary
    border.width: button.buttonBorderWidth;
    anchors.margins: config.moduleMargin
    color: imagePath == "" ? Colorscheme.startMenuBg : "transparent"

    Text {
        text: icon
        anchors.centerIn: parent
        font.family: config.fontFamily
        font.pixelSize: config.fontSize
        color: Colorscheme.fontColorPrimary
    }
    Image {
        id: backgroundImage
        property bool adapt: true
        property bool rounded: true
        anchors.fill: parent
        anchors.margins: 1

        layer.enabled: rounded
        layer.effect: OpacityMask {
            maskSource: Item {
                width: backgroundImage.width
                height: backgroundImage.height
                Rectangle {
                    anchors.centerIn: parent
                    width: backgroundImage.adapt ? backgroundImage.width : Math.min(backgroundImage.width, backgroundImage.height)
                    height: backgroundImage.adapt ? backgroundImage.height : width
                    radius: Math.min(width, height)
                }
            }
        }
        mipmap: true
        source: button.imagePath
        visible: button.imagePath != ""
        fillMode: Image.PreserveAspectCrop
    }

    MouseArea {
        id: mouseButton
        enabled: true;
        anchors.fill: button
        onClicked: {
            button.clicked()
        }
    }
}
