import QtQuick 2.0

FocusScope {
    id:root
    width:120
    height:50

    property alias area: area

    Rectangle{
        id:area
        anchors.fill:parent
        color:"lightgray"
        border.color: Qt.darker(color)
    }

    property alias text_edit: text_edit
    property alias text: text_edit.text

    TextEdit{
        id:text_edit
        anchors.fill: parent
        anchors.margins: 4
        color:"black"
        focus:true
        wrapMode: Text.Wrap
    }

}
