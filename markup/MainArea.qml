import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Item {
    id: mainArea
    property int    selectedIcon: 0
    property int    windowRadius: 0
    property bool   darkMode: true
    property bool   confView: false
    property string confHead: "NULL"
    property string confDisk: "NULL"
    property string confVers: "NULL"

    Rectangle {
        anchors.fill: parent
        radius: mainArea.windowRadius
        gradient: Gradient {
            GradientStop { position: 0.0; color: mainArea.darkMode ? Qt.rgba(0.20, 0.25, 0.25, 1) : Qt.rgba(0.60, 0.65, 0.65, 1) }
            GradientStop { position: 1.0; color: mainArea.darkMode ? Qt.rgba(0.40, 0.45, 0.45, 1) : Qt.rgba(0.40, 0.45, 0.45, 1) }
        }
    }

    RowLayout {
        id: mainData
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
            id: mainBody
            selectedIcon: mainArea.selectedIcon
            darkMode: mainArea.darkMode
            windowRadius: mainArea.windowRadius
            onConfMake: (head, disk, vers) => {
                mainArea.confHead = head
                mainArea.confDisk = disk
                mainArea.confVers = vers
                mainArea.confView = true
            }
        }
    }

    onConfViewChanged: {
        if (confView) {
            confShut.stop()
            confOpen.start()
        } else {
            confOpen.stop()
            confShut.start()
        }
    }

    SequentialAnimation {
        id: confOpen
        ParallelAnimation {
            NumberAnimation { target: confArea; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutExpo }
        }
    }

    SequentialAnimation {
        id: confShut
        ParallelAnimation {
            NumberAnimation { target: confArea; property: "opacity"; to: 0; duration: 500; easing.type: Easing.InExpo }
        }
    }

    ConfView {
        id: confArea
        z: 20
        visible: opacity > 0
        opacity: 0
        darkMode: mainArea.darkMode
        blurItem: mainData
        windowRadius: mainArea.windowRadius
        headText: mainArea.confHead
        diskText: mainArea.confDisk
        versText: mainArea.confVers
        onConveyReject: mainArea.confView = false
        onConveyAccept: mainArea.confView = false
    }
}
