package jquery;
//import js.jquery.Event;
//import js.Dom;
//import js.XMLHttpRequest;

typedef RequestObject = {
  var term: String;
}

//typedef EventObject = haxe.extern.EitherType<js.jquery.Event, EventObjectExt>;

@:hack @:native("$.Event") 
extern class EventObject extends js.jquery.Event implements Dynamic {
	static public inline function self(e: js.jquery.Event):EventObject return cast e;
	static public inline var acMODIFICATION = 1;
	static public inline var acADDITION		= 2;
	static public inline var acREMOVAL		= 3;

	static public inline var epCAPTURING_PHASE  = 1;
	static public inline var epAT_TARGET		= 2;
	static public inline var epBUBBLING_PHASE	= 3;
	
	public var altKey: Bool;
	public var attrChange: Int;
	public var attrName: String;
	//	public var bubbles: Bool;
	public var button: Int;
	//public var cancelable: Bool;
	public var charCode: Int;
	public var clientX: Int;
	public var clientY: Int;
	public var ctrlKey: Bool;
	//public var currentTarget: js.html.Element;
	//public var data: Dynamic;
	public var detail: Int;
	//public var eventPhase: Int;
	public var fromElement: js.html.Element;
	public var handler: EventObject -> Void;
	public var keyCode: Int;
	public var layerX: Int;
	public var layerY: Int;
	//public var metaKey: Bool;
	public var newValue: String;
	public var offsetX: Int;
	public var offsetY: Int;
	//public var originalTarget: js.html.Element;
	//public var pageX: Int;
	//public var pageY: Int;
	public var prevValue: String;
	public var relatedNode: js.html.Element;
	//public var relatedTarget: js.html.Element;
	public var screenX: Int;
	public var screenY: Int;
	public var shiftKey: Bool;
	public var srcElement: js.html.Element;
	//public var target: js.html.Element;
	public var toElement: js.html.Element;
	public var view: js.html.DOMWindow;
	public var wheelDelta: Int;
	//public var which: Int;
	
	//public function isDefaultPrevented(): Bool;
    //public function isImmediatePropagationStopped(): Bool;
	//public function isPropagationStopped(): Bool;
	//public function preventDefault(): Void;
	//public function stopImmediatePropagation(): Void;
	//public function stopPropagation(): Void;
	public function new(): Void;
}

typedef EventHandler = EventObject-> Void;
typedef EventHandler2 = EventObject-> Dynamic->Void;
