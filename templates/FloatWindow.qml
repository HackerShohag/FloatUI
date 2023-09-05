/*
 * Copyright (C) 2023  Abdullah AL Shohag
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * raven.downloader is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQml
import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import "Buttons"
import "utils.js" as Utils

ApplicationWindow {
    id : mainWindow
    width: 1280
    height: 720
    visible: true
    flags: Qt.FramelessWindowHint | Qt.Window
    opacity: 0.1
    color: "transparent"

//    property alias title: windowTitle.text
    property alias windowHeader: windowHeaderItem.data
    property alias menuItem: menuContainerItem.data
    property alias mainContentItem: contentContainerItem.data

    property int itemRadius: 15
    property bool windowFullscreen
    property string selectedColor: contentContainerColor1[0]
    property int randomValueP

    property var contentContainerColor1: ["#64CCC5", "#EBEF95", "#E2C799", "#FFBB5C", "#FFFEC4"]
    property var contentContainerColor2: ["#176B87", "#EF9595", "#9A3B3B", "#C63D2F", "#FF9B9B"]


    function setRandomGradientValue() {
        var randomValue = Utils.getRandomInteger(contentContainerColor1.length)

        contentContainerGradientStartColor.color = contentContainerColor1[randomValue]
        contentContainerGradientEndColor.color = contentContainerColor2[randomValue]

        menuContainerGradientStartColor.color = Utils.shadeColor(contentContainerColor1[randomValue], 20)
        menuContainerGradientEndColor.color = Utils.shadeColor(contentContainerColor2[randomValue], 20)

        selectedColor = contentContainerColor1[randomValue]
    }

    onVisibilityChanged: (visibility) => {
        windowFullscreen = visibility == 4 || visibility == 5
    }

    onWidthChanged: {
        if (windowFullscreen) {
            contentContainer.anchors.leftMargin = 0
            menuContainer.x = width / 20
        }
        else {
            menuContainer.x = mainWindow.x / 2
            contentContainer.anchors.leftMargin = width / 20
        }
    }

    Rectangle {
        id: contentContainer
        radius: itemRadius
        opacity: 0.95
        anchors {
            leftMargin: parent.width / 20
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: parent.left
        }

        Rectangle {
            id: windowTitleBar
            anchors {
                top: parent.top
                topMargin: 10
                right: parent.right
                left: parent.left
            }
            height: parent.height * 0.05
            color: "transparent"
            radius: parent.radius

            ActionButton {
                id: exitButton
                anchors.left: parent.left
                bText: "✘"
                bgColor: "red"
                textColor: "white"
                callbackFunction: function() {Qt.quit();}
            }

            ActionButton {
                id: maximizeButton
                anchors.left: exitButton.right
                bText: "➖"
                bgColor: "yellow"
                textColor: "grey"
                callbackFunction: function() {mainWindow.showMinimized()}
            }

            ActionButton {
                id: minimizeButton
                anchors.left: maximizeButton.right
                bText: (mainWindow.visibility == 4 || mainWindow.visibility == 5) ? "⇲" : "⇱"
                bgColor: "green"
                textColor: "white"
                callbackFunction: function() {
                    if (mainWindow.visibility == 4 || mainWindow.visibility == 5)
                        mainWindow.showNormal()
                    else
                        mainWindow.showFullScreen()
                }
            }

            Rectangle {
                id: windowHeaderItem
                anchors {
                    left: minimizeButton.right
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    margins: 5
                }

                color: "transparent"
            }
        }

        Rectangle {
            id: contentContainerItem
            anchors {
                top: windowTitleBar.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                margins: 10
            }
            color: "transparent"
        }

        gradient: Gradient {
            GradientStop {id: contentContainerGradientStartColor; position: 0.0; color: contentContainerColor1[0] }
            GradientStop {id: contentContainerGradientEndColor; position: 1.0; color: contentContainerColor2[0] }
        }
    }

    Rectangle {
        id: menuContainer
        radius: itemRadius
        opacity: 0.9
        anchors {
            margins: Math.min(parent.height, parent.width) / 15
            rightMargin: parent.width * 0.8
            leftMargin: 0
            top: parent.top
            bottom: parent.bottom
        }

        width: parent.width * 0.2
        x: mainWindow.x / 2

        Rectangle {
            id: menuContainerItem
            anchors {
                fill: parent
                margins: 10
            }
            color: "transparent"
        }

        gradient: Gradient {
            GradientStop { id: menuContainerGradientStartColor; position: 0.0; color: Utils.shadeColor(contentContainerColor1[0], 20) }
            GradientStop { id: menuContainerGradientEndColor; position: 1.0; color: Utils.shadeColor(contentContainerColor2[0], 20) }
        }
    }

    DropShadow {
        anchors.fill: contentContainer
        opacity: 0.2
        source: contentContainer
        radius: 5
        color: "gray"
    }

    DropShadow {
        anchors.fill: menuContainer
        opacity: 0.6
        source: menuContainer
        radius: 5
        color: "gray"
    }
}
