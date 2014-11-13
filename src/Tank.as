package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Tank extends MovieClip 
	{
		private var tankBodyArt:MovieClip;
		private var tankTurretArt:TankTurretArt;
		public function Tank() 
		{
			tankBodyArt = new TankBodyArt();
			this.addChild(tankBodyArt);
			
			tankTurretArt = new TankTurretArt();
			this.addChild(tankTurretArt);
		}
		
	}

}