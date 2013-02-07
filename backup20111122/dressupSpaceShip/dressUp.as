
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.MouseEvent;

public var dressUpSpaceshipContainer:Sprite;
public var oldScaleX;
public var oldScaleY;
public var currentMoney:Number; 
public var buttonVariableJustForHints:SimpleButton;

public function initdressUpSpaceship():void{
	currentState="dressUpSpaceship";
	dressUpSpaceshipContainer = new Sprite();
	currentMoney= Number(money.text);
	filldressUpSpaceshipContainer();
	stage.focus=stage;
	stage.addEventListener(KeyboardEvent.KEY_DOWN,dressUpKeyboard);
	spaceShip.visible=true;
	spaceShip.rotation=-90;
	spaceShip.x=spaceShip.width/2+120;
	spaceShip.y=spaceShip.height/2+100;
	oldScaleX=spaceShip.scaleX;
	oldScaleY=spaceShip.scaleY;
	spaceShip.scaleX=0.6;
	spaceShip.scaleY=0.6;
	
}

public function filldressUpSpaceshipContainer():void{
	
	spaceShipUpgrade1.visible=true;
	spaceShipUpgrade2.visible=true;
	spaceShipUpgrade3.visible=true;
	spaceShipUpgrade4.visible=true;
	spaceShipUpgrade5.visible=true;
	dressupBack.visible=true;
	money.visible=true;
	moneylabel.visible=true;
	spaceShipUpgrade1.addEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade2.addEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade3.addEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade4.addEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade5.addEventListener(MouseEvent.CLICK,upgrade);
	dressupBack.addEventListener(MouseEvent.CLICK,leaveDressUpSpaceShip)
	buttonVariableJustForHints=spaceShipUpgrade1;
	//buttonVariableJustForHints.
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade1);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade2);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade3);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade4);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade5);
	dressUpSpaceshipContainer.addChild(money);
	dressUpSpaceshipContainer.addChild(moneylabel);
	dressUpSpaceshipContainer.addChild(dressupBack);
	this.addChild(dressUpSpaceshipContainer);
}

public function upgrade(event:MouseEvent):void{
	var thing:DisplayObject;
	var button:SimpleButton=event.target as SimpleButton;
	var price:Number;
	
	if(button==spaceShipUpgrade1 ){
		thing=spaceShip.spaceShip_upgrade_fire;
		price=2000;
	}
	else if(button==spaceShipUpgrade2 ){
		thing=spaceShip.spaceShip_upgrade_rockets;	
		price=3000;
	}
	else if(button==spaceShipUpgrade3 ){
		thing=spaceShip.spaceShip_upgrade_wings;	
		price=1500;
	}
	else if(button==spaceShipUpgrade4 ){
		thing=spaceShip.spaceShip_upgrade_lassoes;	
		price=1000;
	}
	else if(button==spaceShipUpgrade5 ){
		thing=spaceShip.spaceShip_upgrade_forcefield;	
		price=4000;
	}
	else trace("um...invisible button or something was pressed");
	
	//check if upgrade is possible
	//button.gotoAndStop(2);
	if(thing.visible==false){
		thing.visible=true;
		currentMoney-=price;
	}
	else{
		thing.visible=false;
		currentMoney+=price;
	}
	money.text=currentMoney.toString();
	decideWhichSpaceShipDressUpButtonsAreVisible();
}

public function decideWhichSpaceShipDressUpButtonsAreVisible():void{
	if((currentMoney>=2000)||(spaceShip.spaceShip_upgrade_fire.visible==true)){//if we have enough money to buy it or if the user is trying to remove it
		spaceShipUpgrade1.enabled=true;
		spaceShipUpgrade1.addEventListener(MouseEvent.CLICK,upgrade);
	} 
	else {
		spaceShipUpgrade1.enabled=false;
		spaceShipUpgrade1.removeEventListener(MouseEvent.CLICK,upgrade);
	}
	if((currentMoney>=3000)||(spaceShip.spaceShip_upgrade_rockets.visible==true)){
		spaceShipUpgrade2.enabled=true;	
		spaceShipUpgrade2.addEventListener(MouseEvent.CLICK,upgrade);
	}
	else {
		spaceShipUpgrade2.enabled=false;
		spaceShipUpgrade2.removeEventListener(MouseEvent.CLICK,upgrade);
	}
	if((currentMoney>=1500)||(spaceShip.spaceShip_upgrade_wings.visible==true)){
		spaceShipUpgrade3.enabled=true;	
		spaceShipUpgrade3.addEventListener(MouseEvent.CLICK,upgrade);
	}
	else{
		spaceShipUpgrade3.enabled=false;
		spaceShipUpgrade3.removeEventListener(MouseEvent.CLICK,upgrade);
	} 
	if((currentMoney>=1000)||(spaceShip.spaceShip_upgrade_lassoes.visible==true)){
		spaceShipUpgrade4.enabled=true;	
		spaceShipUpgrade4.addEventListener(MouseEvent.CLICK,upgrade);
	}
	else {
		spaceShipUpgrade4.enabled=false;
		spaceShipUpgrade4.removeEventListener(MouseEvent.CLICK,upgrade);
	}
	if((currentMoney>=4000)||(spaceShip.spaceShip_upgrade_forcefield.visible==true)){
		spaceShipUpgrade5.enabled=true;	
		spaceShipUpgrade5.addEventListener(MouseEvent.CLICK,upgrade);
	}
	else {
		spaceShipUpgrade5.enabled=false;
		spaceShipUpgrade5.removeEventListener(MouseEvent.CLICK,upgrade);
	}
}

public function dressUpKeyboard(event:KeyboardEvent):void{
	switch(event.keyCode){	
		case Keyboard.ESCAPE :
			leaveDressUpSpaceShip();
			initSpacePort();
		default:
			break;
	}
}

public function leaveDressUpSpaceShip(event:Event=null):void{
	spaceShip.scaleX=oldScaleX;
	spaceShip.scaleY=oldScaleY;
	stage.removeEventListener(KeyboardEvent.KEY_DOWN,dressUpKeyboard);
	spaceShipUpgrade1.removeEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade2.removeEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade3.removeEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade4.removeEventListener(MouseEvent.CLICK,upgrade);
	spaceShipUpgrade5.removeEventListener(MouseEvent.CLICK,upgrade);
	dressupBack.removeEventListener(MouseEvent.CLICK,leaveDressUpSpaceShip)
	hideAndRemove(dressUpSpaceshipContainer);
	initSpacePort();
}

