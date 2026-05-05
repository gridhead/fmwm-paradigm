import QtQuick
import QtQuick.Layouts

ColumnLayout {
    id: infoColl
    property bool   darkMode: false
    property string editName: "NULL"
    property string diskName: "NULL"
    property string versName: "NULL"

    spacing: 5

    Text {
        Layout.fillWidth: true
        text: "Edition. " + infoColl.editName
        color: infoColl.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
        font.pixelSize: 12
    }

    Text {
        Layout.fillWidth: true
        text: "Storage. " + infoColl.diskName
        color: infoColl.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
        font.pixelSize: 12
    }

    Text {
        Layout.fillWidth: true
        text: "Release. " + infoColl.versName
        color: infoColl.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
        font.pixelSize: 12
    }
}