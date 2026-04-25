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

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: Qt.rgba(128, 128, 128, 0.25)
            topLeftRadius: mainArea.windowRadius
            bottomLeftRadius: mainArea.windowRadius
            topRightRadius: 0
            bottomRightRadius: 0

            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                spacing: 5

                Image {
                    Layout.alignment: Qt.AlignHCenter
                    source: "../assets/icon/hero.svg"
                    width: 30
                    height: 30
                    sourceSize.width: 30
                    sourceSize.height: 30
                    fillMode: Image.PreserveAspectFit
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
                            unit: 2 },
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

                    Rectangle {
                        Layout.alignment: Qt.AlignHCenter
                        width: 40
                        height: 40
                        radius: 20
                        color: modelData.unit === mainArea.selectedIcon
                            ? Qt.rgba(255, 255, 255, 0.25)
                            : iconPick.containsMouse
                                ? Qt.rgba(1, 1, 1, 0.08)
                                : "transparent"

                        Behavior on color { ColorAnimation { duration: 150 } }

                        Image {
                            anchors.centerIn: parent
                            source: modelData.icon
                            width: 30
                            height: 30
                            sourceSize.width: 30
                            sourceSize.height: 30
                            fillMode: Image.PreserveAspectFit
                        }

                        MouseArea {
                            id: iconPick
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: mainArea.selectedIcon = modelData.unit
                        }

                        // Icon labels
                        Rectangle {
                            anchors.left: parent.right
                            anchors.leftMargin: 15
                            anchors.verticalCenter: parent.verticalCenter
                            width: iconTool.implicitWidth + 30
                            height: 30
                            radius: 15
                            color: Qt.rgba(0, 0, 0, 0.75)
                            visible: iconPick.containsMouse
                            opacity: iconPick.containsMouse ? 1 : 0
                            z: 100

                            Behavior on opacity { NumberAnimation { duration: 150 } }

                            Text {
                                id: iconTool
                                anchors.centerIn: parent
                                text: modelData.name
                                color: "white"
                                font.pixelSize: 15
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
        }
    }
}
