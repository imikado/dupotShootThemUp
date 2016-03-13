import QtQuick 2.0

Rectangle {
    id:logo
    width: root.oGame.width
    height: root.oGame.height
    color:'#d95e22'

    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:root.oGame.convert(237)
        height:root.oGame.convert(105)
        source:'logoMobileDupot.png'
        horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
             fillMode: Image.PreserveAspectFit
    }

    function die(){
        destroy();
    }

    Timer {

        interval: 3000
        running: true
        repeat: false
        onTriggered: die();
    }
}


