import QtQuick
import QtQuick.Layouts

Rectangle {
    id: iconActn
    property string location: "NULL"
    property bool   selected: false
    property string textName: "NULL"
    signal clicked()

    Layout.alignment: Qt.AlignHCenter
    width: 40
    height: 40
    radius: 20
    color: iconActn.selected
        ? Qt.rgba(255, 255, 255, 0.25)
        : iconPick.containsMouse
            ? Qt.rgba(1, 1, 1, 0.08)
            : "transparent"

    Behavior on color { ColorAnimation { duration: 150 } }

    IconUnit {
        anchors.centerIn: parent
        location: iconActn.location
    }

    MouseArea {
        id: iconPick
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: iconActn.clicked()
    }

    // Icon text
    Rectangle {
        anchors.left: parent.right
        anchors.leftMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        width: iconText.implicitWidth + 30
        height: 30
        radius: 15
        color: Qt.rgba(0, 0, 0, 0.75)
        visible: iconPick.containsMouse
        opacity: iconPick.containsMouse ? 1 : 0
        z: 100

        Behavior on opacity { NumberAnimation { duration: 150 } }

        Text {
            id: iconText
            anchors.centerIn: parent
            text: iconActn.textName
            color: "white"
            font.pixelSize: 15
        }
    }
}