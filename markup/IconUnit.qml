import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Image {
    id: iconUnit
    property string location: "NULL"
    property bool   darkMode: true

    source: iconUnit.location
    width: 30
    height: 30
    sourceSize.width: 30
    sourceSize.height: 30
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    fillMode: Image.PreserveAspectFit
    layer.enabled: true
    layer.effect: ColorOverlay {
        color: iconUnit.darkMode ? Qt.rgba(0.8, 0.8, 0.8, 1.00) : Qt.rgba(0.2, 0.2, 0.2, 1.00)
    }
}
