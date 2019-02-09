import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 320
    height: 500
    title: qsTr("List View With Section")

    Rectangle{
        id: background
        anchors.fill: parent
        color: "white"

        ListView{
            id: listView
            width: parent.width
            height: 240

            model: listModel
            delegate: listDelegate
            section.delegate: sectionDelegate
            section.property: "nation"

            focus:true
        }

        ListModel{
            id: listModel
            ListElement { name: "Abdul Ahad Mohmand"; nation: "Afganistan"; }
            ListElement { name: "Marcos Pontes"; nation: "Brazil"; }
            ListElement { name: "Alexandar Panayotov Alexandrov"; nation: "Bulgaria"; }
            ListElement { name: "Georgi Ivanov"; nation: "Bulgaria"; }
            ListElement { name: "Roberta Bondar"; nation: "Canada"; }
            ListElement { name: "Marc Garneau"; nation: "Canada"; }
            ListElement { name: "Chris Hadfield"; nation: "Canada"; }
            ListElement { name: "Guy Laliberte"; nation: "Canada"; }
            ListElement { name: "Steven MacLean"; nation: "Canada"; }
            ListElement { name: "Julie Payette"; nation: "Canada"; }
            ListElement { name: "Robert Thirsk"; nation: "Canada"; }
            ListElement { name: "Bjarni Tryggvason"; nation: "Canada"; }
            ListElement { name: "Dafydd Williams"; nation: "Canada"; }
        }

        Component{
            id: listDelegate
            Rectangle{
                width: parent.width
                height: 20
                color: ListView.isCurrentItem ? "lightblue" : "gray"
                Text {
                    id: text
                    text: name
                }
            }
        }

        Component{
            id: sectionDelegate
            Rectangle{
                width: parent.width
                height: 20
                color:"lightgreen"
                Text {
                    id: text
                    text: section
                    anchors.centerIn: parent
                }
            }
        }


    }



}
