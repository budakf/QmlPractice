import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import Qt.labs.platform 1.0 as NativeDialogs

ApplicationWindow {
    id: root
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("Image Viewer")

    function openFileDialog(){ fileOpenDialog.open() }
    function openAboutDialog(){ aboutDialog.open() }

    background: Rectangle{
        gradient: Gradient{
            GradientStop{ position: 0.0; color: "white" }
            GradientStop{ position: 1.0; color: Qt.lighter("steelblue") }
        }
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
        MouseArea{
            id:mouse
            anchors.fill: parent
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            onClicked: {
                if(mouse.button & Qt.RightButton){
                    console.log("right")
                }
                else if(mouse.button & Qt.LeftButton){
                    console.log("left")
                }
            }
        }
    }


    FileDialog{
        id: fileOpenDialog
        title: qsTr("Select an image file")
        folder: shortcuts.desktop
        nameFilters: [
        "Image file (*.jpg *.png *.svg)"
        ]
        onAccepted: {
            image.source = fileOpenDialog.fileUrl
            //image.height = fileOpenDialog.file.height  // 50
            //image.width = fileOpenDialog.file.width    // 50
        }
    }

    NativeDialogs.MessageDialog{
        id: aboutDialog
        title: qsTr("About")
        text: qsTr("Image Viewer 1.0 was developed \n by Fatih Budak using Qml")
    }

    header: ToolBar{
        Flow{
            anchors.fill: parent
            ToolButton{
                text: qsTr("Open")
                onClicked: openFileDialog()
            }
        }
    }

    menuBar: MenuBar{
        Menu{
            title: qsTr("&File")
            MenuItem{
                text: qsTr("Open")
                onTriggered: openFileDialog()
            }
            MenuItem{
                text: qsTr("Edit")
                onTriggered: openFileDialog()
            }
            MenuItem{
                text: qsTr("MenuItem3")
                onTriggered: openFileDialog()
            }
        }
        Menu{
            title: qsTr("&Help")
            MenuItem{
                text: qsTr("About")
                onTriggered: openAboutDialog()
            }
        }
    }



}
