import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Rectangle {
    id: confView
    property string headText: "NULL"
    property string diskText: "NULL"
    property string versText: "NULL"
    property bool   darkMode: true
    property var    blurItem: null
    property int    windowRadius: 0
    signal conveyReject()
    signal conveyAccept()

    anchors.fill: parent
    color: "transparent"
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: confView.width
            height: confView.height
            radius: confView.windowRadius
        }
    }

    ShaderEffectSource {
        id: blurSrce
        anchors.fill: parent
        sourceItem: confView.blurItem
        live: true
        visible: false
    }

    GaussianBlur {
        anchors.fill: parent
        source: blurSrce
        radius: 10
        samples: 20
    }

    Rectangle {
        anchors.fill: parent
        color: confView.darkMode ? Qt.rgba(0, 0, 0, 0.50) : Qt.rgba(1, 1, 1, 0.50)
    }

    WorkHand {
        cursorShape: Qt.ArrowCursor
        onClicked: confView.conveyReject()
    }

    Rectangle {
        id: confBody
        anchors.centerIn: parent
        width: 400
        height: confCard.implicitHeight + 40
        radius: 15
        scale: confView.opacity * 0.25 + 0.75
        color: confView.darkMode ? Qt.rgba(0.00, 0.00, 0.00, 0.75) : Qt.rgba(0.60, 0.60, 0.60, 0.75)

        WorkHand {
            cursorShape: Qt.ArrowCursor
            onClicked: {}
        }

        ColumnLayout {
            id: confCard
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "Starting creation"
                    color: confView.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
                    font.pixelSize: 20
                    font.weight: Font.Bold
                }

                Item { Layout.fillWidth: true }

                IconUnit {
                    location: "../assets/icon/mono/prog_warn.svg"
                    darkMode: confView.darkMode
                }
            }

            SepaLine { darkMode: confView.darkMode }

            Text {
                Layout.fillWidth: true
                text: "Are you certain you wish to write to the selected storage device?"
                color: confView.darkMode ? Qt.rgba(0.80, 0.80, 0.80, 1.00) : Qt.rgba(0.20, 0.20, 0.20, 1.00)
                font.pixelSize: 12
                wrapMode: Text.WordWrap
            }

            InfoColl {
                darkMode: confView.darkMode
                editName: confView.headText
                diskName: confView.diskText
                versName: confView.versText
            }

            Text {
                Layout.fillWidth: true
                text: "This will irrevocably erase all data on the selected storage device."
                color: confView.darkMode ? Qt.rgba(1.0, 0.5, 0.5, 1) : Qt.rgba(0.5, 0.0, 0.0, 1)
                font.pixelSize: 12
                wrapMode: Text.WordWrap
            }

            SepaLine { darkMode: confView.darkMode }

            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                PillPush {
                    iconLead: true
                    darkMode: confView.darkMode
                    location: "../assets/icon/mono/prev.svg"
                    mainText: "Reject"
                    onUnitClicked: confView.conveyReject()
                }

                Item { Layout.fillWidth: true }

                PillPush {
                    iconLead: false
                    darkMode: confView.darkMode
                    location: "../assets/icon/mono/next.svg"
                    mainText: "Accept"
                    onUnitClicked: confView.conveyAccept()
                }
            }
        }
    }
}
