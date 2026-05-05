import QtQuick
import Qt5Compat.GraphicalEffects

// Blurry backdrop
Rectangle {
    id: blurDrop
    property bool darkMode: true
    property var  blurItem: null
    property int  windowRadius: 0

    anchors.fill: parent
    color: "transparent"
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: blurDrop.width
            height: blurDrop.height
            radius: blurDrop.windowRadius
        }
    }

    ShaderEffectSource {
        id: blurSrce
        anchors.fill: parent
        sourceItem: blurDrop.blurItem
        live: true
        visible: false
    }

    GaussianBlur {
        anchors.fill: parent
        source: blurSrce
        radius: 10
        samples: 20
    }

    Rectangle {
        anchors.fill: parent
        color: blurDrop.darkMode ? Qt.rgba(0, 0, 0, 0.50) : Qt.rgba(1, 1, 1, 0.50)
    }
}