import QtQuick 2.0


Rectangle {
    visible:true
    width:mainWindow.oGame.calcul(80)
    height:mainWindow.oGame.calcul(80)
    color: "transparent"

    AnimatedSprite {
            id: sprite
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/boomSprite.png"
            frameCount: 3
            frameRate: 1/2
            frameSync: true
            frameWidth:  80
            frameHeight: 80
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




    function die(){
        destroy();
        console.debug('boom ended ');
    }


}
