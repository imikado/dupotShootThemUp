import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id:gameOver
    width: root.oGame.width
    height: root.oGame.height
    color:"#465973"

    function score(text_){
        scoreDivGameOver.text=text_;
    }

    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:root.oGame.convert(400)
        height:root.oGame.convert(650)
        source:"gameOver.png"
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
        fillMode: Image.PreserveAspectFit


         Row{
             y:0
             height:root.oGame.convert(50)
             anchors.right: parent.right

             Text {
                 id:scoreDivGameOver

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
    }

    Rectangle{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: root.oGame.convert(208)
        height: root.oGame.convert(78)

        color:"transparent"
        Image{

            source:"btn-rejouer.png"

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

