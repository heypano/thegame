package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Video;
	import flash.net.*;
	import flash.text.engine.SpaceJustifier;
	import flash.ui.Keyboard;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import map.*;
	
	public class Main extends MovieClip
	{
		include "./loginregisterpage/loginregisterfunctions.as";
		include "./generalfunctions/generalfunctions.as";
		include "./map/mapfunctions.as";
		//submit_btn is the submit button
		//uname_txt is the text field
		
		public var currentMovingObject:MovieClip;
		
		public function Main()
		{
			super();
			//stage.x=0;
			//stage.y=0;
			initLoginRegister();
			
		}

	}
}