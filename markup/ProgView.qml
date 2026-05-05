import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Rectangle {
    id: progView
    property string headText: "NULL"
    property string diskText: "NULL"
    property string versText: "NULL"
    property bool   darkMode: true
    property var    blurItem: null
    property int    windowRadius: 0
    property real   progress: 0.0
    property int    progStep: 0
    signal conveyCancel()
    signal conveyFinish()

    anchors.fill: parent
    color: "transparent"
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: progView.width
            height: progView.height
            radius: progView.windowRadius
        }
    }

    ShaderEffectSource {
        id: blurSrce
        anchors.fill: parent
        sourceItem: progView.blurItem
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
        color: progView.darkMode ? Qt.rgba(0, 0, 0, 0.50) : Qt.rgba(1, 1, 1, 0.50)
    }

    WorkHand {
        cursorShape: Qt.ArrowCursor
        onClicked: {}
    }

    function progHead() {
        switch (progView.progStep) {
            case 0: return "Fetching"
            case 1: return "Flashing"
            default: return "Complete"
        }
    }

    function iconPath() {
        switch (progView.progStep) {
            case 0: return "../assets/icon/mono/prog_down.svg"
            case 1: return "../assets/icon/mono/prog_make.svg"
            case 2: return "../assets/icon/mono/prog_done.svg"
        }
    }

    // Simulate progress
    Timer {
        id: progTime
        interval: 75
        repeat: true
        running: progView.opacity > 0 && progView.progStep < 2
        onTriggered: {
            progView.progress += (Math.random() * 0.015 + 0.005)
            if (progView.progress >= 1.0) {
                if (progView.progStep === 0) {
                    progView.progress = 0.0
                    progView.progStep = 1
                } else {
                    progView.progress = 1.0
                    progView.progStep = 2
                }
            }
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 400
        height: progCard.implicitHeight + 40
        radius: 15
        scale: progView.opacity * 0.25 + 0.75
        color: progView.darkMode ? Qt.rgba(0.00, 0.00, 0.00, 0.75) : Qt.rgba(0.60, 0.60, 0.60, 0.75)

        WorkHand {
            cursorShape: Qt.ArrowCursor
            onClicked: {}
        }

        ColumnLayout {
            id: progCard
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: progView.progHead()
                    color: progView.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
                    font.pixelSize: 20
                    font.weight: Font.Bold
                }

                Item { Layout.fillWidth: true }

                IconUnit {
                    id: progIcon
                    location: iconPath()
                    darkMode: progView.darkMode
                    opacity: progView.progStep < 2 ? 0.25 : 1.00

                    SequentialAnimation {
                        running: progView.progStep < 2
                        loops: Animation.Infinite
                        NumberAnimation { target: progIcon; property: "opacity"; to: 0.25; duration: 1000; easing.type: Easing.InOutSine }
                        NumberAnimation { target: progIcon; property: "opacity"; to: 1.00; duration: 1000; easing.type: Easing.InOutSine }
                    }
                }
            }

            SepaLine { darkMode: progView.darkMode }

            InfoColl {
                darkMode: progView.darkMode
                editName: progView.headText
                diskName: progView.diskText
                versName: progView.versText
            }

            Rectangle {
                Layout.fillWidth: true
                height: 10
                radius: 5
                color: progView.darkMode ? Qt.rgba(0.5, 0.5, 0.5, 0.5) : Qt.rgba(0.5, 0.5, 0.5, 0.5)

                Rectangle {
                    width: parent.width * progView.progress
                    height: parent.height
                    radius: 4
                    color: progView.progStep === 0
                        ? Qt.rgba(0.25, 0.50, 1.00, 1)
                        : progView.progStep === 1
                            ? Qt.rgba(0.25, 1.00, 0.50, 1)
                            : Qt.rgba(0.25, 1.00, 0.50, 1)

                    Behavior on width { NumberAnimation { duration: 50 } }
                    Behavior on color { ColorAnimation { duration: 300 } }
                }
            }

            RowLayout {
                Text {
                    id: progText
                    text: progView.progStep === 2 ? "Creation operation completed successfully" : "Please wait..."
                    color: progView.darkMode ? Qt.rgba(0.80, 0.80, 0.80, 1.00) : Qt.rgba(0.20, 0.20, 0.20, 1.00)
                    font.pixelSize: 12
                }

                Item { Layout.fillWidth: true }

                Text {
                    id: progPerc
                    text: progView.progStep === 2 ? "" : Math.floor(progView.progress * 100) + "%"
                    color: progView.darkMode ? Qt.rgba(0.80, 0.80, 0.80, 1.00) : Qt.rgba(0.20, 0.20, 0.20, 1.00)
                    font.pixelSize: 12
                }
            }

            SepaLine { darkMode: progView.darkMode }

            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                PillPush {
                    iconLead: true
                    darkMode: progView.darkMode
                    location: "../assets/icon/mono/prev.svg"
                    mainText: "Cancel"
                    visible: progView.progStep < 2
                    onUnitClicked: progView.conveyCancel()
                }

                Item { Layout.fillWidth: true }

                PillPush {
                    iconLead: false
                    darkMode: progView.darkMode
                    location: "../assets/icon/mono/next.svg"
                    mainText: "Finish"
                    visible: progView.progStep === 2
                    onUnitClicked: progView.conveyFinish()
                }
            }
        }
    }
}
