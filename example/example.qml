import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import FloatUI


FloatWindow {

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

    menuItem: Item {
        anchors.fill: parent
        OverlayButton {
            id:btn1
            title: "Smart Scan"
            icon: "qrc:/example.png"
            radius: itemRadius / 2
            selected: true
            selectColor: selectedColor
            callBackFunction: setRandomGradientValue
        }
    }

    mainContentItem: Item {
        anchors.fill: parent
        Rectangle {
            height: 200
            width: 200
            anchors.centerIn: parent
            color: "grey"
        }
    }
}
