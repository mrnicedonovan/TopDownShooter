package  
{
	import Events.ShootEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Tunk extends BaseTank
	{
		public function Tunk() 
		{	
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			var evunt:ShootEvent = new ShootEvent(ShootEvent.SHOOT_BULLET);
			evunt.shooter = this;
			
			dispatchEvent(evunt);
			
		}		

	}

}