import Quickshell
import QtQuick
import Quickshell.Services.Pipewire

import '../core'
import '../components/'

Item {
    id: audioMenu
    property PanelWindow bar;
    property BarConfig barConfig;


    height: menuButton.height
    width: menuButton.width


    anchors.margins: barConfig.moduleMargin
    ButtonModule {
        id: menuButton
        icon: AudioService.isSinkMuted ? "󰝟" : "󰕾"
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
        menuHeight: barConfig.audioMenuHeight
        menuWidth: barConfig.audioMenuWidth
        menuRadius: barConfig.audioMenuRadius
        anchor.rect.x: bar.width
        anchor.rect.y: bar.height 

        AudioView {
            anchors.margins: audioMenu.barConfig.audioViewMargin
            config: audioMenu.barConfig;
        }
    }
}
