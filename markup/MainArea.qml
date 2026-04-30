import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Item {
    id: mainArea
    property int  selectedIcon: 0
    property int  windowRadius: 0
    property bool darkMode: true

    Rectangle {
        anchors.fill: parent
        radius: mainArea.windowRadius
        gradient: Gradient {
            GradientStop { position: 0.0; color: mainArea.darkMode ? Qt.rgba(0.20, 0.25, 0.25, 1) : Qt.rgba(0.60, 0.65, 0.65, 1) }
            GradientStop { position: 1.0; color: mainArea.darkMode ? Qt.rgba(0.40, 0.45, 0.45, 1) : Qt.rgba(0.40, 0.45, 0.45, 1) }
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
