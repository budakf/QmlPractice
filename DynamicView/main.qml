import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Dynamic List View")

    property int elementNumber: 5

    ListModel{
        id: listModel
        ListElement{ number: 1  }
        ListElement{ number: 2  }
        ListElement{ number: 3  }
        ListElement{ number: 4  }
        ListElement{ number: 5  }
    }

    ListView{
        id: listView
        width: 40
        height: parent.height/2
        anchors.centerIn: parent
        model:listModel
        delegate: numberDelegate
        focus: true

    }

    Component{
        id: numberDelegate
        Rectangle{
            id: rect
            width: 40
            height: 40
            radius: 3
            color: ListView.isCurrentItem ? "lightblue" : "lightgreen"
            Text {
                id: text
                text:  number
                anchors.centerIn: parent
            }
            MouseArea{
                id: removeClick
                anchors.fill: parent
                onClicked: {
                    listModel.remove(index)
                    --root.elementNumber
                }
            }
        }
    }

    Rectangle{
        id: add
        width: 40
        height: 40
        anchors.bottom: listView.top
        anchors.bottomMargin: 40
        color: "blue"
        MouseArea{
            id:addClick
            anchors.fill: parent
            onClicked: listModel.append({"number": ++root.elementNumber})
        }
    }




}
