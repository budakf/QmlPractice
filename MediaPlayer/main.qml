import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtMultimedia 5.9


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Media Player")

    Rectangle{
        id: background
        anchors.fill: parent
        color: "darkgray"
    }

    Rectangle{
        id: playerArea
        anchors.fill: parent
        anchors.margins: 30
        anchors.bottomMargin: 40
        color:"lightgray"
        radius: 10

    }

    MediaPlayer{
        id:mediaPlayer
        source:"qrc:/Qt.mp4"
        volume: 0.5

    }

    VideoOutput{
        id:videoOutput
        anchors.fill: playerArea
        source: mediaPlayer
    }

    Rectangle{
        id: playerController
        width: 20
        height: 20
        anchors.right: progressBar.left
        anchors.rightMargin: 15
        anchors.bottom: playerArea.bottom
        anchors.bottomMargin: 3
        color:"#ff0000"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(playerController.radius == 10){
                    mediaPlayer.pause()
                    playerController.radius = 3
                    playerController.color = "#ff0000"
                }
                else{
                    mediaPlayer.play()
                    playerController.radius = 10
                    playerController.color = "lightgreen"
                }
            }
        }
    }

    Rectangle{
        id: progressBar
        width: playerArea.width - 80
        height: 3
        anchors.bottom: playerArea.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: playerArea.horizontalCenter
        color:"darkgray"
        radius : 10
    }

    Rectangle{
        id: cursor
        width:10
        height: 10
        radius: 5
        x: 60
        anchors.verticalCenter: progressBar.verticalCenter

        MouseArea{
            id: mouseArea
            anchors.fill: parent
            drag.target: cursor
            drag.axis: Drag.XAxis
            drag.minimumX: progressBar.x
            drag.maximumX: progressBar.x + progressBar.width
            onClicked: {
                console.log(mediaPlayer.position)
                if(mediaPlayer.seekable){
                    console.log(mediaPlayer.duration)
                    console.log("cursor:",cursor.x)
                    mediaPlayer.seek(mediaPlayer.duration + (cursor.x-60)/cursor.width)
                }
            }
        }
    }

    ProgressBar{
        background: Rectangle {
                id: progressBar2
                width: playerArea.width - 80
                height: 3
                anchors.centerIn: background

                color:"darkgray"
                radius : 10
            }

        anchors.centerIn: background
        value: 0.5
    }

}
