import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.1
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
                    console.log("iosright")
                }

                else if(mouse.button & Qt.LeftButton){
                    console.log("ios_left")
                }
            }
        }
    }

    NativeDialogs.FileDialog{
        id: fileOpenDialog
        title: qsTr("Select an image")
        folder: ""
        nameFilters: [
        "Image files (*.png *.jpg *.gif *.svg)"
        ]
        onAccepted: image.source = fileOpenDialog.file
    }

    NativeDialogs.MessageDialog{
        id: aboutDialog
        title: qsTr("About")
        text: qsTr("Image Viewer 1.0 was developed \n by Fatih Budak using Qml")
    }


    Drawer{
        id:drawer
        width: parent.width/3 * 1.618
        height: parent.height

        background: Rectangle{
            anchors.fill: parent
            gradient: Gradient{
                GradientStop{ position: 0.0; color: "white" }
                GradientStop{ position: 1.0; color: Qt.lighter("steelblue") }
            }
        }

        ListView{
            currentIndex: -1
            anchors.fill: parent
            focus: true

            delegate: ItemDelegate{
                width:parent.width
                text: model.text
                highlighted: ListView.isCurrentItem
                onClicked: {
                    drawer.close()
                    model.triggered()
                }
            }

            model: ListModel{
                ListElement{
                    text: qsTr("File")
                    triggered: function() { openFileDialog() }
                }
                ListElement{
                    text: qsTr("About")
                    triggered: function() { openAboutDialog() }
                }
            }
        }
    }

    header: ToolBar{
        ToolButton{
            id:toolbutton
            anchors.left: parent.left
            text: "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.618
            onClicked: drawer.open()
        }
        Label{
            id:label
            text: qsTr("Application")
            anchors.centerIn: parent
        }

        Material.background: Material.LightBlue
    }



}
