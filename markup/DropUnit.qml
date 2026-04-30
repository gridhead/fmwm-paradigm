import QtQuick
import QtQuick.Layouts

Rectangle {
    id: dropUnit
    property string textHead: "NULL"
    property string textDesc: "NULL"
    property string unitIcon: "NULL"
    property bool   darkMode: true
    signal unitClicked()

    Layout.fillWidth: true
    Layout.preferredHeight: 80
    radius: 10
    clip: true
    color: dropHand.containsMouse
        ? (dropUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
        : (dropUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

    Behavior on color { ColorAnimation { duration: 150 } }

    WorkHand {
        id: dropHand
        onClicked: dropUnit.unitClicked()
    }

    // Card icon
    CardIcon {
        location: dropUnit.unitIcon
    }

    // Card text
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        Text {
            Layout.fillWidth: true
            text: dropUnit.textHead
            color: dropUnit.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
            font.pixelSize: 16
            font.weight: Font.Bold
        }

        Item { Layout.fillHeight: true }

        Text {
            Layout.fillWidth: true
            text: dropUnit.textDesc
            color: dropUnit.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
            font.pixelSize: 12
            wrapMode: Text.WordWrap
        }
    }
}