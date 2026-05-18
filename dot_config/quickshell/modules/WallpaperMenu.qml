import Quickshell
import QtQuick
import '../core'
import '../components/'

Item {
    id: wallpaperMenu
    required property var currentScreen
    property PanelWindow bar
    property BarConfig config

    implicitWidth: menuButton.width
    implicitHeight: menuButton.height
    anchors.margins: config.moduleMargin

    ButtonModule {
        id: menuButton
        config: wallpaperMenu.config
        buttonHeight: config.moduleHeight
        buttonWidth: config.wallpaperIconWidth
        buttonBorderWidth: 10
        imagePath: WallpaperService.currentWall

        onClicked: {
            console.log("Service object:", WallpaperService);
            
            if (WallpaperService && WallpaperService.listProc) {
                WallpaperService.listProc.running = true;
            } else {
                console.error("WallpaperService or listProc is NULL/Undefined!");
            }

            // Move this above the service call to test if the menu works independently
            actionMenu.visible = !actionMenu.visible;
        }
    }

    ActionMenu {
        id: actionMenu
        anchor.window: bar
        menuHeight: currentScreen.height * 0.45
        menuWidth: currentScreen.width * 0.75

        anchor.rect.x: (currentScreen.width / 2) - (menuWidth / 2)
        anchor.rect.y: (currentScreen.height / 2) - (menuHeight / 2)
        
        WallSlide {
            anchors.fill: parent
            containerHeight: parent.height - parent.menuRadius
            containerWidth: parent.width - parent.menuRadius
            imageList: WallpaperService.imageList
            barConfig: config

            onCloseRequested: {
                actionMenu.visible = false;
                WallpaperService.queryProc.running = true;
            }
        }
    }
}
