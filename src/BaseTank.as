package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class BaseTank extends MovieClip
	{
		protected var tankBodyArt:MovieClip;
		protected var tankTurretArt:TankTurretArt;
		public var turretRotation:Number;
		public var speed:Number = 0;
		public var turretLenght:Number;
		
		public function BaseTank() 
		{
			//this.alpha = 0.1;
			this.scaleX = this.scaleY = 0.3;
			tankBodyArt = new TankBodyArt();//instantieren van de Class
			this.addChild(tankBodyArt);
			tankTurretArt = new TankTurretArt();
			this.addChild(tankTurretArt);		
			turretLenght = tankTurretArt.width * this.scaleX;
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