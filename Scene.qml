import QtQuick 2.0
import QtQuick.Controls 1.5
import QtGraphicalEffects 1.0
Rectangle{
    visible:true
    color:'#1868b2'
    width:mainWindow.oGame.width
    height:mainWindow.oGame.height

    Text{
        id:oScore
        text:'000000'
        anchors.right: parent.right
        font.pointSize: 22
        font.bold: true
        color:"white"
    }
    DropShadow {
        anchors.fill: oScore
        horizontalOffset: 3
        verticalOffset: 3
        radius: 1.0
        samples: 8
        color: "#80000000"
        source: oScore
    }

    function score(text_){
        text_='0000000'+text_;
        oScore.text=text_.substr(-6);
    }


}
