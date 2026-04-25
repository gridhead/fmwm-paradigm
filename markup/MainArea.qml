import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects


Item {
    id: mainArea
    property int  selectedIcon: 0
    property int  windowRadius: 0
    property bool darkMode: true

    // Backdrop
    Image {
        id: backSnap
        anchors.fill: parent
        source: mainArea.darkMode
            ? "../assets/wall/fc44_dark.png"
            : "../assets/wall/fc44_lite.png"
        fillMode: Image.PreserveAspectCrop
        visible: false
    }

    // Blur backdrop
    GaussianBlur {
        id: blurSnap
        anchors.fill: backSnap
        source: backSnap
        radius: 15
        samples: 30
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: blurSnap.width
                height: blurSnap.height
                radius: mainArea.windowRadius
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        SideArea {
            selectedIcon: mainArea.selectedIcon
            windowRadius: mainArea.windowRadius
            onIconSelected: (unit) => mainArea.selectedIcon = unit
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
        }
    }
}
