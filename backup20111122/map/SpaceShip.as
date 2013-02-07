package map
{
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	

	
	public class SpaceShip extends MovieClip
	{
		
		public var label:String = "spaceShip" //Every object will have one of those inside
		public function SpaceShip(x:Number=200,y:Number=200,width:Number=150,height:Number=150)
		{
			super();
			this.width=width;
			this.height=height;
			this.x=x;
			this.y=y;
			//this.bound.x=this.width;
			//this.bound.y=60;
			
			

		}
	}
}