import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Model-View-Delegate")

    property int numberOfElement : 100

/*
    Column{
        spacing:2
        anchors.centerIn: parent

        Repeater{
            model: ListModel{
                ListElement { name: "Mercury"; surfaceColor: "gray" }
                ListElement { name: "Venus"; surfaceColor: "yellow" }
                ListElement { name: "Earth"; surfaceColor: "blue" }
                ListElement { name: "Mars"; surfaceColor: "orange" }
                ListElement { name: "Jupiter"; surfaceColor: "orange" }
                ListElement { name: "Saturn"; surfaceColor: "yellow" }
                ListElement { name: "Uranus"; surfaceColor: "lightBlue" }
                ListElement { name: "Neptune"; surfaceColor: "lightBlue" }
            }

            delegate: Rectangle{
                width: 100
                height: 30
                color: Qt.lighter("blue")
                radius: 5
                Text {
                    text: name
                    anchors.left: innerBox.right
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                }
                Rectangle{
                    id: innerBox
                    width: 20
                    height: 20
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.leftMargin: 5
                    radius: 10
                    color: surfaceColor
                    MouseArea{
                        anchors.fill: parent
                        onClicked: console.log(surfaceColor)
                    }
                }
            }
        }
    }

*/

    ListView{
        id:view
        anchors.fill: parent
        anchors.margins: 40
        spacing:5
        model: numberOfElement
        delegate: element
        clip:true
        //orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        boundsBehavior: ListView.DragAndOvershootBounds
        focus: true
        highlight: highlighted
        //highlightRangeMode:  ListView.StrictlyEnforceRange //ListView.ApplyRange
        //highlightFollowsCurrentItem: false // Eger false a set edersek kendimiz animasyon eklememiz gerekir
    }

    Component{
        id:highlighted
        Item{
            id:highlightedItem
//            y: view.currentItem.y
//            Behavior on y {
//                ParallelAnimation {
//                    ColorAnimation{target: highlightedItem; from:"lightblue"; to:"red"; duration:400}
//                    PropertyAnimation { target: highlightedItem; property: "opacity"; to: 0; duration: 200 }
//                    NumberAnimation { duration: 1 }
//                    PropertyAnimation { target: highlightedItem; property: "opacity"; to: 1; duration: 200 }
//                }
//            }

            Rectangle{
                width: 40
                color: "lightgreen"
            }

        }
    }

    Component{
        id:element
        Rectangle{
            width: 40
            height: 40
            Keys.onReturnPressed: console.log(view.currentIndex)
            color: ListView.isCurrentItem ? "lightgreen" : "lightblue"
            Text {
                id: text
                text: index
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill:parent
                onClicked: console.log(index)
            }

        }
    }



}
