import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

import PhotoBalm 1.0

ApplicationWindow {
    title: qsTr("Photobalm")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: fileDialog.visible = true;
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
        Menu {
            title: qsTr("&Edit")
            MenuItem {
                text: qsTr("&Clear");
                onTriggered: messageDialog.show(qsTr("Clear action triggered"));
            }
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        onAccepted: {
            main_image.setImage(fileDialog.fileUrl)
            main_image.update()
            visible: false;
        }
        onRejected: {
            visible: false
        }
        Component.onCompleted: visible = false
    }

    MouseArea {
        anchors.fill: parent
        onClicked: main_image.highlight(mouseX, mouseY)
        onPositionChanged: if ( true ) { main_image.highlight(mouseX, mouseY) }
        PBImage {
            id: main_image
            anchors.fill: parent
        }
    }



    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
