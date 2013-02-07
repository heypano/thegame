import flash.events.MouseEvent;
import flash.ui.Mouse;

public var lassoContainer:Sprite;

public function initLassoingGame():void{
	currentState="LassoStuff";
	lassoContainer = new Sprite();
	//spaceShip = new SpaceShip();
	fillLassoContainer();
	//makeItMove(spaceShip);
	stage.focus=stage;
	//currentMovingObject=spaceShip;
	
}

public function fillLassoContainer():void{
	//lassoContainer.addChild(spaceShip);
	spaceShip.visible=true;
	lassoBack.visible=true;
	lassoContainer.addChild(lassoBack);
	lassoBack.addEventListener(MouseEvent.CLICK,leaveLasso);
	this.addChild(lassoContainer);
}

public function leaveLasso(event:Event=null):void{
	hideAndRemove(lassoContainer);
	lassoBack.removeEventListener(MouseEvent.CLICK,leaveLasso);
	initMap();
	}

