package lassoing
{
	import customEvents.CustomEvent;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.drm.AuthenticationMethod;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import map.SpaceShip;
	
	
	public class TheLasso extends MovieClip
	{
		
		private var bulletSpeed:Number = 16;
		private var outsideRotation:Number;
		private var lassoSpeed:Number = 16;
		private var container:DisplayObjectContainer;
		public static var numSpaceDebris:int=4;//initial number of space debris 
		public static var points:int=0;
		
		public function TheLasso(x:Number, y:Number, rotarg:Number) : void
		{
			super();
			this.rotation=rotarg;
			this.outsideRotation=rotarg;
			this.x = x+100*Math.cos(Math.PI*outsideRotation/180);
			this.y = y+100*Math.sin(Math.PI*outsideRotation/180);
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		
		public function initialize():void{
			container=this.parent;
			createRandomDebris();

		}
		
		
		private function loop(e:Event) : void
		{
			//move bullet right
			x += 0.5*bulletSpeed*Math.cos(Math.PI*outsideRotation/180);
			y += 0.5*bulletSpeed*Math.sin(Math.PI*outsideRotation/180);
			if(collidesWithStuff())return;
			if (!isInStage(this))removeSelf();
		}
		
		private function removeSelf() : void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (container.contains(this))
				container.removeChild(this);
		}
		
		private function isInStage(item:DisplayObject):Boolean{
			if(item.x<item.width/2-300){
				return false;
			}
			else if(item.x>stage.stageWidth-item.width/2+300){
				return false;
			}
			else if(item.y<item.height/2-300){
				return false;
			}
			else if (item.y>stage.stageHeight-item.height/2+300){
				return false;
			}
			else return true;
		}
		
		
		private function collidesWithStuff():Boolean{
			
			for(var i:uint=0;i<container.numChildren;i++) // check to see if it collides with anything
			{
				
				var childClassName:String = getQualifiedClassName( container.getChildAt(i) );
				var childType:Class = getDefinitionByName( childClassName ) as Class;
				if(childType==DebrisCritter1){
					var debris1:DebrisCritter1=container.getChildAt(i) as DebrisCritter1;
					if(this.bound.hitTestObject(debris1.bound)){
						this.parent.removeChild(debris1);
						removeSelf();
						numSpaceDebris--;
						points+=30;
						
						container.dispatchEvent(new CustomEvent(1));//To inform that there has been a hit
						return true;
					}
				}
				else if(childType==DebrisCritter2){
					var debris2:DebrisCritter2=container.getChildAt(i) as DebrisCritter2;
					if(this.bound.hitTestObject(debris2.bound)){
						this.parent.removeChild(debris2);
						removeSelf();
						numSpaceDebris--;
						points+=60;
						container.dispatchEvent(new CustomEvent(2));//To inform that there has been a hit
						return true;
					}
				}
				else if(childType==DebrisDebris){
					var debris3:DebrisDebris=container.getChildAt(i) as DebrisDebris;
					if(this.bound.hitTestObject(debris3.bound)){
						this.parent.removeChild(debris3);
						removeSelf();
						numSpaceDebris--;
						points+=90;
						container.dispatchEvent(new CustomEvent(3));;//To inform that there has been a hit
						return true;
					}
				}
				else if(childType==DebrisDebris2){
					var debris4:DebrisDebris2=container.getChildAt(i) as DebrisDebris2;
					if(this.bound.hitTestObject(debris4.bound)){
						this.parent.removeChild(debris4);
						removeSelf();
						numSpaceDebris--;
						points+=120;
						container.dispatchEvent(new CustomEvent(4));//To inform that there has been a hit
						return true;
					}
				}
				else continue;
				//else trace("nope");
				//	
			}
			return false;
		}
		
		private function createRandomDebris():void{
			var debris:MovieClip;
			var randNum:int=Math.random()*3;
			if((randNum>0)&&(numSpaceDebris>1))return; //make a new one once every 3 times unless there's only 1
			if(numSpaceDebris>=50)return;
			//trace(numSpaceDebris);
			numSpaceDebris++;
			randNum=Math.random()*4;
			if(randNum==0){
				debris = new DebrisCritter1();
				}
			else if(randNum==1){
				debris = new DebrisCritter2();
				}
			else if(randNum==2){
				debris = new DebrisDebris();
				}
			else if(randNum==3){
				debris = new DebrisDebris2();
				}
			container.addChild(debris);
			do{
				debris.x=debris.width/2+Math.random()*(stage.stageWidth-debris.width/2);
				debris.y=debris.height/2+Math.random()*(stage.stageHeight-debris.height/2);
				}while(doesItHitStuff(debris));
			}
		
		public function doesItHitStuff(item:DisplayObject):Boolean{
			var array:Array=Main.arrayForLassoingGame;
			for (var i:uint=0;i<array.length;i++){
				if(item.hitTestObject(array[i]))return true;
				}
			return false;
			}
		
	}
}