import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects


Item {
    id: mainArea
    property int  selectedIcon: 0
    property int  windowRadius: 0
    property bool darkMode: true
    property int  wallUnit: Math.floor(Math.random() * 19) + 26

    // Backdrop
    Image {
        id: backSnap
        anchors.fill: parent
        source: mainArea.darkMode
            ? "../assets/wall/fc" + mainArea.wallUnit + "_dark.png"
            : "../assets/wall/fc" + mainArea.wallUnit + "_lite.png"
        fillMode: Image.PreserveAspectCrop
        visible: false
    }

    // Blur backdrop
    GaussianBlur {
        id: blurSnap
        anchors.fill: backSnap
        source: backSnap
        radius: 20
        samples: 40
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
            z: 10
            selectedIcon: mainArea.selectedIcon
            windowRadius: mainArea.windowRadius
            onIconSelected: (unit) => mainArea.selectedIcon = (mainArea.selectedIcon === unit ? 0 : unit)
            darkMode: mainArea.darkMode
        }

        BodyArea {
            selectedIcon: mainArea.selectedIcon
            darkMode: mainArea.darkMode
            windowRadius: mainArea.windowRadius
        }
    }
}
