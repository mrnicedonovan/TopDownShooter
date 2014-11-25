package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Tunk extends Sprite 
	{
		private var tankBodyArt:MovieClip;
		public var tankTurretArt:TankTurretArt;
		
		public var turretRotation:int;
		
		private var _bullet:Bullot;
		
		public function Tunk()
		{
			tankBodyArt = new TankBodyArt();
			this.addChild(tankBodyArt);
			
			tankTurretArt = new TankTurretArt();
			this.addChild(tankTurretArt);
			
		}
		
		
		public function turnTurret(rotation:Number):void
		{
			tankTurretArt.rotation = rotation;
			turretRotation = rotation;
		}
		
	}

}