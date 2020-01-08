/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Window 2.0

ApplicationWindow {
    id: window
    width: Screen.width
    height: Screen.height
    visible: true
    title: "Qt Quick Controls 2 - Imagine Style Example: Automotive"

    //    readonly property int fontSizeExtraSmall: Qt.application.font.pixelSize * 0.8

    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
        console.log(height, " ", Screen.height)
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    Frame {
        id: frame
        anchors.fill: parent
        anchors.margins: Screen.height / 100

        RowLayout {
            id: mainRowLayout
            anchors.fill: parent
            anchors.margins: Screen.height / 100
            spacing: 10

            Container {
                id: leftTabBar

                currentIndex: 1

                Layout.fillWidth: false
                Layout.fillHeight: true

                ButtonGroup {
                    buttons: columnLayout.children
                }

                contentItem: ColumnLayout {
                    id: columnLayout
                    spacing: 3

                    Repeater {
                        model: leftTabBar.contentModel
                    }
                }

                FeatureButton {
                    id: navigationFeatureButton
                    text: qsTr("Navigation")
                    icon.name: "navigation"
                    Layout.fillHeight: true
                    checked: true
                }

                FeatureButton {
                    text: qsTr("Music")
                    icon.name: "music"
                    Layout.fillHeight: true
                }

                FeatureButton {
                    text: qsTr("Message")
                    icon.name: "message"
                    Layout.fillHeight: true
                }

                FeatureButton {
                    text: qsTr("Command")
                    icon.name: "command"
                    Layout.fillHeight: true
                }

                FeatureButton {
                    text: qsTr("Settings")
                    icon.name: "settings"
                    Layout.fillHeight: true
                }

            }

            GridLayout {
                id: gridLayout
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.fillHeight: true
                Layout.fillWidth: true
                rows: 5
                columns: 6

                Pane {
                    id: todoContainerForMusic
                    Layout.row: 1
                    Layout.column: 1
                    Layout.rowSpan: 4
                    Layout.columnSpan: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredWidth: 150
                }

                //TODO make it as redrawable main screen
                //next feature is a dash/reverse camera
                PageWithMapMapboxGL {
                    Layout.row: 1
                    Layout.column: 2
                    Layout.rowSpan: 4
                    Layout.columnSpan: 5
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Pane {
                    id: todoContainerForClimateControlPanel
                    Layout.row: 5
                    Layout.column: 1
                    Layout.rowSpan: 1
                    Layout.columnSpan: 6
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                }


            }


        }
    }

}


