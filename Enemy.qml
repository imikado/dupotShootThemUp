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
            source: "/images/BadSprite.png"
            frameCount: 3
            frameRate: 1/2
            frameSync: true
            frameWidth:  80
            frameHeight: 80


            Sprite{
                frameX:0
            }
            Sprite{
                frameX:80
            }
            Sprite{
                frameX:160
            }

        }

    MouseArea{
        anchors.fill: parent
        onClicked:playerKilled()
    }

    function playerKilled(){
        destroy();
        mainWindow.oGame.scoreUp(x,y);
        console.debug('player killed enemy');
    }
    function die(){
        destroy();
        mainWindow.oGame.lifeDown(x,y);
        console.debug('enemy moved down ');
    }

    PropertyAnimation on y {
        to: mainWindow.oGame.height;
        duration: 5000
        onRunningChanged:{
            if(!running) {
               die();
            }
        }

    }
}
