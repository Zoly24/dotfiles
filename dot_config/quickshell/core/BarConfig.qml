import Quickshell
import QtQuick

QtObject {
    id: barConfig

    // Bar Settings
    property int barHeight: 45
    property int moduleHeight: 30
    property int moduleMargin: 15

    property string fontFamily: "Maple Mono"
    property int fontSize: 15

    // HyprModule Settings
    property int workSpacing: 20
    property int workspaceNumber: 10
    property int workspaceHeight: moduleHeight - moduleMargin
    property int workspaceWidth: workspaceHeight
    property int workspaceRadius: workspaceHeight / 2


    // Start Menu Settings
    property int startMenuHeight: 400;
    property int startMenuWidth: 300;
    property int startMenuRadius: 10;

    // Audio Menu Settings
    property int audioMenuHeight: 250;
    property int audioMenuWidth: 350;
    property int audioMenuRadius: 10;
    property int audioMenuMargin: 10;

    property int audioViewMargin: 10;
    property int audioViewTextMargin: 20;
    property int audioButtonMargin: 15;
    property real audioItemHeight: 50;
    property real audioItemMargin: 10;

    // Wifi Menu Settings
    property int wifiMenuHeight: 400;
    property int wifiMenuWidth: 300;
    property int wifiMenuRadius: 10;

    // Wallpaper Menu Settings
    property int wallpaperIconWidth: 100;
    property int wallpaperMenuRadius: 15

    // ClockModule Settings
    property int clockWidth: (fontSize * 8)
    property int clockInterval: 1000

}
