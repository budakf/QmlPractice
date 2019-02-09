import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 320
    height: 640
    title: qsTr("Shaped Shifting Delegate")

    Rectangle{

        id: background
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#4a4a4a" }
            GradientStop { position: 1.0; color: "#2b2b2b" }
        }

        property int numberElement : 5

        ListView{
            id: listView
            width: parent.width
            height: parent.height*2/3
            model: listModel
            focus:true
            delegate: numberDelegate
            spacing: 2

        }

        ListModel{
            id: listModel
            ListElement{name:"name1"; clr:"blue"; details:"asvafsd fsdfseg\nsdvsdv\nsdvsdv\n vserfvfvfvfvfvvg"}
            ListElement{name:"name2"; clr:"lightgreen"; details:"asvaffg fg rg \nsdvsdv\nsdvsdv\n g rsdfsdfsegvsverg"}
            ListElement{name:"name3"; clr:"lightblue"; details:"asvafsdfsfg \nsdvsdv\nsdvsdv\n g brerf rvdfsegvserg"}
            ListElement{name:"name4"; clr:"black"; details:"asvafsdfsdrveve \nsdvsdv\nsdvsdv\n  fsegvsrtrb ferg"}
            ListElement{name:"name5"; clr:"orange"; details:"asvafsdfsdf d \nsdvsdv\nsdvsdv\n fbdfsdf g egvsergg"}
        }

        Component{
            id: numberDelegate
            Item {
                id: wrapper
                width: listView.width
                height: 30
                Rectangle{
                    id: element
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    height: 30
                    color: "#333"
                    border.color: Qt.lighter(color, 1.2)
                    border.width: 0.5

                    Text {
                        id: text
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        text: name
                        font.bold: true
                        font.pixelSize: parent.height-4
                        color: '#fff'
                    }

                }

                Rectangle{
                    id:image
                    width: 25
                    height: 25
                    color: clr
                    anchors.top: wrapper.top
                    anchors.topMargin: 2
                    anchors.right: wrapper.right
                    anchors.rightMargin: 5
                }

                MouseArea{
                    id: click
                    anchors.fill: parent
                    onClicked: {
                        parent.state = "expanded"
                    }
                }

                Item {
                    id: detail
                    width: parent.width
                    height: parent.height/2
                    anchors.top: image.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    opacity: 0
                    Text {
                        id: detail_text
                        anchors.fill: parent
                        text: details
                    }
                }

                Rectangle{
                    id: closeButton
                    opacity: 0
                    anchors.right: parent.right
                    anchors.top: parent.top
                    width: 25
                    height: 25
                    color: "red"
                    anchors.rightMargin: 5
                    MouseArea{
                        anchors.fill: parent
                        onClicked: wrapper.state = ""
                    }

                }

                state: ""

                states:[
                    State {
                        name: "expanded"
                        PropertyChanges { target: wrapper; height: listView.height }
                        PropertyChanges { target: image; width: listView.width; height: listView.width;
                                          anchors.rightMargin: 0;  anchors.topMargin: 30 }
                        PropertyChanges { target: detail; opacity: 1 }
                        PropertyChanges { target: closeButton; opacity: 1 }
                        PropertyChanges { target: wrapper.ListView.view; contentY: wrapper.y; interactive: false }
                    }
                ]

                transitions: [
                    Transition {
                        NumberAnimation {
                            duration: 200; properties: "height,width,anchors.rightMargin,anchors.topMargin,opacity,contentY"
                        }
                    }
                ]
            }

        }

        MouseArea{
            width: parent.width/2
            height: parent.height - listView.height
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            onClicked: listModel.append({"name":"name"+(++parent.numberElement) ,"clr": "gray" , details:"sdvsdvs\ndfbd\nsrfwerg\nesfefd"})
        }

        MouseArea{
            width: parent.width/2
            height: parent.height - listView.height
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            onClicked: {
                if(parent.numberElement){
                    listModel.remove(--parent.numberElement)
                }
            }
        }


    }



}
