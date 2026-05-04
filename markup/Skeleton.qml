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
                HeadPush {
                    darkMode: skeleton.darkMode
                    location: skeleton.darkMode ? "../assets/icon/mono/skel_lite.svg" : "../assets/icon/mono/skel_dark.svg"
                    hangTint: skeleton.darkMode ? Qt.rgba(1, 1, 1, 0.25) : Qt.rgba(0, 0, 0, 0.25)
                    onUnitClicked: skeleton.darkMode = !skeleton.darkMode
                }

                // Minimize
                HeadPush {
                    darkMode: skeleton.darkMode
                    location: "../assets/icon/mono/skel_mini.svg"
                    hangTint: skeleton.darkMode ? Qt.rgba(1, 1, 1, 0.25) : Qt.rgba(0, 0, 0, 0.25)
                    onUnitClicked: skeleton.showMinimized()
                }

                // Maximize
                HeadPush {
                    darkMode: skeleton.darkMode
                    location: skeleton.visibility === ApplicationWindow.Maximized ? "../assets/icon/mono/skel_rest.svg" : "../assets/icon/mono/skel_maxi.svg"
                    hangTint: skeleton.darkMode ? Qt.rgba(1, 1, 1, 0.25) : Qt.rgba(0, 0, 0, 0.25)
                    onUnitClicked: {
                        if (skeleton.visibility === ApplicationWindow.Maximized)
                            skeleton.showNormal()
                        else
                            skeleton.showMaximized()
                    }
                }

                // Conclude
                HeadPush {
                    darkMode: skeleton.darkMode
                    location: "../assets/icon/mono/skel_shut.svg"
                    hangTint: Qt.rgba(0.8, 0.2, 0.2, 1.00)
                    onUnitClicked: skeleton.close()
                }
            }
        }
    }

    // Edge resize
    MouseArea {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        cursorShape: Qt.SizeVerCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.TopEdge)
    }

    MouseArea {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        cursorShape: Qt.SizeVerCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.BottomEdge)
    }

    MouseArea {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 2
        cursorShape: Qt.SizeHorCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.LeftEdge)
    }

    MouseArea {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 2
        cursorShape: Qt.SizeHorCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.RightEdge)
    }

    // Corner resize
    MouseArea {
        anchors.top: parent.top
        anchors.left: parent.left
        width: 2; height: 2
        cursorShape: Qt.SizeFDiagCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.TopEdge | Qt.LeftEdge)
    }

    MouseArea {
        anchors.top: parent.top
        anchors.right: parent.right
        width: 2; height: 2
        cursorShape: Qt.SizeBDiagCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.TopEdge | Qt.RightEdge)
    }

    MouseArea {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 2; height: 2
        cursorShape: Qt.SizeBDiagCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
    }

    MouseArea {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 2; height: 2
        cursorShape: Qt.SizeFDiagCursor
        enabled: skeleton.visibility !== ApplicationWindow.Maximized
        onPressed: skeleton.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
    }
}