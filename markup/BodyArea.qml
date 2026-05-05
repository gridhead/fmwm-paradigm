import QtQuick
import QtQuick.Layouts

Rectangle {
    id: bodyArea
    property int    selectedIcon: 0
    property int    windowRadius: 0
    property bool   darkMode: true
    property bool   makeView: false
    property string makeHead: "NULL"
    property string makeDesc: "NULL"
    property string makeIcon: "NULL"
    signal confMake(string head, string disk, string vers)

    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"
    clip: true

    Rectangle {
        id: backDrop
        anchors.fill: parent
        color: bodyArea.darkMode ? Qt.rgba(0.2, 0.2, 0.2, 0.25) : Qt.rgba(0.8, 0.8, 0.8, 0.25)
        topRightRadius: bodyArea.windowRadius
        bottomRightRadius: bodyArea.windowRadius
        topLeftRadius: 0
        bottomLeftRadius: 0
        opacity: 0
        visible: opacity > 0
    }

    function pickComponent() {
        switch (selectedIcon) {
            case 1: return compFstd
            case 2: return compAtom
            case 3: return compSpin
            case 4: return compLabs
            case 5: return compPick
            case 6: return compCall
            default: return null
        }
    }

    Connections {
        target: dataLoad.item
        ignoreUnknownSignals: true
        function onCardClicked(head, desc, icon, link) {
            if (link !== "") {
                Qt.openUrlExternally(link)
            } else {
                bodyArea.makeHead = head
                bodyArea.makeDesc = desc
                bodyArea.makeIcon = icon
                bodyArea.makeView = true
            }
        }
        function onCommenceCreation(disk, vers) {
            bodyArea.confMake(bodyArea.makeHead, disk, vers)
        }
    }

    onSelectedIconChanged: {
        makeView = false
        transitionToGrid.stop()
        if (selectedIcon !== 0) {
            slideEnter.stop()
            dataLoad.sourceComponent = bodyArea.pickComponent()
            slideField.y = parent.height
            slideField.opacity = 0
            slideEnter.start()
        } else {
            slideLeave.start()
        }
    }

    onMakeViewChanged: {
        if (makeView) {
            slideEnter.stop()
            slideLeave.stop()
            transitionToMake.start()
        } else if (selectedIcon !== 0) {
            transitionToMake.stop()
            transitionToGrid.start()
        }
    }

    SequentialAnimation {
        id: slideEnter
        ParallelAnimation {
            NumberAnimation { target: backDrop; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutCubic }
            NumberAnimation { target: slideField; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutCubic }
            NumberAnimation { target: slideField; property: "y"; to: 0; duration: 500; easing.type: Easing.OutCubic }
        }
    }

    SequentialAnimation {
        id: slideLeave
        ParallelAnimation {
            NumberAnimation { target: backDrop; property: "opacity"; to: 0; duration: 500; easing.type: Easing.InCubic }
            NumberAnimation { target: slideField; property: "opacity"; to: 0; duration: 500; easing.type: Easing.InCubic }
            NumberAnimation { target: slideField; property: "y"; to: slideField.parent.height; duration: 500; easing.type: Easing.InCubic }
        }
        onFinished: {
            dataLoad.sourceComponent = null
        }
    }

    SequentialAnimation {
        id: transitionToMake
        ParallelAnimation {
            NumberAnimation { target: slideField; property: "opacity"; to: 0; duration: 500; easing.type: Easing.InCubic }
            NumberAnimation { target: slideField; property: "y"; to: -slideField.parent.height; duration: 500; easing.type: Easing.InCubic }
        }
        ScriptAction {
            script: {
                dataLoad.sourceComponent = compMake
                slideField.y = slideField.parent.height
            }
        }
        ParallelAnimation {
            NumberAnimation { target: slideField; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutCubic }
            NumberAnimation { target: slideField; property: "y"; to: 0; duration: 500; easing.type: Easing.OutCubic }
        }
    }

    SequentialAnimation {
        id: transitionToGrid
        ParallelAnimation {
            NumberAnimation { target: slideField; property: "opacity"; to: 0; duration: 500; easing.type: Easing.InCubic }
            NumberAnimation { target: slideField; property: "y"; to: slideField.parent.height; duration: 500; easing.type: Easing.InCubic }
        }
        ScriptAction {
            script: {
                dataLoad.sourceComponent = bodyArea.pickComponent()
                slideField.y = -slideField.parent.height
            }
        }
        ParallelAnimation {
            NumberAnimation { target: slideField; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutCubic }
            NumberAnimation { target: slideField; property: "y"; to: 0; duration: 500; easing.type: Easing.OutCubic }
        }
    }

    Item {
        id: slideField
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height
        y: parent.height
        opacity: 0

        Loader {
            id: dataLoad
            anchors.fill: parent
            anchors.topMargin: 12.5
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.bottomMargin: 10
        }
    }

    Component {
        id: compFstd
        DropGrid {
            headText: "Official Editions"
            darkMode: bodyArea.darkMode
            cardList: [
                { head: "Fedora Workstation", desc: "Fedora Linux with the GNOME desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora KDE Plasma Desktop", desc: "Fedora Linux with the KDE Plasma desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora IoT", desc: "Fedora Linux with the specific IoT related features", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Server", desc: "Fedora Linux for infra hosting and services deployments", icon: "../assets/icon/tint/fedo.png" }
            ]
        }
    }

    Component {
        id: compAtom
        DropGrid {
            headText: "Atomic Desktops"
            darkMode: bodyArea.darkMode
            cardList: [
                { head: "Fedora Silverblue", desc: "Immutable Fedora Linux desktop with GNOME and rpm-ostree", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Kinoite", desc: "Immutable Fedora Linux desktop with KDE Plasma and rpm-ostree", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Budgie Atomic", desc: "Immutable Fedora Linux desktop with Budgie and rpm-ostree", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Sway Atomic", desc: "Immutable Fedora Linux desktop with Sway VM and rpm-ostree", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora COSMIC Atomic", desc: "Immutable Fedora Linux desktop with COSMIC and rpm-ostree", icon: "../assets/icon/tint/fedo.png" }
            ]
        }
    }

    Component {
        id: compSpin
        DropGrid {
            headText: "Fedora Spins"
            darkMode: bodyArea.darkMode
            cardList: [
                { head: "Fedora KDE Plasma Mobile", desc: "Fedora Linux with the KDE Plasma Mobile", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Xfce Desktop", desc: "Fedora Linux with the Xfce desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora LXQt Desktop", desc: "Fedora Linux with the LXQt desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Cinnamon Desktop", desc: "Fedora Linux with the Cinnamon desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora LXDE Desktop", desc: "Fedora Linux with the LXDE desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Budgie Desktop", desc: "Fedora Linux with the Budgie desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora COSMIC Desktop", desc: "Fedora Linux with the COSMIC desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora SoaS Desktop", desc: "Fedora Linux with the Sugar On A Stick desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora MATE-Compiz Desktop", desc: "Fedora Linux with the MATE-Compiz desktop environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora i3 Desktop", desc: "Fedora Linux with the i3 tiling window manager", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Sway Desktop", desc: "Fedora Linux with the Sway tiling window manager", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Miracle Desktop", desc: "Fedora Linux with the Miracle tiling window manager", icon: "../assets/icon/tint/fedo.png" }
            ]
        }
    }

    Component {
        id: compLabs
        DropGrid {
            headText: "Fedora Labs"
            darkMode: bodyArea.darkMode
            cardList: [
                { head: "Fedora Astronomy", desc: "Fedora Linux with astronomy collection and astrophotography tools", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Design Suite", desc: "Fedora Linux with graphic design and multimedia production suite", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Security Lab", desc: "Fedora Linux with security auditing and forensics environment", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Robotics Suite", desc: "Fedora Linux with robotics building and automation development suite", icon: "../assets/icon/tint/fedo.png" },
                { head: "Fedora Games", desc: "Fedora Linux with video games and entertainment suite", icon: "../assets/icon/tint/fedo.png" },
            ]
        }
    }

    Component {
        id: compPick
        DropGrid {
            headText: "Custom Image"
            darkMode: bodyArea.darkMode
            cardList: [
                { head: "Custom Image", desc: "Write a custom ISO image to a USB drive", icon: "../assets/icon/tint/fedo.png" }
            ]
        }
    }

    Component {
        id: compCall
        DropGrid {
            headText: "Information"
            darkMode: bodyArea.darkMode
            cardList: [
                { head: "About FMWM", desc: "Fedora Media Writer information and credits", icon: "../assets/icon/tint/fedo.png" },
                { head: "Report Issue", desc: "Report a bug or request a feature", icon: "../assets/icon/tint/fedo.png", link: "https://github.com/gridhead/fmwm-paradigm/issues" }
            ]
        }
    }

    Component {
        id: compMake
        MakeArea {
            headText: bodyArea.makeHead
            descText: bodyArea.makeDesc
            iconText: bodyArea.makeIcon
            darkMode: bodyArea.darkMode
            onGoBack: bodyArea.makeView = false
        }
    }
}
