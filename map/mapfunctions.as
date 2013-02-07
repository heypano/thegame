import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

import map.*;


public var arrayOfObstacles:Array=new Array();
public var tempObs:Obstacle;
public var theStage:Stage = stage;

public function initMap(){
	currentState="Map";
	makeItMove(spaceShip);
	stage.focus=stage;
	currentMovingObject=spaceShip;
	spaceShip.prepare();
	spaceShip.visible=true;
	mapContainer.visible=true;
	}








