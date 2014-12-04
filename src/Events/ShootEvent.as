package Events 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class ShootEvent extends Event
	{
		public static const SHOOT_BULLET = "ShootBullet";
		public var shooter:BaseTank;
		
		public function ShootEvent(event:String) 
		{
			super(event)
		}
		
	}

}