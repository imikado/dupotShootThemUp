import QtQuick 2.0

Rectangle {
    width: root.oGame.convert(40)
    height: root.oGame.convert(40)
    color:"transparent"

    function die(){
        destroy();
    }

    AnimatedSprite {
            width: root.oGame.convert(40)
            height: root.oGame.convert(40)
            anchors.centerIn: parent
            source: "lifeUp.png"
            frameCount: 2
            frameWidth: 50
            frameHeight: 40
            loops: 1

            onRunningChanged:{
                if (!running) {
                   die();
                }


            }


        }
}

