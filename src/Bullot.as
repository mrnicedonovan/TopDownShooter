package
{
    import flash.display.Stage;
    import flash.display.MovieClip;
    import flash.events.Event;
 
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
    public class Bullot extends MovieClip
    {
		private var bullut:Bullet;
        private var stageRef:Stage; //this to check if the bullet leaves the screen borders
        private var speed:Number = 10; //speed that the bullet will travel at
        private var xxmove:Number = 0; //current x velocity
        private var yymove:Number = 0; //current y velocity
 
        public function Bullot(stageRef:Stage, X:int, Y:int, rotationInDegrees:Number):void
        {
			
			bullut = new Bullet();
			this.rotation = rotationInDegrees;
			this.addChild(bullut);
            this.stageRef = stageRef;
            this.x = X;
            this.y = Y;
			
        }
		public function loop():void //don't need to add the "e:Event" because no using an EventListener
		{
			//if the bullet goes off the edge of the screen...
			if(x > stageRef.stageWidth || x < 0 || y > stageRef.stageHeight || y < 0)
		{
			this.parent.removeChild(this); //remove the bullet
		}
}
    }
}