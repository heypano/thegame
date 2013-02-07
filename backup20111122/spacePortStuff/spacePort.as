

import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

public var spacePortContainer:Sprite;


public function initSpacePort():void{
	currentState="SpacePort";
	spacePortContainer = new Sprite();
	fillspacePortContainer();
	stage.focus=stage;
	stage.addEventListener(KeyboardEvent.KEY_DOWN,spacePortKeyboard);	
	//trace(dressYourSpaceShipButton.label.text);
	
	}

public function fillspacePortContainer():void{
	spaceShip.visible=false;
	spacePortBack.visible=true;
	dressSpaceshipButton.visible=true;
	dressSpaceshipButton.addEventListener(MouseEvent.CLICK,spacePortButtons);
	spacePortBack.addEventListener(MouseEvent.CLICK,spacePortToMap);
	spacePortContainer.addChild(dressSpaceshipButton);
	spacePortContainer.addChild(spacePortBack);
	this.addChild(spacePortContainer);
}

public function spacePortToMap(event:Event):void{
	leaveSpacePort();
	initMap();
	}

public function spacePortButtons(event:MouseEvent):void{
	//trace("You clicked "+event.target.name);
	if(event.target==dressSpaceshipButton){
		leaveSpacePort();
		initdressUpSpaceship();
		}

	}

public function spacePortKeyboard(event:KeyboardEvent):void{
	switch(event.keyCode){	
		case Keyboard.ESCAPE :
			leaveSpacePort();
			initMap();
		default:
			break;
	}
	
	
}

public function leaveSpacePort():void{ //What do we have to do when we leave the spacePort in any way?
	stage.removeEventListener(KeyboardEvent.KEY_DOWN,spacePortKeyboard);
	dressSpaceshipButton.removeEventListener(MouseEvent.CLICK,spacePortButtons);
	spacePortBack.removeEventListener(MouseEvent.CLICK,spacePortToMap);
	hideAndRemove(spacePortContainer);
	}


