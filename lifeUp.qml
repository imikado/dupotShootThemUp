import QtQuick 2.0

Rectangle {
    width: root.oGame.convert(40)
    height: root.oGame.convert(40)
    color:"transparent"



    AnimatedSprite {
            width: root.oGame.convert(40)
            height: root.oGame.convert(40)
            anchors.centerIn: parent
            source: "lifeUp.png"
            frameCount: 1
            frameSync: true
            frameWidth: 50
            frameHeight: 40
            frameRate: 1
            loops:0

            Sprite{
                frameX:0
            }

        }
}

