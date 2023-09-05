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

Rectangle {
    id: actionButton
    property string bText
    property string bgColor
    property string textColor
    property var callbackFunction

    anchors {
        leftMargin: 15
        topMargin: 10
    }
    height: 15
    width: 15
    radius: 15
    color: bgColor
    Text {
        anchors.centerIn: parent
        text: bText
        color: actionButtonClickPoint.containsMouse ? textColor : bgColor
        font.pixelSize: 10
    }
    MouseArea {
        id: actionButtonClickPoint
        hoverEnabled: true
        anchors.fill: parent
        onClicked: callbackFunction()
    }
}
