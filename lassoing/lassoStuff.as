import customEvents.CustomEvent;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.ui.Mouse;
import flash.utils.Timer;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import lassoing.DebrisDebris;
import lassoing.DebrisDebris2;
import lassoing.TheLasso;

public var lifeReplenishTimer:Timer;

public function initLassoingGame():void{
	currentState="LassoStuff";
	lassoPoints.text=TheLasso.points.toString();
	//if(!currentMoney)currentMoney;// THIS NEEDS TO GO.
	moneylassoing.text=currentMoney.toString();
	
	stage.focus=stage;
	lassoBack.addEventListener(MouseEvent.CLICK,leaveLasso);
	lassoContainer.addEventListener(CustomEvent.WHATEVER,refreshPoints);
	lassoContainer.visible=true;
	lifeReplenishTimer = new Timer(1000);
	lifeReplenishTimer.addEventListener(TimerEvent.TIMER, replenishLife);
	lifeReplenishTimer.start();
}

public function replenishLife(event:Event=null):void{
	if(lifebar.life.width<393){
		spaceShipLife+=1;
		adjustLifeBar();
		}
	}

public function adjustLifeBar():void{lifebar.life.width=spaceShipLife;}


public function leaveLasso(event:Event=null):void{
	cleanDebris();
	hideAndRemove(lassoContainer);
	lassoBack.removeEventListener(MouseEvent.CLICK,leaveLasso);
	lassoContainer.removeEventListener(CustomEvent.WHATEVER,refreshPoints);
	//Maybe we want the life to keep on replenishing
	//lifeReplenishTimer.removeEventListener(TimerEvent.TIMER, replenishLife); 
	//lifeReplenishTimer.stop();
	initMap();
	}

private function cleanDebris():void{
	var childClassName:String;
	var childType:Class;
	var originalNumChildren:int=lassoContainer.numChildren;
	for(var i:int=originalNumChildren-1;i>=0;i--) // check to see if it collides with anything
	{	
		if(TheLasso.numSpaceDebris<5)break;
		childClassName= getQualifiedClassName( lassoContainer.getChildAt(i) );
		childType= getDefinitionByName( childClassName ) as Class;
		if((childType==DebrisCritter1)||(childType==DebrisCritter2)||(childType==DebrisDebris)||(childType==DebrisDebris2)){
			lassoContainer.removeChildAt(i);
			TheLasso.numSpaceDebris--;
		}
	}
}

private function refreshPoints(event:CustomEvent):void{
	lassoPoints.text=TheLasso.points.toString();
	currentMoney+=event.plus;
	moneylassoing.text=currentMoney.toString();
	}
