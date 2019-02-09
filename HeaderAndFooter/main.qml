import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("Header and Footer")

    ListView{
        id: listView
        anchors.fill: parent
        anchors.centerIn: parent
        model: 10
        delegate: numberDelegate
        clip: true
        spacing: 2
        header: header
        footer: footer


    }

    Component{
        id: header
        Rectangle{
            id: rectangle
            width:parent.width
            height:50
            color: "orange"
            Text {
                id: text
                text: qsTr("header")
                anchors.centerIn: parent

            }
        }
    }


    Component {
        id: numberDelegate
        Rectangle{
            id:rectangle
            width:parent.width
            height:20
            color: "lightblue"
            Text {
                id: text
                text: qsTr("element")
                anchors.centerIn: parent
            }
        }
    }


    Component {
        id : footer
        Rectangle{
            id: rectangle
            width:parent.width
            height: 50
            color:"orange"
            Text {
                id: text
                text: qsTr("Footer")
                anchors.centerIn: parent

            }
        }
    }

}
