
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.ui.Keyboard;

import lassoing.TheLasso;

//Everytime I add something I need to
// • go to generalfunctions->hidestuff and make it not visible
// • add it to the appropriate container
// • make it visible

public function hideAndRemove(container:DisplayObjectContainer):void{
	container.visible=false;
	//Just making it invisible for now
	/*
	for(var i:uint=0;i<container.numChildren;i++)
	{
		container.removeChildAt(i);
	}
	this.removeChild(container);//remove the thing itself
	*/
	}

//This function will hide all things that need to be hidden when the game starts
public function hideStuff():void{
	/*MapStuff*/
	thesun.visible=false;
	alertForEvilDude.visible=false;
	mapBorder.visible=false;
	theLassoPlanet.visible=false;
	theSpacePort.visible=false;
	dressSpaceshipButton.visible=false;
	spaceShipUpgrade1.visible=false;
	spaceShipUpgrade2.visible=false;
	spaceShipUpgrade3.visible=false;
	spaceShipUpgrade4.visible=false;
	spaceShipUpgrade5.visible=false;
	money.visible=false;
	moneylabel.visible=false;
	dressupBack.visible=false;
	spacePortBack.visible=false;
	lassoBack.visible=false;
}


//This function will look into the database and decide what's visible on the spaceship and what's not
public function dressSpaceship():void{
	spaceShip.spaceShip_upgrade_fire.visible=false;
	spaceShip.spaceShip_upgrade_rockets.visible=false;
	spaceShip.spaceShip_upgrade_wings.visible=false;
	spaceShip.spaceShip_upgrade_lassoes.visible=false;
	spaceShip.spaceShip_upgrade_forcefield.visible=false;
	


	}


/* ****Stuff that has to do with moving items**** */

public var upPressed:Boolean=false;
public var downPressed:Boolean=false;
public var leftPressed:Boolean=false;
public var rightPressed:Boolean=false;
public var speed:Number = 1;
public var movingtimer:Timer;
public var rotatingtimer:Timer;
public var hasCollided:Boolean=false;

/*makes an item movable with the keyboard*/
public function makeItMove(item:MovieClip):void{
	currentMovingObject=item;
	stage.addEventListener(KeyboardEvent.KEY_DOWN, keysDown);
	stage.addEventListener(KeyboardEvent.KEY_UP, keysUp);
	movingtimer  = new Timer(10); //this has to do with speed
	movingtimer.addEventListener(TimerEvent.TIMER,forward);
	rotatingtimer  = new Timer(10); //this has to do with speed
	rotatingtimer.addEventListener(TimerEvent.TIMER,turn);
}

public function stopItFromMoving(item:MovieClip):void{
	movingtimer.stop();
	rotatingtimer.stop();
	stage.removeEventListener(KeyboardEvent.KEY_DOWN, keysDown);
	stage.removeEventListener(KeyboardEvent.KEY_UP, keysUp);
	movingtimer.removeEventListener(TimerEvent.TIMER,forward);
	rotatingtimer.removeEventListener(TimerEvent.TIMER,turn);
}

public function keysDown(event:KeyboardEvent):void{
	
	switch(event.keyCode){	
		case Keyboard.RIGHT :
			rightPressed=true;
			rotatingtimer.start();
			break;
		case Keyboard.LEFT :
			leftPressed=true;
			rotatingtimer.start();
			break;
		case Keyboard.UP :
			upPressed=true;
			movingtimer.start();
			break;
		case Keyboard.DOWN :
			downPressed=true;
			movingtimer.start();
			break;
		case Keyboard.SPACE :
			if(currentState=="LassoStuff")fireBullet();
			break;
		case Keyboard.ESCAPE :
			if(currentState=="LassoStuff"){
				//stopItFromMoving(currentMovingObject);
				hideAndRemove(lassoContainer);
				initMap();
			}
			
			
		default:
			break;
	}
	
}

public function keysUp(event:KeyboardEvent):void{
	
	switch(event.keyCode){
		case Keyboard.RIGHT :
			rightPressed=false;
			if(rotatingtimer.running)rotatingtimer.stop();
			break;
		case Keyboard.LEFT :
			leftPressed=false;
			if(rotatingtimer.running)rotatingtimer.stop();
			break;
		case Keyboard.UP :
			upPressed=false;
			if(movingtimer.running)movingtimer.stop();
			break;
		case Keyboard.DOWN :
			downPressed=false;
			if(movingtimer.running)movingtimer.stop();
			break;
		default:
			break;
	}
}

public function forward(event:TimerEvent):void{
	var oldx:Number=currentMovingObject.x;
	var oldy:Number=currentMovingObject.y;
	if(upPressed){
		currentMovingObject.x += 3*speed*Math.cos(Math.PI*currentMovingObject.rotation/180);
		currentMovingObject.y += 3*speed*Math.sin(Math.PI*currentMovingObject.rotation/180);
	}
	if(downPressed){
		currentMovingObject.x -= 2*speed*Math.cos(Math.PI*currentMovingObject.rotation/180);
		currentMovingObject.y -= 2*speed*Math.sin(Math.PI*currentMovingObject.rotation/180);
	}
	
	
	
	//THINGS FOR THE SPACESHIP IN THE MAP --maybe I need to have states instead of labels
	
	if(currentState=="Map"){ //This means that we're in the map
		
		//Alert for the evil dude
		if(currentMovingObject.bound.hitTestObject(thesun.bound)){
			alertForEvilDude.visible=true;
		}
		else{
			alertForEvilDude.visible=false;
		}
		if(upPressed){ //We don't want interaction with the planets if they're backing up
			//Hitting the lasso planet
			if(currentMovingObject.bound.hitTestObject(theLassoPlanet.bound)){
				hideAndRemove(mapContainer);
				initLassoingGame();
			}
			
			//Hitting the Space Port
			if(currentMovingObject.bound.hitTestObject(theSpacePort.bound)){
				hideAndRemove(mapContainer);
				stopItFromMoving(currentMovingObject);
				initSpacePort();
				upPressed=false;
			}
		}
	}
	
	
	
	keepInsideTheStage(currentMovingObject);
}

public function turn(event:TimerEvent):void{
	
	if(rightPressed)currentMovingObject.rotation+=3;
	if(leftPressed)currentMovingObject.rotation-=3;
}
/*Keep this object inside the stage*/
public function keepInsideTheStage(item:MovieClip):void{
	if(item.x<item.width/2){
		item.x=item.width/2;
		//trace('Keeping inside the stage');
	}
	else if(item.x>stage.stageWidth-item.width/2){
		item.x=stage.stageWidth-item.width/2;
		//trace('Keeping inside the stage');
	}
	if(item.y<item.height/2){
		item.y=item.height/2;
		//trace('Keeping inside the stage');
	}
	else if (item.y>stage.stageHeight-item.height/2){
		item.y=stage.stageHeight-item.height/2;
		//trace('Keeping inside the stage');
	}
	
}



private function fireBullet() : void
{
	stage.addChild(new TheLasso(currentMovingObject.x, currentMovingObject.y - 10, currentMovingObject.rotation));
}



