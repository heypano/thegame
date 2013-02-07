
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;


public function hideAndRemove(container:DisplayObjectContainer):void{
	container.visible=false;
	for(var i:uint=0;i<container.numChildren;i++)
	{
		container.removeChildAt(i);
	}
	this.removeChild(container);//remove the thing itself
}

//This function will hide all things that need to be hidden when the game starts
public function hideStuff():void{
	thesun.visible=false;
	alertForEvilDude.visible=false;
	

	}



/*stuff that has to do with moving items*/

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
		/*if(hasCollided&&(doesThisThingCollideWithAnythingInThisArray(currentMovingObject.bound,arrayOfObstacles))){currentMovingObject.x=oldx;}*/		
		currentMovingObject.y += 3*speed*Math.sin(Math.PI*currentMovingObject.rotation/180);
		/*if(hasCollided&&(doesThisThingCollideWithAnythingInThisArray(currentMovingObject.bound,arrayOfObstacles))){currentMovingObject.y=oldy;}hasCollided=false;*/
		}
	if(downPressed){
		currentMovingObject.x -= 2*speed*Math.cos(Math.PI*currentMovingObject.rotation/180);
		/*if(hasCollided&&(doesThisThingCollideWithAnythingInThisArray(currentMovingObject.bound,arrayOfObstacles))){currentMovingObject.x=oldx;}*/
		currentMovingObject.y -= 2*speed*Math.sin(Math.PI*currentMovingObject.rotation/180);
		/*if(hasCollided&&(doesThisThingCollideWithAnythingInThisArray(currentMovingObject.bound,arrayOfObstacles))){currentMovingObject.y=oldy;}hasCollided=false;*/
	}
	//if(collidesWithStuff(currentMovingObject,currentMovingObject.parent))hasCollided=true;
	
	
	
	//THINGS FOR THE SPACESHIP IN THE MAP --maybe I need to have states instead of labels
	if(currentMovingObject.label=="spaceShip"){ //This means that we're in the map
		//Alert for the evil dude
		if(currentMovingObject.hitTestObject(thesun.bound)){
			alertForEvilDude.visible=true;
			trace(currentMovingObject.getBounds(stage));
			trace(thesun.bound.getBounds(stage));
		}
		else{
			alertForEvilDude.visible=false;
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
			trace('Keeping inside the stage');
		}
		else if(item.x>stage.stageWidth-item.width/2){
			item.x=stage.stageWidth-item.width/2;
			trace('Keeping inside the stage');
		}
		if(item.y<item.height/2){
			item.y=item.height/2;
			trace('Keeping inside the stage');
		}
		else if (item.y>stage.stageHeight-item.height/2){
			item.y=stage.stageHeight-item.height/2;
			trace('Keeping inside the stage');
		}
		
	}



//This is not working because of the bounding boxes
public function collidesWithStuff(item:DisplayObject,container:DisplayObjectContainer):Boolean{
	for(var i:uint=0;i<container.numChildren;i++) // check to see if it collides with anything
		{
			if(container.getChildIndex(item)==i)continue; // we don't want to check if it collides with itself.
			if(item.hitTestObject(container.getChildAt(i)))return true;		
		}
		return false;
}


public function doesThisThingCollideWithAnythingInThisArray(item:DisplayObject,array:Array):Boolean{ //don't use the object.
	for(var i:uint=0;i<array.length;i++) // check to see if it collides with anything
	{
		if(item.hitTestObject(array[i])){
			trace("hit"+array[i]);
			return true;
		}		
	}
	return false;
	}


