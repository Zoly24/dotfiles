import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects
import "../core/"

Item {
    id: sliderContainer
    property int sliderHeight;
    property int sliderWidth;
    property real percentFilled: 0;
    property bool hidden: false;

    height: sliderHeight
    width: sliderWidth

    signal updated(real clampX);

    function updateSlider(mouseX) {
        let dX = (mouseX / visualContainer.width)
        let clampX = Math.max(0, Math.min(1, dX))
        sliderContainer.updated(clampX)
    }

    Item {
        id: visualContainer
        anchors.fill: parent

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: visualContainer.width
                height: visualContainer.height
                radius: Math.min(height, width) / 2
            }
        }

        // background
        Rectangle {
            id: outerSlider
            anchors.fill: parent
            color: Colorscheme.bgAccent
        }

        // foreground
        Rectangle {
            id: innerSlider
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: parent.width * sliderContainer.percentFilled
            color: !sliderContainer.hidden ? Colorscheme.primary : "transparent"
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.OpenHandCursor
        onPressed: {
            updateSlider(mouseX)
        }
        onPositionChanged: {
            if (pressed) {
                updateSlider(mouseX)
            }
        }
    }
}
