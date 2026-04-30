import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects


// Card icon
Image {
    id: cardIcon
    property string location: "NULL"

    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height
    width: parent.height
    source: cardIcon.location
    fillMode: Image.PreserveAspectFit
    opacity: 0.50
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: cardIcon.height
            height: cardIcon.height
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 1.0; color: "white" }
            }
        }
    }
}