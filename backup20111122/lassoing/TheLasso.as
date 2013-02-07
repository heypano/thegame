package lassoing
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class TheLasso extends MovieClip
	{
		
		private var bulletSpeed:Number = 16;
		private var outsideRotation:Number;
		
		public function TheLasso(x:Number, y:Number, rotarg:Number) : void
		{
			super();
			this.rotation=rotarg;
			this.outsideRotation=rotarg;
			this.x = x+100*Math.cos(Math.PI*outsideRotation/180);
			this.y = y+100*Math.sin(Math.PI*outsideRotation/180);

			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		private var lassoSpeed:Number = 16;
		
		
		private function loop(e:Event) : void
		{
			//move bullet right
			x += 0.5*bulletSpeed*Math.cos(Math.PI*outsideRotation/180);
			y += 0.5*bulletSpeed*Math.sin(Math.PI*outsideRotation/180);
			
			//if (!isInStage(this))removeSelf();
		}
		
		private function removeSelf() : void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (stage.contains(this))
				stage.removeChild(this);
		}
	
		private function isInStage(item:DisplayObject):Boolean{
			if(item.x<item.width/2){
				return true;
			}
			else if(item.x>stage.stageWidth-item.width/2){
				return true;
			}
			else if(item.y<item.height/2){
				return true;
			}
			else if (item.y>stage.stageHeight-item.height/2){
				return true;
			}
			else return false;
		}
	}
}