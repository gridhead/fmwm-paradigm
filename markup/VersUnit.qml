import QtQuick
import QtQuick.Layouts

Rectangle {
    id: versUnit
    property string textHead: "NULL"
    property string textDesc: "NULL"
    property string textArch: "NULL"
    property bool   darkMode: true
    property bool   selected: false
    signal unitClicked()

    Layout.fillWidth: true
    Layout.preferredHeight: 90
    radius: 10
    clip: true
    color: versUnit.selected
        ? (versUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
        : versHand.containsMouse
            ? (versUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.50) : Qt.rgba(0.8, 0.8, 0.8, 0.50))
            : (versUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

    Behavior on color { ColorAnimation { duration: 150 } }

    WorkHand {
        id: versHand
        onClicked: versUnit.unitClicked()
    }

    // Card icon
    CardIcon {
        location: "../assets/icon/tint/vers.png"
    }

    Rectangle {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 10
        width: archLine.width + 10
        height: archLine.height + 5
        radius: 5
        color: versUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75)

        Row {
            id: archLine
            anchors.centerIn: parent
            spacing: 5

            IconUnit {
                width: 15; height: 15
                anchors.verticalCenter: parent.verticalCenter
                location: "../assets/icon/mono/chip.svg"
                darkMode: versUnit.darkMode
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: versUnit.textArch
                color: versUnit.darkMode ? Qt.rgba(0.6, 0.6, 0.6, 1.0) : Qt.rgba(0.4, 0.4, 0.4, 1.0)
                font.pixelSize: 10
            }
        }
    }

    // Card text
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        Text {
            Layout.fillWidth: true
            text: versUnit.textHead
            color: versUnit.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
            font.pixelSize: 16
            font.weight: Font.Bold
        }

        Item { Layout.fillHeight: true }

        ColumnLayout {
            Layout.fillWidth: parent
            // anchors.margins: 10
            spacing: 2.5

            Text {
                Layout.fillWidth: true
                text: versUnit.textArch == "x86_64" ? "For general purpose desktop operating usage" : "For embedded devices and efficient computation"
                color: versUnit.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
                font.pixelSize: 12
                font.italic: false
            }

            Text {
                Layout.fillWidth: true
                text: versUnit.textDesc
                color: versUnit.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
                font.pixelSize: 12
                font.italic: true
            }
        }
    }
}
