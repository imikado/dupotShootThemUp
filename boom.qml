import QtQuick 2.0

Rectangle {
    width: root.oGame.convert(80)
    height: root.oGame.convert(80)
    color:"transparent"

    function die(){
        destroy();
    }

    AnimatedSprite {
            id: sprite
            width: root.oGame.convert(80)
            height: root.oGame.convert(80)
            anchors.centerIn: parent
            source: "boomSprite.png"
            frameCount: 3
            frameSync: true
            frameWidth: 80
            frameHeight: 80
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

