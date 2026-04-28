import QtQuick
import QtQuick.Layouts

Rectangle {
    id: sideArea
    property int  selectedIcon: 0
    property int  windowRadius: 0
    property bool darkMode: true
    signal iconSelected(int unit)

    Layout.preferredWidth: 50
    Layout.fillHeight: true
    color: sidePick.hovered
        ? (sideArea.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
        : (sideArea.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.50) : Qt.rgba(0.8, 0.8, 0.8, 0.50))
    topLeftRadius: sideArea.windowRadius
    bottomLeftRadius: sideArea.windowRadius
    topRightRadius: 0
    bottomRightRadius: 0

    Behavior on color { ColorAnimation { duration: 150 } }

    HoverHandler {
        id: sidePick
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.bottomMargin: 5
        spacing: 5

        IconUnit {
            location: "../assets/icon/mono/hero.svg"
            darkMode: sideArea.darkMode
        }

        Item { Layout.fillHeight: true }

        Repeater {
            model: [
                {
                    icon: "../assets/icon/mono/fstd.svg",
                    name: "Official Editions",
                    unit: 1
                },
                {
                    icon: "../assets/icon/mono/atom.svg",
                    name: "Atomic Desktops",
                    unit: 2
                },
                {
                    icon: "../assets/icon/mono/spin.svg",
                    name: "Fedora Spins",
                    unit: 3
                },
                {
                    icon: "../assets/icon/mono/labs.svg",
                    name: "Fedora Labs",
                    unit: 4
                },
                {
                    icon: "../assets/icon/mono/pick.svg",
                    name: "Custom Image",
                    unit: 5
                },
                {
                    icon: "../assets/icon/mono/call.svg",
                    name: "Information",
                    unit: 6
                }
            ]

            IconActn {
                location: modelData.icon
                textName: modelData.name
                selected: modelData.unit === sideArea.selectedIcon
                darkMode: sideArea.darkMode
                onClicked: sideArea.iconSelected(modelData.unit)
            }
        }
    }
}