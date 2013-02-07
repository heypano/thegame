package map
{
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	
	import generalfunctions.BoundingBox;
	
	public class SpaceShip extends MovieClip
	{
		public var bound:BoundingBox; //Every object will have one of those inside
		public var label:String = "spaceShip" //Every object will have one of those inside
		public function SpaceShip(x:Number=200,y:Number=200,width:Number=150,height:Number=150)
		{
			super();
			this.width=width;
			this.height=height;
			this.x=x;
			this.y=y;
			
			bound = new BoundingBox(0,0,2*this.width,0.3*this.height);
			
			

		}
	}
}