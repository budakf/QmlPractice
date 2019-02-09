import QtQuick 2.0


FSquare{
    id:traffic_light
    width:90
    height: 300
    color:Qt.darker("gray")
    radius: 5

    property alias lower_light: lower_light
    property alias middle_light: middle_light
    property alias upper_light: upper_light

    FSquare{
        id:upper_light
        width:75
        height: 75
        color:"red"
        anchors.top: traffic_light.top
        anchors.topMargin: 20
        anchors.horizontalCenter: traffic_light.horizontalCenter
        radius: width/2
    }

    FSquare{
        id:middle_light
        width:75
        height: 75
        color:"black"
        anchors.centerIn: parent
        radius: width/2
    }

    FSquare{
        id:lower_light
        width:75
        height: 75
        color:"black"
        anchors.bottom: traffic_light.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: traffic_light.horizontalCenter
        radius: width/2
    }

    states: [
        State {
            name: "go"
            PropertyChanges {
                target: traffic_light.upper_light; color: "black"
            }
            PropertyChanges {
                target: traffic_light.middle_light; color: "black"
            }
            PropertyChanges {
                target: traffic_light.lower_light; color: "green"
            }
        },
        State {
            name: "ready"
            PropertyChanges {
                target: traffic_light.upper_light; color: "black"
            }
            PropertyChanges {
                target: traffic_light.middle_light; color: "yellow"
            }
            PropertyChanges {
                target: traffic_light.lower_light; color: "black"
            }
        },
        State {
            name: "stop"
            PropertyChanges {
                target: traffic_light.upper_light; color: "red"
            }
            PropertyChanges {
                target: traffic_light.middle_light; color: "black"
            }
            PropertyChanges {
                target: traffic_light.lower_light; color: "black"
            }
        }

    ]

    state:"stop"

    transitions: [
        Transition {
            from: "stop"; to: "ready"
            //from: "*"; to: "*"   ==> this means that
            ColorAnimation { target: traffic_light.upper_light; properties: "color"; duration: 1000 }
            ColorAnimation { target: traffic_light.middle_light; properties: "color"; duration: 1000 }
        },
        Transition {
            from: "ready"; to: "go"
                ColorAnimation { target: traffic_light.middle_light; properties: "color"; duration: 1000 }
                ColorAnimation { target: traffic_light.lower_light; properties: "color"; duration: 1000 }
            }
    ]


}
