import QtQuick 2.0

Rectangle {
    id: root
    property alias label: label
    property alias text : label.text
    signal clicked
    color:"red"
    width: 25
    height: 25
    Text {
        id: label
        anchors.centerIn: parent
        text: ""
    }
    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }

}
