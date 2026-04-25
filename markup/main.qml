import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Skeleton {
    id: mainRoot
    width: 800
    height: 480
    minimumWidth: 800
    minimumHeight: 480
    visible: true
    windowHeader: "Fedora Media Writer"

    MainArea {
        anchors.fill: parent
        windowRadius: mainRoot.windowRadius
        darkMode: mainRoot.darkMode
    }
}
