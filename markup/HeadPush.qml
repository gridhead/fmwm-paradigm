import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: headPush
    property bool   darkMode: true
    property string location: "NULL"
    property color  hangTint: headPush.darkMode ? Qt.rgba(1, 1, 1, 0.25) : Qt.rgba(0, 0, 0, 0.25)
    signal unitClicked()

    width: 30
    height: 30
    radius: 15
    color: pushPick.containsMouse ? headPush.hangTint : "transparent"
    IconUnit {
        anchors.centerIn: parent
        width: 20
        height: 20
        location: headPush.location
        darkMode: darkMode
        opacity: pushPick.containsMouse ? 1.00 : 0.50
    }
    WorkHand {
        id: pushPick
        onClicked: headPush.unitClicked()
    }
}