package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Tunk extends MovieClip
	{
		private var tankBodyArt:MovieClip;
		private var tankTurretArt:TankTurretArt;
		public var turretRotation:Number;
		public var speed:Number = 0;
		
		public function Tunk() 
		{
			this.scaleX = this.scaleY = 0.2;
			tankBodyArt = new TankBodyArt();//instantieren van de Class
			this.addChild(tankBodyArt);
			tankTurretArt = new TankTurretArt();
			this.addChild(tankTurretArt);		
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			trace("ik heb nu geklikt!");
			dispatchEvent(new Event("ShootBullet"));
			
		}		
		public function update():void
		{
			//movement
			
			var radians:Number = this.rotation * Math.PI / 180;
			var xMove:Number = Math.cos(radians);
			var yMove:Number = Math.sin(radians);
			
			this.x += xMove * -speed;
			this.y += yMove * -speed;
			
			
			//rotation turret
			var diffX:Number = mouseX;
			var diffy:Number = mouseY;
			radians = Math.atan2(diffy, diffX)
			var degrees:Number = radians * 180 / Math.PI;
			
			tankTurretArt.rotation = degrees;	
			turretRotation = degrees;
		}
	}

}