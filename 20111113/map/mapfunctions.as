import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

import map.MapBorder;
import map.Obstacle;
import map.SpaceShip;

public var mapContainer:Sprite;
public var spaceShip:SpaceShip;
public var arrayOfObstacles:Array=new Array();
public var tempObs:Obstacle;
public var mapBorder:MapBorder;
public var theStage:Stage = stage;

public function initMap(){
	mapContainer = new Sprite();
	spaceShip = new SpaceShip();
	mapBorder = new MapBorder();
	mapBorder.x=mapBorder.width/2;
	mapBorder.y=mapBorder.height/2;
	fillMapContainer();
	makeItMove(spaceShip);
	stage.focus=stage;
	currentMovingObject=spaceShip;
	}

public function fillMapContainer(){
	thesun.visible=true;
	mapContainer.addChild(thesun);
	mapContainer.addChild(spaceShip);
	mapContainer.addChild(mapBorder);
	mapContainer.addChild(alertForEvilDude);
	
	/*
	tempObs=new Obstacle(600,600,50,50);
	mapContainer.addChild(tempObs);
	mapContainer.addChild(tempObs.bound);
	arrayOfObstacles.push(tempObs.bound);
	
	tempObs=new Obstacle(0,0,50,50);
	mapContainer.addChild(tempObs);
	mapContainer.addChild(tempObs.bound);
	arrayOfObstacles.push(tempObs.bound);
	
	tempObs=new Obstacle(500,200,50,50);
	mapContainer.addChild(tempObs);
	mapContainer.addChild(tempObs.bound);
	arrayOfObstacles.push(tempObs.bound);
	
	tempObs=new Obstacle(50,600,50,50);
	mapContainer.addChild(tempObs);
	mapContainer.addChild(tempObs.bound);
	arrayOfObstacles.push(tempObs.bound);
	
	tempObs=new Obstacle(600,50,50,50);
	mapContainer.addChild(tempObs);
	mapContainer.addChild(tempObs.bound);
	arrayOfObstacles.push(tempObs.bound);
	tempObs=null;*/
	
	this.addChild(mapContainer);
}

//Hides-displays the evil dude Alert
public function triggerEvilDudeAlert():void{
	if(alertForEvilDude.visible==true){
		alertForEvilDude.visible=false;
		theStage.removeEventListener(KeyboardEvent.KEY_DOWN,hideEvilDudeAlert);
		theStage.removeEventListener(MouseEvent.MOUSE_UP,hideEvilDudeAlert);
	}
	else {
		alertForEvilDude.visible=true;
		theStage.addEventListener(KeyboardEvent.KEY_DOWN,hideEvilDudeAlert);
		theStage.addEventListener(MouseEvent.MOUSE_UP,hideEvilDudeAlert);
	}
}

//Hides the evil dude alert
public function hideEvilDudeAlert(event:Event):void{
	if(event.type==KeyboardEvent.KEY_DOWN){ //keyboard event
		var kev:KeyboardEvent = event as KeyboardEvent;
		if((kev.charCode!=Keyboard.UP)&&(kev.charCode!=Keyboard.DOWN)&&(kev.charCode!=Keyboard.LEFT)&&(kev.charCode!=Keyboard.RIGHT)){
			alertForEvilDude.visible=false;	
			}
		}
	else{ //mouseEvent
		alertForEvilDude.visible=false;	
		}
	}



