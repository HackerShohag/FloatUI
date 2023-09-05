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

import QtQuick
import QtQuick.Layouts

import "../utils.js" as Utils

Rectangle {
    id: overlayButton

    property alias title: buttonText.text
    property alias icon: buttonIcon.source
    property string selectColor
    property bool selected: false
    property var callBackFunction

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
        margins: 5
    }

    color: hoverHandler.containsMouse ? Utils.shadeColor(selectColor, -20) : selected ? Utils.shadeColor(selectColor, -10) : "transparent"
    height: 30

    Row {
        anchors.fill: parent
        spacing: 5
        layoutDirection: Qt.LeftToRight
        padding: 4
        Image {
            id: buttonIcon
            anchors {
                verticalCenter: parent.verticalCenter
                margins: 5
            }
            width: 30
            height: 25
        }
        Text {
            id: buttonText
            anchors {
                verticalCenter: parent.verticalCenter
                margins: 5
            }
            color: "black"
            font.bold: selected
        }
    }
    MouseArea {
        id: hoverHandler
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            callBackFunction()
            parent.color = Utils.shadeColor(selectColor, -20)
            selected = true
        }

        onPressed: overlayButton.color = Utils.shadeColor(selectColor, -30)
        onReleased: overlayButton.color = hoverHandler.containsMouse ? Utils.shadeColor(selectColor, -20) : selected ? Utils.shadeColor(selectColor, -10) : "transparent"
        onHoveredChanged: overlayButton.color = hoverHandler.containsMouse ? Utils.shadeColor(selectColor, -20) : selected ? Utils.shadeColor(selectColor, -10) : "transparent"
    }
}
