import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import "Main.js" as Main



ApplicationWindow {

    id:root

    title: qsTr("Hello World")
    width:Screen.width
    height:Screen.height
    visible: true

    property var oGame;

    contentOrientation :Qt.PortraitOrientation

    Rectangle{
        id:canvas
        width: root.oGame.width
        height: parent.height

        Image{
            source:"background.png"
            width: root.oGame.width;
            height: parent.height
        }



        Row{
            y:0
            anchors.right: parent.right
            height:root.oGame.convert(50)

            Text {
                id:scoreDiv
                height:parent.height
                font.pixelSize: parent.height
                horizontalAlignment:Text.AlignRight
                verticalAlignment: Text.AlignBottom
                font.family: "Helvetica"
                text: "score"

            }
            Image {
                height:parent.height
                width:parent.height
                source: "Bad.png"
            }
        }



        Text {
            id:debugDiv
            y:300
            text: ""
            font.family: "Helvetica"
            font.pointSize: 24
            color: "red"
        }





       Timer{
           id:timerEnemy
           interval:2000
           running: false
           repeat: true
           onTriggered:  root.oGame.addEnemy();
       }

       Timer{
           id:timerCloud
           interval: 7000
           running:true
           repeat:true
           onTriggered: root.oGame.startCloud();
       }


       Component.onCompleted:{
           Main.startGame(Screen.width,Screen.height);


       }



    }


}


