package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Video;
	import flash.net.*;
	import flash.text.engine.SpaceJustifier;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import generalfunctions.*;
	
	import lassoing.*;
	
	import map.*;
	
	public class Main extends MovieClip
	{
		include "./loginregisterpage/loginregisterfunctions.as";
		include "./generalfunctions/generalfunctions.as";
		include "./generalfunctions/visualFunctions.as";
		include "./generalfunctions/generalVariables.as";
		include "./map/mapfunctions.as";
		include "./lassoing/lassoStuff.as";
		include "./spacePortStuff/spacePort.as";
		include "./dressupSpaceShip/dressUp.as";
		include "./openingStuff/screenAfterRegister.as";
		include "./openingStuff/screenAfterRegister2.as";
		//submit_btn is the submit button
		//uname_txt is the text field
		
		public var currentMovingObject:MovieClip;
		
		public var spaceShip:SpaceShip;
		
		//the spaceShip needs to be Created at first so that we dress it properly.
		//also need a function to dress the spaceship
		//same with everything else that needs to be dressed aka the character house pet etc.
		
		//I have to make all the containers once in the beginning and just hide some of them depending on the state.
		public function Main()
		{
			super();
			//trace(TheLasso.points);
			//var nurm:int=235;
			//trace("Original number is "+nurm.toString(2));
			//for(var i:uint=1;i<=8;i++)	trace("Setting digit "+i+" to 0 = "+setBinaryDigiti("234",i,0));
			//for(i=1;i<=8;i++)	trace("Setting digit "+i+" to 1 = "+setBinaryDigiti("234",i,1));
			result2_txt.visible=false;
			spaceShip = new SpaceShip();
			spaceShip.prepare();
			dressSpaceship();
			spaceShip.visible=false;
			stage.addChild(spaceShip);
			//stage.x=0;
			//stage.y=0;
			startGameContainerWise();
			initLoginRegister();
			
		}

	}
}