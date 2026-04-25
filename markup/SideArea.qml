import QtQuick
import QtQuick.Layouts

Rectangle {
    id: sideArea
    property int selectedIcon: 0
    property int windowRadius: 0
    signal iconSelected(int unit)

    Layout.preferredWidth: 50
    Layout.fillHeight: true
    color: Qt.rgba(128, 128, 128, 0.25)
    topLeftRadius: sideArea.windowRadius
    bottomLeftRadius: sideArea.windowRadius
    topRightRadius: 0
    bottomRightRadius: 0

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.bottomMargin: 5
        spacing: 5

        IconUnit {
            location: "../assets/icon/hero.svg"
        }

        Item { Layout.fillHeight: true }

        Repeater {
            model: [
                {
                    icon: "../assets/icon/fstd.svg",
                    name: "Official Editions",
                    unit: 1
                },
                {
                    icon: "../assets/icon/atom.svg",
                    name: "Atomic Desktops",
                    unit: 2
                },
                {
                    icon: "../assets/icon/spin.svg",
                    name: "Fedora Spins",
                    unit: 3
                },
                {
                    icon: "../assets/icon/labs.svg",
                    name: "Fedora Labs",
                    unit: 4
                },
                {
                    icon: "../assets/icon/pick.svg",
                    name: "Custom Image",
                    unit: 5
                },
                {
                    icon: "../assets/icon/call.svg",
                    name: "Information",
                    unit: 6
                }
            ]

            IconActn {
                location: modelData.icon
                textName: modelData.name
                selected: modelData.unit === sideArea.selectedIcon
                onClicked: sideArea.iconSelected(modelData.unit)
            }
        }
    }
}