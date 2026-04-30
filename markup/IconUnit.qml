import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item {
    id: iconUnit
    property string location: "NULL"
    property bool   darkMode: true

    width: 30
    height: 30
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

    Image {
        id: iconData
        anchors.fill: parent
        source: iconUnit.location
        sourceSize.width: 100
        sourceSize.height: 100
        fillMode: Image.PreserveAspectFit
        visible: false
    }

    ColorOverlay {
        anchors.fill: iconData
        source: iconData
        color: iconUnit.darkMode ? Qt.rgba(0.8, 0.8, 0.8, 1.00) : Qt.rgba(0.2, 0.2, 0.2, 1.00)
    }
}