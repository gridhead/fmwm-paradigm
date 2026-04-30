import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: dropGrid
    property string headText: "NULL"
    property var    cardList: []
    property bool   darkMode: true
    signal cardClicked(string head, string desc, string icon)

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // Header
        Text {
            text: dropGrid.headText
            color: dropGrid.darkMode ? Qt.rgba(0.85, 0.85, 0.85, 1) : Qt.rgba(0.15, 0.15, 0.15, 1)
            font.pixelSize: 20
            font.weight: Font.Normal
        }

        Item { Layout.fillHeight: true }

        // Card collection
        Flickable {
            Layout.fillWidth: true
            Layout.preferredHeight: cardGrid.implicitHeight
            Layout.maximumHeight: dropGrid.height * 0.75
            contentHeight: cardGrid.implicitHeight
            clip: true

            GridLayout {
                id: cardGrid
                width: parent.width
                columns: Math.min(4, Math.max(2, Math.floor(width / 250)))
                columnSpacing: 10
                rowSpacing: 10

                Repeater {
                    model: dropGrid.cardList

                    DropUnit {
                        textHead: modelData.head
                        textDesc: modelData.desc
                        unitIcon: modelData.icon
                        darkMode: dropGrid.darkMode
                        onCardClicked: dropGrid.cardClicked(modelData.head, modelData.desc, modelData.icon)
                    }
                }
            }
        }
    }
}
