import QtQuick 2.0

Rectangle{
    id:root
    property int buttonWidth: 10 * pixelDensity
    property int buttonHeight: 10 * pixelDensity

    property  alias label : label
    property  alias text : label.text
    signal clicked

    width: buttonWidth
    height: buttonHeight
    color: "steelblue"
    radius: 5
    Text {
        id:label
        anchors.centerIn: parent
        font.pixelSize: 2 * pixelDensity
        text: ""
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}

