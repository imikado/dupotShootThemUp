import QtQuick 2.0

Rectangle{
    visible:true
    color:'#d95e22'


    Image{
        id:logo
        width:mainWindow.oGame.calcul(237)
        height:mainWindow.oGame.calcul(105)
        source:"/images/logoMobileDupot.jpg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Timer {
       id:timerSplashscreen
       interval: 4000;
       running: true
       repeat: false
       onTriggered: mainWindow.oGame.pageMenu();
    }




}


