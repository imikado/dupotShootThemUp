import QtQuick 2.0

Rectangle{
    width:root.oGame.convert(225)
    height:root.oGame.convert(134)
    x:0
    y:0
    color:"transparent"
    Image{
        fillMode: Image.PreserveAspectFit
        width:parent.width
        height:parent.height
        source:"cloud.png"
    }

    NumberAnimation on x {
        from:0
        to: root.oGame.getWidth()
        duration: 18000
        loops: Animation.Infinite;
    }
}
