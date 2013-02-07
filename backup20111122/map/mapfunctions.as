import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

import map.*;
public var mapContainer:Sprite;

public var arrayOfObstacles:Array=new Array();
public var tempObs:Obstacle;
public var theStage:Stage = stage;

public function initMap(){
	currentState="Map";
	mapContainer = new Sprite();
	fillMapContainer();
	makeItMove(spaceShip);
	stage.focus=stage;
	currentMovingObject=spaceShip;
	}

public function fillMapContainer(){
	spaceShip.visible=true;
	mapBorder.visible=true;
	thesun.visible=true;
	theLassoPlanet.visible=true;
	theSpacePort.visible=true;
	mapContainer.addChild(theLassoPlanet);
	mapContainer.addChild(theSpacePort);
	mapContainer.addChild(thesun);
	mapContainer.addChild(mapBorder);
	mapContainer.addChild(alertForEvilDude);
	
	
	
	this.addChild(mapContainer);
}






