import QtQuick 2.0


Rectangle {
    visible:true
    width:mainWindow.oGame.calcul(50)
    height:mainWindow.oGame.calcul(40)
    color: "transparent"

    AnimatedSprite {
        id: sprite
        width:parent.width
        height:parent.height
        anchors.centerIn: parent
        source: "/images/lifeUp.png"
        frameCount: 2
        frameWidth:  50
        frameHeight: 40
        paused:true

        Sprite{
            frameX:0
        }
        Sprite{
            frameX:50
        }

    }

    function on(){
         console.debug('pass to on');
        sprite.setCurrentFrame(0)
    }
    function off(){
        console.debug('pass to off');
        sprite.setCurrentFrame(1)
    }



}

