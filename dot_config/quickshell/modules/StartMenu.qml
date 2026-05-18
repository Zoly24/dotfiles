import Quickshell
import QtQuick

import '../core'
import '../components/'

Item {
    id: startMenu
    property PanelWindow bar;
    property BarConfig barConfig;

    height: menuButton.height
    width: menuButton.width


    anchors.margins: barConfig.moduleMargin
    ButtonModule {
        id: menuButton
        icon: ""
        config: barConfig
        buttonHeight: barConfig.moduleHeight
        buttonWidth: buttonHeight
        onClicked: {
            console.log("Clicked")
            actionMenu.visible = !actionMenu.visible
        }
    }

    ActionMenu {
        id: actionMenu
        anchor.window: bar
        menuHeight: barConfig.startMenuHeight
        menuWidth: barConfig.startMenuWidth
        menuRadius: barConfig.startMenuRadius
        anchor.rect.x: (bar.width / 2) - (actionMenu.width / 2)
        anchor.rect.y: bar.height 
    }
}
