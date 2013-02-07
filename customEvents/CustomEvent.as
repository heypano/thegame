package customEvents
{
	import flash.events.Event;
	
	public class CustomEvent extends Event
	{
		public var plus:int;
		public static const WHATEVER:String="odjijqiwjdiji1h2wiejiojoaisjf";
		public function CustomEvent(extra:int,type:String=WHATEVER, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			plus=extra;
		}
	}
}