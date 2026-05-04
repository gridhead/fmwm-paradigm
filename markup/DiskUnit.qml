import QtQuick
import QtQuick.Layouts

Rectangle {
    id: diskUnit
    property string textHead: "NULL"
    property string textDesc: "NULL"
    property bool   darkMode: true
    property bool   selected: false
    signal unitClicked()

    Layout.fillWidth: true
    Layout.preferredHeight: 90
    radius: 10
    clip: true
    color: diskUnit.selected
        ? (diskUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
        : diskHand.containsMouse
            ? (diskUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.50) : Qt.rgba(0.8, 0.8, 0.8, 0.50))
            : (diskUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

    Behavior on color { ColorAnimation { duration: 150 } }

    WorkHand {
        id: diskHand
        onClicked: diskUnit.unitClicked()
    }

    // Card icon
    CardIcon {
        location: "../assets/icon/tint/usbp.png"
    }

    // Card text
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        Text {
            Layout.fillWidth: true
            text: diskUnit.textHead
            color: diskUnit.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
            font.pixelSize: 16
            font.weight: Font.Bold
        }

        Item { Layout.fillHeight: true }

        Text {
            Layout.fillWidth: true
            text: diskUnit.textDesc
            color: diskUnit.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
            font.pixelSize: 12
        }
    }
}
