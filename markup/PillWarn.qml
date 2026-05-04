import QtQuick
import QtQuick.Layouts
import QtQml

Rectangle {
    id: pillWarn
    property bool   darkMode: true
    property string dataText: "NULL"

    function showWarn(message) {
        pillWarn.dataText = message
        warnShut.stop()
        warnOpen.start()
        warnTime.restart()
    }

    SequentialAnimation {
        id: warnOpen
        NumberAnimation { target: pillWarn; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutCubic }
    }

    SequentialAnimation {
        id: warnShut
        NumberAnimation { target: pillWarn; property: "opacity"; to: 0; duration: 500; easing.type: Easing.InCubic }
    }

    Timer {
        id: warnTime
        interval: 5000
        onTriggered: warnShut.start()
    }

    width: warnText.implicitWidth + 20
    height: 30
    radius: 15
    opacity: 0
    visible: opacity > 0
    color: warnHand.containsMouse
        ? (pillWarn.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
        : (pillWarn.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

    Behavior on color { ColorAnimation { duration: 150 } }

    WorkHand {
        id: warnHand
        onClicked: {}
    }

    Text {
        id: warnText
        anchors.centerIn: parent
        text: pillWarn.dataText
        color: pillWarn.darkMode ? Qt.rgba(1.0, 0.5, 0.5, 1) : Qt.rgba(0.5, 0.0, 0.0, 1)
        font.pixelSize: 12
    }
}