package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.net.URLVariables;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author JohnDenKloke
	 */
	public class Main extends Sprite 
	{
		public var boxes:Vector.<Vector.<Tile>> = new Vector.<Vector.<Tile>>();
		public const amount_Of_Boxes:int = 10;
		public const box_Side:int = 32;
		public var misses:int = 0;
		public var amount_Of_Misses:TextField = new TextField();
		public var score:TextField = new TextField();
		public var points:int = 0;
		private var value:int = 5;
		public var transformer:ColorTransform = new ColorTransform();
		private var shipLocX:int = Math.random() * 7 + 1;
		private var shipLocY:int = Math.random() * 7 + 1;
		private var ship:Boolean = false;
		private var performer:Boolean = true;
		private var aShip:Boolean = false;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			for (var i:int = 0; i < amount_Of_Boxes; i++) 
			{
				var a_Row:Vector.<Tile> = new Vector.<Tile>();
				for (var j:int = 0; j < amount_Of_Boxes; j++) 
				{
					var tile:Tile = new Tile(i,j);
					a_Row.push(tile);
					this.addChild(tile);
					tile.addEventListener(MouseEvent.CLICK, fire);
				}
				boxes.push(a_Row);
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, spacer);
			if (Math.round(Math.random()) * 1 == 0) 
			{
				Tile(boxes[(shipLocY - 1)][shipLocX]).aShip = true;
				Tile(boxes[(shipLocY + 1)][shipLocX]).aShip = true;
			}					else 
			{
				Tile(boxes[shipLocY][(shipLocX + 1)]).aShip = true;
				Tile(boxes[shipLocY][(shipLocX - 1)]).aShip = true;
			}
		}
		
		public function spacer(e:KeyboardEvent):void
		{
			if (e.keyCode == 32) 
			{
				performer = true;
				transformer.color = 0x0243A4;
				shipLocY = Math.random() * 7 + 1;
				shipLocX = Math.random() * 7 + 1;
				points = 0;
				misses = 0;
				score.text = "Shots hit: " + String(points);
				amount_Of_Misses.text = "Shots missed: " + String(misses);
				for (var i:int = 0; i < amount_Of_Boxes; i++) 
				{
					for (var j:int = 0; j < amount_Of_Boxes; j++) 
					{
						Tile(boxes[i][j]).reset();
						Tile(boxes[i][j]).aShip = false;
					}
				}
			if (Math.round(Math.random()) * 1 == 0) 
			{
				Tile(boxes[(shipLocY - 1)][shipLocX]).aShip = true;
				Tile(boxes[(shipLocY + 1)][shipLocX]).aShip = true;
			}					else 
			{
				Tile(boxes[shipLocY][(shipLocX + 1)]).aShip = true;
				Tile(boxes[shipLocY][(shipLocX - 1)]).aShip = true;
			}
			}
		}
		public function fire(e:MouseEvent):void 
		{
			if (Tile(e.target) == boxes[shipLocY][shipLocX]) 
			{
				if (e.target.isClicked == false) 
				{
					Tile(e.target).there_Is_Ship();
					performer = false;
					points++;
					score.text = "Shots hit: " + String(points);						
					addChild(score);
					e.target.isClicked = true;
				}
			}
			else 
			{
				if (e.target.isClicked == false) 
				{
					if (Tile(e.target).aShip == true) 
					{
						Tile(e.target).there_Is_Ship();
						points++;
						score.text = "Shots hit: " + String(points);
						addChild(score);
					}
					else 
					{
						Tile(e.target).there_Is_No_Ship();
						misses++;
						amount_Of_Misses.text = "Shots missed: " + String(misses);
						amount_Of_Misses.y = 10;
						addChild(amount_Of_Misses);
						e.target.isClicked = true;
					}
				}
			}
	}
}
}