// Sandbox.qml
import Quickshell
import QtQuick
import "../components"
import "../modules"

FloatingWindow {
    visible: true
    width: 400
    height: 300
    color: "#2c2c2c"

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text { text: "Testing My New Slider:"; color: "white" }

        // Drop your component here to see it live
        SliderComponent {
            sliderHeight: 10
            sliderWidth: 100
        }
    }
}
