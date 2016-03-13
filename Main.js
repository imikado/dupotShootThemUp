function Game(width_,height_){

    this.convert=function(value_){
        return value_*this.iRatio;
    }

    this.convertNegative=function(value_){
        return 0;
    }
    this.addEnemy=function(){

        var iMax=1;
        if(this.score > 30){
            iMax=4;
        }else if(this.score > 20){
            iMax=3;
        }else if(this.score > 10){
            iMax=2;
        }

        for(var i=0;i<iMax;i++){
            var oEnemy=new Enemy(this.xEnemy,20);

            this.tEnemy.push(oEnemy);

            this.xEnemy+=oEnemy.width*2;

            if(this.xEnemy+oEnemy.width > this.width){
                this.xEnemy=0;
            }
        }

    }
    this.lifeDown=function(x_,y_){
        if(this.stateGame===false){
            return;
        }
        if(this.iLife>0){
            this.iLife-=1;
        }

        var oLifeDown=new LifeDown(x_,y_);

        var o=new LifeUpOff(this.tUp[this.iLife].object.x,this.tUp[this.iLife].object.y);
        console.log('life -1: i:'+this.iLife+' x:'+this.tUp[this.iLife].object.x);
        this.tUp[this.iLife].object.destroy();




        if(this.iLife===0){
            this.gameOver();
        }
    }
    this.scoreUp=function(x_,y_){
        this.score+=1;
        scoreDiv.text=this.score;

        var oBoom=new Boom(x_,y_);


    }
    this.setupLife=function(){
        for(var i=0;i<this.iLife;i++){
            var oUp=new LifeUp(i* this.convert(42),0);
            this.tUp.push(oUp);
        }

        this.startCloud();

    }
    this.getWidth=function(){
        return this.width;
    }
    this.startCloud=function(){
        var oCloud2=new Cloud(0,this.convert((300*this.iCloud)+100));
        this.iCloud++;

        if(this.iCloud>2){
            timerCloud.stop();
            this.iCloud=0;
        }
        console.log('startCloud '+this.iCloud);
    }
    this.playGame=function(){
        this.score=0;
        scoreDiv.text=this.score;

        this.xEnemy=0;

        this.iLife=5;

        this.tUp=new Array();

        this.tEnemy=new Array();

        this.stateGame=true;

        this.setupLife();

        timerEnemy.start();
    }
    this.gameOver=function(){

        this.stateGame=false;


        this.xEnemy=0;
        this.iLife=5;



        var oComponent=Qt.createComponent('gameOver.qml');
        var oLogo=oComponent.createObject(root);

        oLogo.visible=true;

        oLogo.score(this.score);

        timerEnemy.stop();
    }

    this.iCloud=0;

    this.score=0;

    this.xEnemy=0;

    this.iLife=5;

    this.tUp=new Array();

    this.tEnemy=new Array();

    this.stateGame=true;

    this.originalWidth=720;
    this.originalHeight=960;

    if(width_> height_){
        this.width=height_*(this.originalWidth/this.originalHeight)
    }else{
        this.width=width_;
    }
    this.height=height_;

    this.iRatio=this.width/this.originalWidth;



}
function Enemy(x_,y_){

    this.component =   Qt.createComponent( "EnemyQml.qml");
    this.object=this.component.createObject(canvas,{"x": x_, "y": 0});

    this.width=root.oGame.convert(80);

}
function Boom(x_,y_){
    this.component = Qt.createComponent("boom.qml");
    this.component.createObject(canvas,{"x": x_, "y": y_});

    this.width=root.oGame.convert(80);
}
function LifeDown(x_,y_){
    this.component = Qt.createComponent("lifeDown.qml");
    this.component.createObject(canvas,{"x": x_, "y": y_});

    this.width=root.oGame.convert(80);
}
function LifeUpOff(x_,y_){
    console.log('creation lifeUp off');

    this.component = Qt.createComponent("lifeUpOff.qml");
    this.object=this.component.createObject(canvas,{"x": x_, "y": y_});

    //this.width=root.oGame.convert(80);
}
function LifeUp(x_,y_){
    this.component = Qt.createComponent("lifeUp.qml");
    this.object=this.component.createObject(canvas,{"x": x_, "y": y_});

    //this.width=root.oGame.convert(80);
}
function Cloud(x_,y_){
    this.component = Qt.createComponent("cloud.qml");
    this.object=this.component.createObject(canvas,{"x": x_, "y": y_});

    //this.width=root.oGame.convert(80);
}

function startGame(width_,height_){
    root.oGame=new Game(width_,height_);


    //debug('start width:'+width_+' height:'+height_ );

    var oComponent2=Qt.createComponent('startGame.qml');
    var oStartGame=oComponent2.createObject(root);

    oStartGame.visible=true;


    var oComponent=Qt.createComponent('logo.qml');
    var oLogo=oComponent.createObject(root);

    oLogo.visible=true;

}


function debug(text_){
    return;
    //debugDiv.text=text_;
    //console.log(text_);
}
