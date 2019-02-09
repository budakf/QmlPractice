import QtQuick 2.0

FocusScope {
    id:root
    width:96
    height:24
    property alias area: area

    Rectangle{
        id:area
        color:"lightgray"
        anchors.fill: parent
    }

    property alias input: input
    property alias text: input.text

    TextInput{
        id:input
        anchors.fill: parent
        color: "black"
        focus:true
        anchors.margins: 4
    }
}
