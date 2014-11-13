package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Main extends Sprite 
	{
		private var tank:Tank;
		private var wpressed:Boolean = false;
		private var apressed:Boolean = false;
		private var spressed:Boolean = false;
		private var dpressed:Boolean = false;
		
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
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(MouseEvent.CLICK, onClick);
			this.addEventListener(Event.ENTER_FRAME, loop);
			this.addEventListener(Event.ENTER_FRAME, loop1);
			this.addEventListener(Event.ENTER_FRAME, loop2);
			this.addEventListener(Event.ENTER_FRAME, loop3);
		}
		
		private function loop(e:Event):void 
		{
			if (dpressed)
			{
				tank.x += 5;
			}
		}
		
		private function loop1(e:Event):void 
		{
			if (wpressed)
			{
				tank.y -= 5;
			}
		}
		private function loop2(e:Event):void 
		{
			if (apressed)
			{
				tank.x -= 5;
			}
		}
		private function loop3(e:Event):void 
		{
			if (spressed)
			{
				tank.y += 5;
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				wpressed = true;
			}	
			
			if (e.keyCode == Keyboard.A)
			{
				apressed = true;
			}
			
			if (e.keyCode == Keyboard.S)
			{
				spressed = true;
			}
			
			if (e.keyCode == Keyboard.D)
			{
				dpressed = true;
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				wpressed = false;
			}
			
			if (e.keyCode == Keyboard.A)
			{
				apressed = false;
			}
			
			if (e.keyCode == Keyboard.S)
			{
				spressed = false;
			}
			
			if (e.keyCode == Keyboard.D)
			{
				dpressed = false;
			}
		}

		private function onClick(e:MouseEvent):void 
		{
			trace("!!");
		
		}
		
	}
	
}