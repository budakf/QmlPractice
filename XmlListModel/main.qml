import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.XmlListModel 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Xml List Model")

    Rectangle{
        id: background
        anchors.fill: parent
        color:"darkgray"

        ListView{
            id: listView
            anchors.fill: parent
            model: xmlListModel
            delegate: listDelegate
            focus: true
        }

        XmlListModel{
            id: xmlListModel
            source: "https://www.nasa.gov/rss/dyn/image_of_the_day.rss"
            query: "/rss/channel/item"
            XmlRole { name: "title"; query: "title/string()" }
            XmlRole { name: "imageSource"; query: "enclosure/string(@url)" }
            XmlRole { name: "newsLink"; query: "link/string()"}

        }


        Component{
            id:listDelegate
            Rectangle{
                id: wrapper
                width: image.width
                height: image.height + image.height/4
                border.color: "red"
                Column {
                    Text {
                        id: text
                        text: title
                        color: "blue"
                    }
                    Image{
                        id: image
                        width: listView.width
                        height: 200
                        fillMode: Image.PreserveAspectCrop
                        source: imageSource
                        MouseArea{
                            id: click
                            anchors.fill: parent
                            onClicked: console.log(newsLink);
                        }
                    }
                }
            }

        }

    }
}
