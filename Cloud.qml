import QtQuick 2.0
import QtQuick.Controls 1.5


Rectangle {
    visible:true
    id:rect
    color: "transparent"
    width:mainWindow.oGame.calcul(225)
    height:mainWindow.oGame.calcul(134)
    z:0
    property int x2:0
    property int duration2:0


    Image{
        source:"/images/cloud.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:parent.width
        height:parent.height
    }



    SequentialAnimation on x {
        id: animate
        running:false
        loops: Animation.Infinite
        PropertyAnimation {easing.type: Easing.InCubic; duration:duration2; from:x2; to: mainWindow.oGame.calcul(200)+parent.width }
    }

    function goTo(x2_,duration_){
        x2=x2_;
        duration2=duration_;
        animate.start();


    }


}
