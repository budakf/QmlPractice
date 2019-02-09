import QtQuick 2.9
import QtQuick.Window 2.2
import QtQml.Models 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Object Model")

    Rectangle{
        id: background
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{ position: 0.0 ; color: "lightgray" }
            GradientStop{ position: 1.0 ; color: "steelblue" }
        }

        ListView{
            id: listView
            anchors.fill: parent
            anchors.margins: 20
            model: listModel
            spacing: 10
            focus: true

        }

        ObjectModel{
            id: listModel


            Rectangle{
                width: 20
                height: 40
                color: "red"
            }

            Rectangle{
                width: 50
                height: 70
                color: "orange"
            }

            Rectangle{width: 20
                height: 20
                color: "blue"
            }

        }
    }

}
