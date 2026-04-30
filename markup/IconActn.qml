import QtQuick
import QtQuick.Layouts

Rectangle {
    id: iconActn
    property string location: "NULL"
    property bool   selected: false
    property string textName: "NULL"
    property bool   darkMode: true
    signal clicked()

    Layout.alignment: Qt.AlignHCenter
    width: 40
    height: 40
    radius: 20
    color: iconActn.selected
        ? Qt.rgba(0.5, 0.5, 0.5, 0.50)
        : iconPick.containsMouse
            ? Qt.rgba(0.5, 0.5, 0.5, 0.25)
            : "transparent"

    Behavior on color { ColorAnimation { duration: 150 } }

    IconUnit {
        anchors.centerIn: parent
        location: iconActn.location
        darkMode: iconActn.darkMode
    }

    WorkHand {
        id: iconPick
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
        color: iconActn.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75)
        visible: iconPick.containsMouse
        opacity: iconPick.containsMouse ? 1 : 0
        z: 100

        Behavior on opacity { NumberAnimation { duration: 150 } }

        Text {
            id: iconText
            anchors.centerIn: parent
            text: iconActn.textName
            color: iconActn.darkMode ? Qt.rgba(0.8, 0.8, 0.8, 1.00) : Qt.rgba(0.2, 0.2, 0.2, 1.00)
            font.pixelSize: 15
        }
    }
}