import Quickshell
import QtQuick
import '../core'
import '../components/'

Item {
    id: wifiMenu
    property PanelWindow bar
    property BarConfig barConfig

    implicitWidth: menuButton.width
    implicitHeight: menuButton.height

    anchors.margins: barConfig.moduleMargin

    ButtonModule {
        id: menuButton
        config: barConfig
        icon: "  Wi-fi"
        buttonHeight: config.moduleHeight
        buttonWidth: buttonHeight + (config.fontSize * 4) 
        onClicked: {
            console.log("Clicked Wifi")
            actionMenu.visible = !actionMenu.visible
        }
    }

    ActionMenu {
        id: actionMenu
        anchor.window: bar
        menuHeight: barConfig.wifiMenuHeight
        menuWidth: barConfig.wifiMenuWidth
        menuRadius: barConfig.wifiMenuRadius
        menuBorderWidth: 2
        anchor.rect.x: bar.width
        anchor.rect.y: bar.height
    }
}
