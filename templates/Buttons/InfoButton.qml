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

Rectangle {
    id: infoButton

    property alias title: buttonText.text

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
        topMargin: 20
        bottomMargin: 0
        margins: 10
    }

    height: 15
    radius: itemRadius / 2
    color: "transparent"
    Row {
        anchors.fill: parent
        spacing: 5
        layoutDirection: Qt.LeftToRight
        padding: 4
        Text {
            id: buttonText
            anchors {
                verticalCenter: parent.verticalCenter
                bottomMargin: 0
                margins: 10
            }
            color: "#5c5c5c"
//            font.bold: selected
        }
    }
}
