import QtQuick
import QtQuick.Layouts

Rectangle {
    id: pillPush
    property bool   darkMode: false
    property bool   iconLead: false
    property string location: "NULL"
    property string mainText: "NULL"
    signal unitClicked()

    Layout.preferredWidth: pillIcon.width + pillText.implicitWidth + 15
    Layout.preferredHeight: 30
    radius: 15
    color: pillHand.containsMouse
        ? (pillPush.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.75) : Qt.rgba(0.8, 0.8, 0.8, 0.75))
        : (pillPush.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25))

    Behavior on color { ColorAnimation { duration: 150 } }

    WorkHand {
        id: pillHand
        onClicked: pillPush.unitClicked()
    }

    Row {
        anchors.centerIn: parent
        spacing: 7.5
        layoutDirection: iconLead ? Qt.LeftToRight : Qt.RightToLeft

        IconUnit {
            id: pillIcon
            width: 25; height: 25
            location: pillPush.location
            darkMode: pillPush.darkMode
        }

        Text {
            id: pillText
            anchors.verticalCenter: parent.verticalCenter
            rightPadding: pillPush.iconLead ? 5 : 0
            leftPadding: pillPush.iconLead ? 0 : 5
            text: pillPush.mainText
            color: pillPush.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
            font.pixelSize: 14
        }
    }
}