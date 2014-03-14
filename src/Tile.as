package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	/**
	 * ...
	 * @author JohnDenKloke
	 */
	public class Tile extends Sprite
	{
		private var nothing:Boolean = new Boolean(false);
		private var ship:Boolean = new Boolean(false);
		private var transformer:ColorTransform = new ColorTransform();
		private var noSpirit:Boolean = new Boolean(false);
		public var isClicked:Boolean = new Boolean(false);
		private var is_There_Ship:Boolean = false;
		public var aShip:Boolean = false;
		
		public function Tile(i:int, j:int) 
		{
			this.graphics.beginFill(0x0243A4);
			this.graphics.drawRect(0, 0, 32, 32);
			this.x = 35 + j * (32 + 2);
			this.y = 100 + i * (32 + 2);
		}
			
		public function there_Is_Ship():int
		{
			transformer.color = 0x804000;
			this.transform.colorTransform = transformer;
			this.isClicked = true;
			return 32;
		}
		public function there_Is_No_Ship():void 
		{
			transformer.color = 0x8080FF;
			this.transform.colorTransform = transformer;
			this.isClicked = true;
		}
			
		public function reset():void 
		{
			transformer.color = 0x0243A4;
			this.isClicked = false;
			this.transform.colorTransform = transformer;
			
		}
	}
}