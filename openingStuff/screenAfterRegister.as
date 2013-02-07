import flash.events.Event;
import flash.events.MouseEvent;


public function initScreenAfterRegister():void{
	currentState="screenAfterRegister";
	stage.focus=stage;
	registerHeyText.text="Hey "+playerName+"!\n" +
		"Welcome to THE GAME!!\n" +
		"Your goal is to have as much fun as possible.\n" +
		"The evil warlord Mr. Guhahahaha is throwing all kinds of space trash all over the universe!!!!\n" +
		"Get a spaceship and use your lasso to gather as much debris as possible so that we can have a clean universe!\n" +
		"I will reward you for your efforts...\n\n" +
		"Sincerely yours,\n" +
		"The good guy.";
	screenAfterRegisterForwardBTN.addEventListener(MouseEvent.CLICK,goAfterScreenAfterRegister);
	screenAfterRegisterContainer.visible=true;
	}

public function goAfterScreenAfterRegister(event:Event):void{
	leaveScreenAfterRegister();
	initScreenAfterRegister2();

	}

public function leaveScreenAfterRegister():void{
	screenAfterRegisterForwardBTN.removeEventListener(MouseEvent.CLICK,goAfterScreenAfterRegister);
	hideAndRemove(screenAfterRegisterContainer);
	/*removestuff Container*/
	var originalNumChildren:int=screenAfterRegisterContainer.numChildren;
	for(var i:int=originalNumChildren-1;i>=0;i--) // check to see if it collides with anything
	{	
		screenAfterRegisterContainer.removeChildAt(i);
	}
	}