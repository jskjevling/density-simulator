﻿package {		import flash.display.*;	import flash.events.*;	import flash.geom.*;		public class ValueSlider extends Sprite {		public var sliderValue:Number;		public var sliderPuck:Sprite;		private var sliderTrack:Shape;		private var sliderBounds:Rectangle;		private var initialValue:Number;				public function ValueSlider(initialValue:Number) {			this.initialValue = initialValue;			this.sliderValue = initialValue;			init();		}				private function init():void {			createTrack();			createPuck();		}				private function createTrack():void {			sliderBounds = new Rectangle(1,-5,99,0);			sliderTrack = new Shape();			sliderTrack.graphics.moveTo(0,0);			sliderTrack.graphics.lineStyle(2, 0x333333);			sliderTrack.graphics.lineTo(100,0);			addChild(sliderTrack);		}				private function createPuck():void {			sliderPuck = createRect(0xBBBBBB);			sliderPuck.y = -sliderPuck.height/2;			sliderPuck.x = initialValue;			sliderPuck.addEventListener(MouseEvent.MOUSE_DOWN, dragPuck);			sliderPuck.addEventListener(MouseEvent.MOUSE_UP, releasePuck);			sliderPuck.addEventListener(MouseEvent.MOUSE_OVER, rollOverAction);			sliderPuck.addEventListener(MouseEvent.MOUSE_OUT, rollOutAction);			addChild(sliderPuck);		}				private function createRect(color:uint):Sprite {			var rect:Sprite = new Sprite();			rect.graphics.lineStyle(1, 0x333333);			rect.graphics.beginFill(color);			rect.graphics.drawRect(0,0,5,10);			rect.graphics.endFill();			return rect;		}				private function dragPuck(e:MouseEvent):void {			sliderPuck.addEventListener(Event.ENTER_FRAME, reportValue);			stage.addEventListener(MouseEvent.MOUSE_UP, releasePuck);			var whichPuck:Sprite = Sprite(e.target);			whichPuck.startDrag(false, sliderBounds);		}				private function releasePuck(e:MouseEvent):void {			sliderPuck.removeEventListener(Event.ENTER_FRAME, reportValue);			stage.removeEventListener(MouseEvent.MOUSE_UP, releasePuck);			if (e.target!=stage) {			var whichPuck:Sprite = Sprite(e.target);			whichPuck.stopDrag();			sliderValue = whichPuck.x;			} else {				sliderPuck.stopDrag();				sliderValue = sliderPuck.x;			}		}				private function reportValue(e:Event):void {			var whichPuck:Sprite = Sprite(e.target);			sliderValue = whichPuck.x;		}				private function rollOverAction(e:MouseEvent):void {			sliderPuck.graphics.clear();			sliderPuck.graphics.lineStyle(1, 0x333333);			sliderPuck.graphics.beginFill(0xDDDDDD);			sliderPuck.graphics.drawRect(0,0,5,10);			sliderPuck.graphics.endFill();		}				private function rollOutAction(e:MouseEvent):void {			sliderPuck.graphics.clear();			sliderPuck.graphics.lineStyle(1, 0x333333);			sliderPuck.graphics.beginFill(0xBBBBBB);			sliderPuck.graphics.drawRect(0,0,5,10);			sliderPuck.graphics.endFill();		}	}}