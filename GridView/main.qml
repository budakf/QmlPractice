import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Grid View")

    GridView{
        id: gridView
        anchors.fill: parent
        anchors.margins: 40
        model: 100
        cellHeight: 40
        cellWidth: 40
        delegate: contentDelegate
        //flow: GridView.LeftToRight
        //A GridView contains headers and footers, can use a highlight delegate and supports snap modes
        //as well as various bounds behaviors. It can also be orientated in different directions and orientations.
        //layoutDirection:GridView.RightToLeft
        highlight: highlighted    // highlight edilmiş itemin renginin görülmesi için diğerlerinin renginin transparent olmasi gerek.
        //highlightRangeMode:  GridView.ApplyRange
        focus: true
        clip: true
    }

    Component{
        id: highlighted
        Rectangle{
            id: rectangle
            color: "LightBlue"
            width: 40
            height: 40
            radius: 3
        }
    }


    Component{
        id:contentDelegate
        Rectangle{
            id: content
            color:"transparent"
            width: 35
            height: 35
            radius: 3
            Text {
                id: text
                text: index
                anchors.centerIn: parent
            }
        }
    }
}
