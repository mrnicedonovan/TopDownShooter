package  
{
	import Events.ShootEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Enumi extends BaseTank
	{
		private var shotTimurh:Timer;
		
		public function Enumi() 
		{
			shotTimurh = new Timer(2500 + Math.random()*1000);
			shotTimurh.addEventListener(TimerEvent.TIMER, tick);
			shotTimurh.start();
		}
		
		private function tick(e:TimerEvent):void 
		{
			var evund:ShootEvent = new ShootEvent(ShootEvent.SHOOT_BULLET);
			evund.shooter = this;
			dispatchEvent(evund);
		}
		
	}

}