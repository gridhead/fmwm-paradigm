import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: skeleton
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "transparent"

    property color  factorColour: "#0D1117"
    property string windowHeader: "Untitled"
    property int    headerHeight: 40
    property int    windowRadius: skeleton.visibility === ApplicationWindow.Maximized ? 0 : 15
    property bool   darkMode: systemTheme ? systemTheme.systemIsDark : false

    // Keep up with the system theme changes
    Connections {
        target: typeof systemTheme !== "undefined" && systemTheme !== null ? systemTheme : null
        function onThemeChanged() {
            skeleton.darkMode = systemTheme.systemIsDark
        }
    }

    default property alias dataContents: dataArea.data

    Rectangle {
        anchors.fill: parent
        radius: skeleton.windowRadius
        color: skeleton.factorColour
        border.color: Qt.rgba(1, 1, 1, 0.1)
        clip: true

        Item {
            id: dataArea
            anchors.fill: parent
        }

        Item {
            id: headArea
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: skeleton.headerHeight

            DragHandler {
                target: null
                onActiveChanged: {
                    if (active) skeleton.startSystemMove()
                }
            }

            TapHandler {
                acceptedButtons: Qt.LeftButton
                onDoubleTapped: {
                    if (skeleton.visibility === ApplicationWindow.Maximized)
                        skeleton.showNormal()
                    else
                        skeleton.showMaximized()
                }
            }

            Row {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                spacing: 5

                // Themer
                Rectangle {
                    width: 30; height: 30; radius: 15
                    color: darkModePick.containsMouse ? Qt.rgba(1, 1, 1, 0.1) : "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: skeleton.darkMode ? "☀" : "☾"
                        color: Qt.rgba(1, 1, 1, 0.5)
                        font.pixelSize: 15
                    }
                    MouseArea {
                        id: darkModePick
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: skeleton.darkMode = !skeleton.darkMode
                    }
                }

                // Minimize
                Rectangle {
                    width: 30; height: 30; radius: 15
                    color: minimizePick.containsMouse ? Qt.rgba(1, 1, 1, 0.1) : "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "─"
                        color: Qt.rgba(1, 1, 1, 0.5)
                        font.pixelSize: 15
                    }
                    MouseArea {
                        id: minimizePick
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: skeleton.showMinimized()
                    }
                }

                // Maximize
                Rectangle {
                    width: 30; height: 30; radius: 15
                    color: maximizePick.containsMouse ? Qt.rgba(1, 1, 1, 0.1) : "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: skeleton.visibility === ApplicationWindow.Maximized ? "❐" : "□"
                        color: Qt.rgba(1, 1, 1, 0.5)
                        font.pixelSize: 15
                    }
                    MouseArea {
                        id: maximizePick
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if (skeleton.visibility === ApplicationWindow.Maximized)
                                skeleton.showNormal()
                            else
                                skeleton.showMaximized()
                        }
                    }
                }

                // Conclude
                Rectangle {
                    width: 30; height: 30; radius: 15
                    color: concludePick.containsMouse ? "#CC3333" : "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: "✕"
                        color: concludePick.containsMouse ? "white" : Qt.rgba(1, 1, 1, 0.5)
                        font.pixelSize: 15
                    }
                    MouseArea {
                        id: concludePick
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: skeleton.close()
                    }
                }
            }
        }
    }
}