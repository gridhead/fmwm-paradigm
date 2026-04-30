import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: skeleton
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "transparent"

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
        color: "transparent"
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
                    width: 30
                    height: 30
                    radius: 15
                    color: darkModePick.containsMouse
                        ? (darkMode ? Qt.rgba(1, 1, 1, 0.25) : Qt.rgba(0, 0, 0, 0.25))
                        : "transparent"
                    IconUnit {
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                        location: skeleton.darkMode
                            ? "../assets/icon/mono/skel_lite.svg"
                            : "../assets/icon/mono/skel_dark.svg"
                        darkMode: skeleton.darkMode
                        opacity: darkModePick.containsMouse ? 1.00 : 0.50
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
                    width: 30
                    height: 30
                    radius: 15
                    color: minimizePick.containsMouse
                        ? (darkMode ? Qt.rgba(1, 1, 1, 0.25) : Qt.rgba(0, 0, 0, 0.25))
                        : "transparent"
                    IconUnit {
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                        location: "../assets/icon/mono/skel_mini.svg"
                        darkMode: skeleton.darkMode
                        opacity: minimizePick.containsMouse ? 1.00 : 0.50
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
                    width: 30
                    height: 30
                    radius: 15
                    color: maximizePick.containsMouse
                        ? (darkMode ? Qt.rgba(1, 1, 1, 0.25) : Qt.rgba(0, 0, 0, 0.25))
                        : "transparent"
                    IconUnit {
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                        location: skeleton.visibility === ApplicationWindow.Maximized
                            ? "../assets/icon/mono/skel_rest.svg"
                            : "../assets/icon/mono/skel_maxi.svg"
                        darkMode: skeleton.darkMode
                        opacity: maximizePick.containsMouse ? 1.00 : 0.50
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
                    width: 30
                    height: 30
                    radius: 15
                    color: concludePick.containsMouse ? Qt.rgba(0.8, 0.2, 0.2, 1.00) : "transparent"
                    IconUnit {
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                        location: "../assets/icon/mono/skel_shut.svg"
                        darkMode: skeleton.darkMode
                        opacity: concludePick.containsMouse ? 1.00 : 0.50
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