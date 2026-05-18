import Quickshell
import QtQuick
import "../components"
import "../modules"

PanelWindow {
    id: bar
    
    required property var screenData;
    screen: screenData;

    anchors {
        top: true
        left: true
        right: true
    }

    BarConfig {
        id: barConfig
    }

    implicitHeight: barConfig.barHeight
    color: Colorscheme.bg

    // LEFT MODULES
    HyprModule {
        id: hypr
        barConfig: barConfig
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    // CENTER MODULES
    Rectangle {
        id: clockTime
        anchors.centerIn: parent

        height: barConfig.moduleHeight
        width: barConfig.clockWidth
        radius: (clockTime.height + clockTime.width) / 2
        color: Colorscheme.bgAccent
        Text {
            anchors.centerIn: clockTime
            font.family: barConfig.fontFamily;
            font.pixelSize: barConfig.fontSize;
            color: Colorscheme.fontColorPrimary
            text: ClockModule.time
        }
    }

    StartMenu {
        id: startMenu
        anchors.right: clockTime.left
        anchors.verticalCenter: parent.verticalCenter
        bar: bar
        barConfig: barConfig
    }

    // RIGHT MODULES
    WifiMenu {
        id: wifiMenu
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        bar: bar
        barConfig: barConfig
    }

    AudioMenu {
        id: audioMenu
        anchors.right: wifiMenu.left
        anchors.verticalCenter: parent.verticalCenter
        bar: bar
        barConfig: barConfig
    }

    WallpaperMenu {
        id: wallpaperMenu
        anchors.right: audioMenu.left
        anchors.verticalCenter: parent.verticalCenter
        bar: bar
        config: barConfig
        currentScreen: screenData
    }
}
