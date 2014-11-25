package 
{
	import flash.display.NativeMenu;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Donovan Nguyen
	 */
	public class Main extends Sprite 
	{
		private var tank:Tunk;
		private var bullets:Array = [];
		private var mouseClicked:Boolean = false;
		private var input:Point;
		private var speed:Number = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			input = new Point(0, 0);
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			tank = new Tunk();
			this.addChild(tank);
			tank.x = stage.stageWidth * 0.5;
			tank.y = stage.stageHeight * 0.5;
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(MouseEvent.CLICK, onClick);
			this.addEventListener(Event.ENTER_FRAME, loop);
			}
		
			//keycodes / movement
		private function loop(e:Event):void 
		{
			//yas sin
			//xas cos
			//ymove = sin(rot);
			//xmove = cos(rot);
			//rot is radian, no angle
			//rad = 1/2 pi
			//angle = 90 degrees
			//degrees*Math.PI / 180;
			//radians*180 / Math.PI
			
			speed = input.y * 6;
			
			tank.rotation += input.x * 5;
			
			var radians:Number = tank.rotation * Math.PI / 180;
			var xmove:Number = Math.cos(radians);
			var ymove:Number = Math.sin(radians);
			
			tank.x += xmove * -speed;
			tank.y += ymove * -speed;
			
			var diffx:Number = mouseX- tank.x;
			var diffy:Number = mouseY - tank.y;
			radians = Math.atan2(diffy, diffx);
			
			var degrees:Number = radians * 180 / Math.PI;
			
			tank.turnTurret(degrees - tank.rotation);
			
			
			//shoot bullets! in a loop
			if (bullets.length > 0)
			{
				for (var i: int = bullets.length - 1; i >= 0; i--)
				{
					bullets[i].loop();
				}
			}
		}
		
		public function shootBullet(e:MouseEvent):void 
		{
			var bullet:Bullot = new Bullot(stage,tank.x,tank.y, tank.turretRotation);
			bullet.addEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved); // activates the "bulletRemoved()" function whenever this bullet is removed from the stage
            bullets.push(bullet);
			stage.addChild(bullet);
		}
		public function bulletRemoved(e:MouseEvent):void 
		{
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved); //remove the event listener so we don't get any errors
            bullets.splice(bullets.indexOf(e.currentTarget),1); //remove this bullet from the bulletList array
        }
		public function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				input.y = -1;
			}	
			
			if (e.keyCode == Keyboard.A)
			{
				input.x = -1;
			}
			
			if (e.keyCode == Keyboard.S)
			{
				input.y = 1;
			}
			
			if (e.keyCode == Keyboard.D)
			{
				input.x = 1;
			}
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				input.y = 0;
			}
			
			if (e.keyCode == Keyboard.A)
			{
				input.x = 0;
			}
			
			if (e.keyCode == Keyboard.S)
			{
				input.y = 0;
			}
			
			if (e.keyCode == Keyboard.D)
			{
				input.x = 0;
			}
		}

		public function onClick(e:MouseEvent):void 
		{
			shootBullet(e);
		}
		
	}
	
}