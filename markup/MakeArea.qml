import QtQuick
import QtQuick.Layouts

Item {
    id: makeArea
    property string headText: "NULL"
    property string descText: "NULL"
    property string iconText: "NULL"
    property bool   darkMode: true
    signal goBack()
    signal startWrite()

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Text {
            text: makeArea.headText
            color: makeArea.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
            font.pixelSize: 20
            font.weight: Font.Normal
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: Math.min(makeArea.height * 0.75, Math.max(diskList.implicitHeight, versList.implicitHeight) + 20)
            spacing: 10

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 1
                spacing: 10

                Text {
                    text: "Select your storage drive"
                    color: makeArea.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
                    font.pixelSize: 14
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: makeArea.darkMode ? Qt.rgba(1.00, 1.00, 1.00, 0.25) : Qt.rgba(0.00, 0.00, 0.00, 0.25)
                }

                Flickable {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    contentHeight: diskList.implicitHeight
                    clip: true

                    ColumnLayout {
                        id: diskList
                        property int tookDisk: -1
                        width: parent.width
                        spacing: 10

                        Repeater {
                            model: [
                                { head: "KINGSTON USB Drive", desc: "16 GB • /dev/sda" },
                                { head: "SMASHNUG USB Drive", desc: "24 GB • /dev/sdb" },
                                { head: "ELEMENTS USB Drive", desc: "32 GB • /dev/sdc" },
                                { head: "PASSPORT USB Drive", desc: "48 GB • /dev/sdd" },
                                { head: "SANTDISK USB Drive", desc: "16 GB • /dev/sde" },
                                { head: "COARSEIR USB Drive", desc: "24 GB • /dev/sdf" },
                                { head: "FOURDATA USB Drive", desc: "32 GB • /dev/sdg" },
                                { head: "NORTHERN USB Drive", desc: "48 GB • /dev/sdh" },
                            ]

                            DiskUnit {
                                textHead: modelData.head
                                textDesc: modelData.desc
                                darkMode: makeArea.darkMode
                                selected: index === diskList.tookDisk
                                onUnitClicked: diskList.tookDisk = index
                            }
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 1
                spacing: 10

                Text {
                    text: "Select Fedora Linux release"
                    color: makeArea.darkMode ? Qt.rgba(0.75, 0.75, 0.75, 1) : Qt.rgba(0.25, 0.25, 0.25, 1)
                    font.pixelSize: 14
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: makeArea.darkMode ? Qt.rgba(1.00, 1.00, 1.00, 0.25) : Qt.rgba(0.00, 0.00, 0.00, 0.25)
                }

                Flickable {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    contentHeight: versList.implicitHeight
                    clip: true

                    ColumnLayout {
                        id: versList
                        property int tookVers: -1
                        width: parent.width
                        spacing: 10

                        Repeater {
                            model: [
                                { head: "Fedora Linux 45", desc: "Testing release", arch: "x86_64" },
                                { head: "Fedora Linux 45", desc: "Testing release", arch: "ARMv9" },
                                { head: "Fedora Linux 44", desc: "Latest stable release", arch: "x86_64" },
                                { head: "Fedora Linux 44", desc: "Latest stable release", arch: "ARMv9" },
                                { head: "Fedora Linux 43", desc: "Previous stable release", arch: "x86_64" },
                                { head: "Fedora Linux 43", desc: "Previous stable release", arch: "ARMv9" },
                                { head: "Fedora Linux 42", desc: "Impending end of life", arch: "x86_64" },
                                { head: "Fedora Linux 42", desc: "Impending end of life", arch: "ARMv9" },
                            ]

                            VersUnit {
                                textHead: modelData.head
                                textDesc: modelData.desc
                                textArch: modelData.arch
                                darkMode: makeArea.darkMode
                                selected: index === versList.tookVers
                                onUnitClicked: versList.tookVers = index
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: makeArea.darkMode ? Qt.rgba(1.00, 1.00, 1.00, 0.25) : Qt.rgba(0.00, 0.00, 0.00, 0.25)
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Rectangle {
                Layout.preferredWidth: backIcon.width + backText.implicitWidth + 15
                Layout.preferredHeight: 30
                radius: 15
                color: backHand.containsMouse
                    ? (makeArea.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
                    : (makeArea.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

                Behavior on color { ColorAnimation { duration: 150 } }

                MouseArea {
                    id: backHand
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: makeArea.goBack()
                }

                Row {
                    anchors.centerIn: parent
                    spacing: 7.5

                    IconUnit {
                        id: backIcon
                        width: 25; height: 25
                        location: "../assets/icon/mono/prev.svg"
                        darkMode: makeArea.darkMode
                    }

                    Text {
                        id: backText
                        anchors.verticalCenter: parent.verticalCenter
                        rightPadding: 5
                        text: "Return"
                        color: makeArea.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
                        font.pixelSize: 14
                    }
                }
            }

            Item { Layout.fillWidth: true }

            Rectangle {
                Layout.preferredWidth: makeText.implicitWidth + makeIcon.width + 15
                Layout.preferredHeight: 30
                radius: 15
                color: makeHand.containsMouse
                    ? (makeArea.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
                    : (makeArea.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

                Behavior on color { ColorAnimation { duration: 150 } }

                MouseArea {
                    id: makeHand
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: makeArea.startWrite()
                }

                Row {
                    anchors.centerIn: parent
                    spacing: 7.5

                    Text {
                        id: makeText
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: 5
                        text: "Create"
                        color: makeArea.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
                        font.pixelSize: 14
                    }

                    IconUnit {
                        id: makeIcon
                        width: 25; height: 25
                        location: "../assets/icon/mono/next.svg"
                        darkMode: makeArea.darkMode
                    }
                }
            }
        }
    }
}
