import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Rectangle {
    id: dropUnit
    property string textHead: "NULL"
    property string textDesc: "NULL"
    property string unitIcon: "NULL"
    property bool   darkMode: true

    Layout.fillWidth: true
    Layout.preferredHeight: 80
    radius: 10
    clip: true
    color: dropHand.hovered
        ? (dropUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
        : (dropUnit.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

    Behavior on color { ColorAnimation { duration: 150 } }

    // Card pick
    HoverHandler {
        id: dropHand
        cursorShape: Qt.PointingHandCursor
    }

    // Card icon
    Image {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height
        width: parent.height
        source: dropUnit.unitIcon
        fillMode: Image.PreserveAspectFit
        opacity: 0.50
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: dropUnit.height
                height: dropUnit.height
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: "transparent" }
                    GradientStop { position: 1.0; color: "white" }
                }
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