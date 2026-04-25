import QtQuick
import QtQuick.Layouts

Image {
    id: iconUnit
    property string location: ""
    property string name: ""

    source: iconUnit.location
    width: 30
    height: 30
    sourceSize.width: 30
    sourceSize.height: 30
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    fillMode: Image.PreserveAspectFit
}
