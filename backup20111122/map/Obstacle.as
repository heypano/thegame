package map
{
	import flash.display.MovieClip;
	
	import generalfunctions.BoundingBox;
	
	public class Obstacle extends MovieClip
	{
		public var bound:BoundingBox; //Every object will have one of those inside
		public var label:String = "spaceShip" //Every object will have one of those inside
		public function Obstacle(x:Number=200,y:Number=200,width:Number=200,height:Number=200)
		{
			super();
			this.width=width;
			this.height=height;
			this.x=x;
			this.y=y;
			
			bound = new BoundingBox(this.x,this.y,0.8*this.width,0.8*this.height);
			
		}
	}
}