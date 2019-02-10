import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Model with Actions")



    Rectangle{
        id: background
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{position: 0.0; color: "steelblue"}
            GradientStop{position: 1.0; color: "lightgreen"}
        }

        ListModel{
            id: listModel
            ListElement{
                name:"Istanbul"
                hello: function(value){
                    console.log("Hello!! from", value)
                }
            }
            ListElement{
                name:"Stockholm"
                hello: function(value){
                    console.log("Hello!! from", value)
                }
            }
            ListElement{
                name:"Paris"
                hello: function(value){
                    console.log("Hello!! from", value)
                }
            }
            ListElement{
                name:"Oslo"
                hello: function(value){
                    console.log("Hello!! from", value)
                }
            }
        }


        ListView{
            id: listView
            anchors.fill: parent
            anchors.margins: 30
            model: listModel
            delegate: numberDelegate
            spacing: 5
            focus: true
            clip: true
        }

        Component{
            id: numberDelegate
            Rectangle{
                width: listView.width
                height: 30
                color: ListView.isCurrentItem ? "#15ffff" : "#157efb"
                Text{
                    id: text
                    text: name
                    anchors.centerIn: parent
                }
                MouseArea{
                    id:click
                    anchors.fill: parent
                    onClicked: hello(listModel.get(index).name)
                }
                Keys.onReturnPressed: hello(listModel.get(index).name)
            }

        }

    }

}
