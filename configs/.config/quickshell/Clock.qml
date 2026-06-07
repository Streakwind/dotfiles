import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root

    color: "transparent"

    WlrLayershell.layer: WlrLayer.Background
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Rectangle {
        id: widget

        width: 240
        height: 120
        radius: 20
        color: "transparent"

        x: Screen.width / 2 - width / 2
        y: Screen.height / 2 - height / 2

        Column {
            anchors.centerIn: parent
            spacing: 4

            Text {
                id: clockText

                anchors.horizontalCenter: parent.horizontalCenter

                color: "white"
                font.pixelSize: 42
                font.family: "JetBrains Mono"

                text: Qt.formatTime(new Date(), "HH:mm")
            }

            Text {
                id: dateText

                anchors.horizontalCenter: parent.horizontalCenter

                color: "#cccccc"
                font.pixelSize: 18
                font.family: "JetBrains Mono"

                text: Qt.formatDate(new Date(), "MM/dd")
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true

            onTriggered: {
                let now = new Date()

                clockText.text = Qt.formatTime(now, "HH:mm")
                dateText.text = Qt.formatDate(now, "MM/dd")
            }
        }

        MouseArea {
            anchors.fill: parent

            drag.target: parent
            cursorShape: Qt.OpenHandCursor

            onPressed: {
                cursorShape = Qt.ClosedHandCursor
            }

            onReleased: {
                cursorShape = Qt.OpenHandCursor
            }
        }
    }
}