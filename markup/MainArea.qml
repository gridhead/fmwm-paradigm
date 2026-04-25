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
        radius: 16
        samples: 32
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
                        { icon: "../assets/icon/fstd.svg", idx: 1 },
                        { icon: "../assets/icon/atom.svg", idx: 2 },
                        { icon: "../assets/icon/spin.svg", idx: 3 },
                        { icon: "../assets/icon/labs.svg", idx: 4 },
                        { icon: "../assets/icon/call.svg", idx: 5 }
                    ]

                    Rectangle {
                        Layout.alignment: Qt.AlignHCenter
                        width: 40
                        height: 40
                        radius: 20
                        color: modelData.idx === mainArea.selectedIcon
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
                            onClicked: mainArea.selectedIcon = modelData.idx
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
