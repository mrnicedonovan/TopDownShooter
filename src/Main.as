package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Main extends Sprite 
	{
		private var tank:Tank;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			tank = new Tank();
			this.addChild(tank);
			tank.x = stage.stageWidth * 0.5;
			tank.y = stage.stageHeight * 0.5;
		}
		
	}
	
}