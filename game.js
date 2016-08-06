var width;
var height;

var originalWidth;
var originalHeight;

var iScore=0;
var iLife;

var tLife=new Array();

var iRatio;

var oPageSplashscreen;
var oPageMenu;
var oPageScene;
var oPageGameover;

function start(width_,height_){

    originalWidth=480;
    originalHeight=680;

    if(width_> height_){
        width=height_*(this.originalWidth/this.originalHeight)
    }else{
        width=width_;
    }

    height=width*(this.originalHeight/this.originalWidth);
    if(height<height_){
        height=height_;
    }

    iRatio=this.width/this.originalWidth;

    this.pageSplashscreen();


}
function ComponentQml(src_,x_,y_){
    this.oComponent =   Qt.createComponent( src_);
    this.object=this.oComponent.createObject(oPageScene,{"x": x_, "y": y_});

    if( this.oComponent.status === Component.Error ){
        console.debug("Error:"+ this.oComponent.errorString() );
    }
}




function initLife(){
    for(var i=0;i<iLife;i++){
        var oLife=new ComponentQml('/Life.qml',calcul(40)*i,0);
        oLife.object.on();

        tLife[i]=oLife;
    }
}



function startParty(){
    iLife=4;
    tLife=null;
    tLife=new Array();
    iScore=0;

    initLife();

    timerEnemy.start();

    var oCloud=new Cloud(calcul(-250),calcul(20),9000);

    var oCloud2=new Cloud(calcul(-300),calcul(150),18000);

    var oCloud3=new Cloud(calcul(-700),calcul(450),9000);
}
var xEnemy=0;
var iMax=1;
var iDecalX=0;
function addEnemy(){

    var widthEnemy=mainWindow.oGame.calcul(80);

    iDecalX=(widthEnemy*2);

    if(iScore>200 && iMax <7){
        iMax=parseInt(iScore/100);
        iDecalX=widthEnemy+10;

    }

    for(var i=0;i<iMax;i++){
        var oEnemy=new Enemy(xEnemy,0);

        xEnemy+=iDecalX;

        if(xEnemy+widthEnemy > this.width){
            console.debug('zero');
            xEnemy=0;
        }
    }

    if(iMax==1){
        iMax=2;
    }else{
        iMax=1;
    }
}
function scoreUp(x_,y_){
    var oBoom=new ComponentQml('/Boom.qml',x_,y_);

    iScore+=10;

    oPageScene.score(iScore);

    console.debug('new score: '+iScore);
}
function lifeDown(x_,y_){
    var oDie=new ComponentQml('/LifeDown.qml',x_,y_- calcul(117));

    console.debug('tLife '+iLife+' off()');
    tLife[iLife-1].object.off();

    iLife--;

    if(iLife===0){
        pageGameOver();
    }
}

function calcul(iValue_){
    return (iValue_*iRatio);
}

function pageSplashscreen(){
    oPageSplashscreen=mainWindow.launchPage('qrc:/Splashscreen.qml');
}
function pageMenu(){
    oPageMenu=mainWindow.launchPage('qrc:/Menu.qml',0,0);
}
function pageGameStart(){
    oPageScene=mainWindow.launchPage('qrc:/Scene.qml',0,0);

    startParty();
}
function pageGameOver(){
    timerEnemy.stop();



    mainWindow.popPage();

    oPageGameover=mainWindow.launchPage('qrc:/GameOver.qml',0,0);
    oPageGameover.score(iScore);
}

function resetPages(){

}


//---------------
//-------enemy

function Enemy(x_,y_){
    this.oComponent =   Qt.createComponent( "/Enemy.qml");
    this.object=this.oComponent.createObject(oPageScene,{"x": x_, "y": y_});

    if( this.oComponent.status === Component.Error ){
        console.debug("Error:"+ this.oComponent.errorString() );
    }
}

function Cloud(x_,y_,duration_){
    this.oComponent =   Qt.createComponent( "/Cloud.qml");
    this.object=this.oComponent.createObject(oPageScene,{"x": x_, "y": y_});
    this.object.goTo(x_,duration_);
}
