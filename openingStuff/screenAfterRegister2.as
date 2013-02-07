import flash.events.Event;
import flash.events.MouseEvent;


public function initScreenAfterRegister2():void{
	currentState="screenAfterRegister2";
	stage.focus=stage;
	screenAfterRegisterContainer2hey.text="Hey "+playerName;
	screenAfterRegisterForwardBTN2.addEventListener(MouseEvent.CLICK,goAfterScreenAfterRegister2);
	screenAfterRegisterContainer2.visible=true;
	}

public function goAfterScreenAfterRegister2(event:Event):void{
	leaveScreenAfterRegister2();
	initMap();

	}

public function leaveScreenAfterRegister2():void{
	screenAfterRegisterForwardBTN2.removeEventListener(MouseEvent.CLICK,goAfterScreenAfterRegister2);
	hideAndRemove(screenAfterRegisterContainer2);
	/*removestuff Container*/
	var originalNumChildren:int=screenAfterRegisterContainer2.numChildren;
	for(var i:int=originalNumChildren-1;i>=0;i--) // check to see if it collides with anything
	{	
		screenAfterRegisterContainer2.removeChildAt(i);
	}
	}