import QtQuick 2.0
import QtQuick.Controls 1.5


Rectangle {
    visible:true
    color: "#1868b2"
    width:mainWindow.oGame.width
    height:mainWindow.oGame.height


    Image{
        source:"/images/startGame.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        width:mainWindow.oGame.calcul(400)
        height:mainWindow.oGame.calcul(650)


        Button {
            id: button1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: mainWindow.oGame.calcul(291)
            height: mainWindow.oGame.calcul(33)
            text: qsTr("Jouer!")

            onClicked:mainWindow.oGame.pageGameStart()
        }
    }
}


