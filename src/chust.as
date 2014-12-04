package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class chust extends Sprite
	{
		private var chestArt:MovieClip;
		public var lives:int = 10;
		public function chust() 
		{
			chestArt = new ChestArt();
			addChild(chestArt);
		}
		
	}

}