import QtQuick 2.0

Rectangle{
    visible:true
    width:root.oGame.convert(80)
    height:root.oGame.convert(80)
    x:120
    color: "transparent"

    AnimatedSprite {
            id: sprite
            width: root.oGame.convert(80)
            height: root.oGame.convert(80)
            anchors.centerIn: parent
            source: "BadSprite.png"
            frameCount: 3
            frameSync: true
            frameWidth: 80
            frameHeight: 80
            frameRate: 1/2

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

    function kill(){
        console.log("kill myself");
        root.oGame.scoreUp(x,y);
        destroy();
    }
    function clear(){
        destroy();
    }

    function die(){
        root.oGame.lifeDown(x,y);
        destroy();
    }

    MouseArea {
        anchors.fill: parent
        onClicked: kill()
    }

    PropertyAnimation on y {
        to: canvas.height-root.oGame.convert(80);
        duration: 5000
        onRunningChanged:{

            if(!running) {

               die();
            }


        }


    }
    Timer{
        interval: 1000
        running:true
        repeat:true
        onTriggered: {
            if(root.oGame.stateGame===false) {
                console.log('die');
                clear();
            }
        }
    }

}
