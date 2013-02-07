package map
{
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	

	
	public class SpaceShip extends MovieClip
	{
		
		public var label:String = "spaceShip" //Every object will have one of those inside
		public function SpaceShip()
		{
			super();	

		}
		public function prepare():void{
		
			this.width=150;
			this.height=150;
			this.x=200;
			this.y=200;
		}
	}
}