import QtQuick 2.0

Rectangle {
    visible:true
    width: mainWindow.oGame.calcul(80)
    height: mainWindow.oGame.calcul(117)
    color:"transparent"

    function die(){
        destroy();
    }

    AnimatedSprite {
            id: sprite
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "/images/lifeDownSprite.png"
            frameCount: 3
            frameSync: true
            frameWidth: 80
            frameHeight: 117
            frameRate: 1/2
            loops: 3

            Sprite{
                frameX:0
            }
            Sprite{
                frameX:80
            }
            Sprite{
                frameX:160
            }


            onRunningChanged:{
                if (!running) {
                   die();
                }


            }
        }
}
