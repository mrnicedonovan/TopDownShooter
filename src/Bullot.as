package  
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Bullot extends MovieClip 
	{
		private var xMove:Number;
		private var yMove:Number;
		private var speed:Number = 20;
		public function Bullot(xpos:Number, ypos:Number, rot:Number, turrLenght:Number) 
		{
			
			super();			
			addChild(new Bullet());			
			
			
			
			this.rotation = rot;							
			var radians:Number = this.rotation * Math.PI / 180;
			xMove = Math.cos(radians);
			yMove = Math.sin(radians);
			
			this.x = xpos + xMove * (turrLenght - 15);//mid tank till end turret
			this.y = ypos + yMove * (turrLenght - 15);
		}
		public function update():void
		{
			//every frame; move
			this.x += xMove * speed;
			this.y += yMove * speed;			
		}
		
	}

}