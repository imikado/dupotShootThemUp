import QtQuick 2.3
import QtQuick.Window 2.2


import "/js/game.js" as Game

Window{
    id:mainWindow
    visible: true



    property var oGame

    contentOrientation :Qt.PortraitOrientation

    Rectangle{
        id:canvas
        color:"#ff22ff"
    }

    function initApplication(){
        oGame=Game;
        //oGame.start(Screen.width,Screen.height);
        oGame.start(300,450);

        width=mainWindow.oGame.width;
        height=mainWindow.oGame.height;

        canvas.width=width;
        canvas.height=height;
    }

    Timer{
        id:timerEnemy
        interval:2000
        running: false
        repeat: true
        onTriggered:  mainWindow.oGame.addEnemy();
    }

    Component.onCompleted: initApplication()
}

/*
Window {
    id:mainWindow
    visible: true

    property var oGame

    contentOrientation :Qt.PortraitOrientation





    GameOver{
        id:oGameOver
    }

    Scene{
        id:oScene
    }

    Menu{
        id:oMenu
    }

    Splashscreen{
        id:oSplashscreen
    }



    function initApplication(){
        this.oGame=Game;
        //this.oGame.start(Screen.width,Screen.height);
        this.oGame.start(300,400);
    }

    Timer{
        id:timerEnemy
        interval:2000
        running: false
        repeat: true
        onTriggered:  mainWindow.oGame.addEnemy();
    }

   // Component.onStatusChanged:  initApplication()
}
*/
