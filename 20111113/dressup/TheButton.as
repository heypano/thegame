package dressup
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class TheButton extends SimpleButton
	{
		public function TheButton(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
		}
	}
}