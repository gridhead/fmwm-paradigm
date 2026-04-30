import QtQuick
import QtQuick.Layouts

Rectangle {
    id: sepaLine
    property bool darkMode: true

    Layout.fillWidth: true
    Layout.preferredHeight: 1
    color: darkMode ? Qt.rgba(1.00, 1.00, 1.00, 0.25) : Qt.rgba(0.00, 0.00, 0.00, 0.25)
}