import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Path View")

    Rectangle{
        id:pathViewWrapper
        width: 120
        height: 160
        color:Qt.darker("blue")
        PathView {
            id: pathView
            anchors.fill: pathViewWrapper
            delegate: flipCardDelegate
            model: 12
            path: Path {
                startX: pathViewWrapper.width/2
                startY: 0
                PathAttribute { name: "itemZ"; value: 0 }
                PathAttribute { name: "itemAngle"; value: -90.0; }
                PathAttribute { name: "itemScale"; value: 0.5; }
                PathLine { x: pathViewWrapper.width/2; y: pathViewWrapper.height*0.4; }
                PathPercent { value: 0.48; }
                PathLine { x: pathViewWrapper.width/2; y: pathViewWrapper.height*0.5; }
                PathAttribute { name: "itemAngle"; value: 0.0; }
                PathAttribute { name: "itemScale"; value: 1.0; }
                PathAttribute { name: "itemZ"; value: 100 }
                PathLine { x: pathViewWrapper.width/2; y: pathViewWrapper.height*0.6; }
                PathPercent { value: 0.52; }
                PathLine { x: pathViewWrapper.width/2; y: pathViewWrapper.height; }
                PathAttribute { name: "itemAngle"; value: 90.0; }
                PathAttribute { name: "itemScale"; value: 0.5; }
                PathAttribute { name: "itemZ"; value: 0 }
           }
            pathItemCount: 4
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            //movementDirection: PathView.Positive
        }

        Component{
            id: flipCardDelegate

            Rectangle{
                id: wrapper
                width: 64
                height: 64
                antialiasing: true
//                gradient: Gradient {
//                    GradientStop { position: 0.0; color: "#2ed5fa" }
//                    GradientStop { position: 1.0; color: "#2467ec" }
//                }

                visible: PathView.onPath
                scale: PathView.itemScale
                z: PathView.itemZ
                property variant rotX: PathView.itemAngle
                transform: Rotation {
                    axis { x: 1; y: 0; z: 0 }
                    angle: wrapper.rotX
                    origin { x: 32; y: 32; }
                }

                Image{
                    //text:index
                    source:"qrc:/image.png"
                    anchors.fill: parent
                }

                MouseArea{
                    id: click
                    anchors.fill: parent
                    onClicked: console.log("index",index)
                }

            }

        }

    }

}
