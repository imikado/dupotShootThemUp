import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id:startGame
    width: root.oGame.width
    height: root.oGame.height
    color:"#1868b2"

    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:root.oGame.convert(400)
        height:root.oGame.convert(650)
        source:"startGame.png"
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
        fillMode: Image.PreserveAspectFit





    }

    Rectangle{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: root.oGame.convert(208)
        height: root.oGame.convert(78)

        color:"transparent"
        Image{

            source:"btn-jouer.png"

            MouseArea{
                onClicked: die();
                anchors.fill: parent
            }
        }

    }

    function die(){
        destroy();
        root.oGame.playGame();

    }


}

