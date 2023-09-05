import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import FloatUI


FloatWindow {

    title: "Neural Network"

    windowHeader: Item {
        anchors.fill: parent
        Text {
            id: windowTitle
            text: qsTr("Set your App title")
            anchors.centerIn: parent
            font.pixelSize: 20
            color: "black"
        }
    }

    mainContentItem: Item {
        anchors.fill: parent
    }

    menuItem: Item {
        anchors.fill: parent
        OverlayButton {
            id:btn1
            title: "Smart Scan"
            icon: "qrc:/assets/icons/neuralnet_icon.png"
            radius: itemRadius / 2
            selected: true
            selectColor: selectedColor
            callBackFunction: setRandomGradientValue
        }
    }
}
