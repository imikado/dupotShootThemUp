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
            font.pointSize: 22
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

        Bouton{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            _width: mainWindow.oGame.calcul(291)
            _height: mainWindow.oGame.calcul(33)
            _text: qsTr("Re-Jouer!")
            _link:mainWindow.oGame.pageGameStart
        }

        Bouton{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            anchors.verticalCenterOffset: mainWindow.oGame.calcul(50)

            _width: mainWindow.oGame.calcul(291)
            _height: mainWindow.oGame.calcul(33)
            _text: qsTr("Retour au menu")
            _link:mainWindow.oGame.pageMenu
        }

    }

    function score(text_){
        text_='0000000'+text_;
        oScore.text=text_.substr(-6);
    }

}


