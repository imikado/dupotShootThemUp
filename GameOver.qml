import QtQuick 2.0
import QtQuick.Controls 1.5
import QtGraphicalEffects 1.0


Rectangle {
    visible:true
    color: "#465973"
    width:mainWindow.oGame.width
    height:mainWindow.oGame.height

    Image{
        source:"/images/gameOver.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:mainWindow.oGame.calcul(400)
        height:mainWindow.oGame.calcul(650)

        Text{
            id:oScore
            text:'000000'
            anchors.right: parent.right
            font.pointSize: 16
            font.bold: true
            color:"white"
        }
        DropShadow {
            anchors.fill: oScore
            horizontalOffset: 3
            verticalOffset: 3
            radius: 1.0
            samples: 8
            color: "#80000000"
            source: oScore
        }

        Button {
            id: button1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: mainWindow.oGame.calcul(291)
            height: mainWindow.oGame.calcul(33)
            text: qsTr("Re-Jouer!")

            onClicked:mainWindow.oGame.pageGameStart()
        }

        Button {
            id: button2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 50
            width: mainWindow.oGame.calcul(291)
            height: mainWindow.oGame.calcul(33)
            text: qsTr("Retour au menu")

            onClicked:mainWindow.oGame.pageMenu()
        }
    }

    function score(text_){
        text_='0000000'+text_;
        oScore.text=text_.substr(-6);
    }

}


