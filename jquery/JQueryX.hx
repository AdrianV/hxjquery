/**
 * ...
 * @author Adrian Veith
 */

package jquery;

#if !macro
import js.jquery.JQuery;
import js.jquery.Helper;
#end
//import js.JQuery;
//import js.Dom;
//import js.XMLHttpRequest;
//import jquery.EventObject;
//import js.html.Node;

@:hack
@:native("$")
extern class JQueryX #if (!macro) extends js.jquery.JQuery #end
{
	#if !macro
	
	static public inline function qyx(j: js.jquery.JQuery): JQueryX { return cast j; } 
	
	@:overload(function(query: js.html.Node): JQueryX {})
	static public inline function qy(query: String): JQueryX { return cast new JQuery(query); }
	
	static public inline function jqm(j: js.jquery.JQuery): jquery.JMobile { return cast j; }
	static public inline function jqui(j: js.jquery.JQuery): jquery.JQueryUI { return cast j; }
	
	public inline function iHeight(): Int return Std.int(height());
	public inline function iWidth(): Int return Std.int(width());
	
	static public var This(get, null): JQueryX;
	static private inline function get_This(): JQueryX return cast new js.jquery.JQuery(js.Lib.nativeThis);
	
	static public inline function start(f: Void -> Void): JQueryX { return cast new js.jquery.JQuery(f); }
	
	public inline function isChecked(): Bool { return prop('checked'); }
	public inline function setChecked(val: Bool): JQueryX { return qyx(prop( "checked", val)); }
	
	inline function replaceHandler(event: String = "click", f: js.jquery.Event->JQueryX->Void): JQueryX 
	{ 
		return qyx(off(event).on(event, function(e) f(e, JQueryX.This))); 
	}
	#end
}

#if false

typedef DeferredCallback<T> = T -> Void;

extern class Promise<T> implements Dynamic<T> {
	@:overload( function (cb: Array<DeferredCallback<T>>): Deferred<T> {})
	public function always(cb: DeferredCallback<T>): Deferred<T>;

	@:overload( function (cb: Array<DeferredCallback<T>>): Deferred<T> {})
	public function done(cb: DeferredCallback<T>): Deferred<T>;

	@:overload( function (cb: Array<DeferredCallback<T>>): Deferred<T> {})
	public function fail(cb: DeferredCallback<T>): Deferred<T>;

}


extern class Deferred<T> extends Promise<T> {
	
	//@:overload (function (cbDone: Array<DeferredCallback>, cbFail: Array<DeferredCallback>): Deferred<T> {})
	public function then(cbDone: DeferredCallback<T>, cbFail: DeferredCallback<T>): Deferred<T>;

}

typedef SimpleCallback = Void->Void;
typedef CallbackCallback = SimpleCallback->Void;

#end


#if false
@:native("js.JQuery")
extern class JQueryXOld extends js.JQuery
{

	#if qualifiedJquery
	static public inline var _j = "jQuery";
	#else
	static public inline var _j = "$";
	#end
	static inline function get_me(): JQueryX { return untyped __js__(_j); }
	static public var me(get, null): JQueryX;
	
	static public inline function qyx(j: js.JQuery): JQueryX { return cast j; } 

	@:overload(function(query: Node): JQueryX {})
	static public inline function qy(query: String): JQueryX { return untyped __js__(_j)(query); }
	static public inline function qyContext(query: String, context: Dynamic): JQueryX { return untyped __js__(_j)(query, context); }
	
	static public inline function qyDocument(): JQueryX { return untyped __js__(_j)(document); }
	
	@:overload(function(d: Array<Node>): JQueryX {})
	static public inline function qyDom(d: Node): JQueryX { return untyped __js__(_j)(d); }
	
	static public inline function qyAny(e: Dynamic): JQueryX { return untyped __js__(_j)(e); }
	static public inline function fromHtml(html: String, ?doc: Dynamic): JQueryX { return untyped (jQuery(html, doc)); }
	
	static public var currentThis(get, null): JQueryX;
	static private inline function get_currentThis(): JQueryX { return untyped __js__("jQuery(this)"); }
	static public var This(get, null): JQueryX;
	static private inline function get_This(): JQueryX { return untyped __js__("jQuery(this)"); }
	
	static public inline function start(f: Void -> Void): JQueryX { return untyped (jQuery(f)); }
	
	static public inline function dup(j: JQuery): JQueryX { return untyped (jQuery(j)); }
	
	static public inline function holdReady(hold: Bool): Void { return untyped jQuery.holdReady(hold); }
	
	static public inline function Event(name: String, ? data: Dynamic): EventObject { return untyped jQuery.Event(name, data); }
	
	//@:overload(function (plain: T): Deferred<T>)
	static public function when<T>(def: T): Promise<T> { return untyped jQuery.when(def); }
	
	//static public function Fn_Extend(o: Dynamic): JQueryX { return untyped (jQuery.fn.extend(o)); }

	@:overload( function (deep: Bool, target:Dynamic, ? obj1: Dynamic, ? obj2: Dynamic, ? obj3: Dynamic): Dynamic {})
	public function extend(target: Dynamic, ? obj1: Dynamic, ? obj2: Dynamic, ? obj3: Dynamic): Dynamic;
	
	@:overload(function(props: Dynamic): JQueryX{})
	@:overload(function(name:String,value:String): JQueryX{})
	override function attr( name : String ) : String;
	
	public inline function isChecked(): Bool { return prop('checked'); }
	public inline function setChecked(val: Bool): JQueryX { return qyx(prop( "checked", val)); }
	
	public var selector(default, null): String;

	@:overload(function (p: Int): js.html.Element {})
	override function get() : Array<js.html.Element>;
	
	@:overload(function (call: CallbackCallback): Array < SimpleCallback > {})
	@:overload(function (call: SimpleCallback): Array < SimpleCallback > {})
	@:overload(function (name: String, call: CallbackCallback): Array < SimpleCallback > {})
	@:overload(function (name: String, call: SimpleCallback): Array < SimpleCallback > {}) 
	override public function queue( ?queueName : String, ?callb : (Void -> Void) -> Void ) : { length : Int }; 
	
	
	public inline function valChecked(): Bool { return untyped this.val(); }
	public inline function valArray(): Array<String> { return untyped this.val(); }
	public inline function setValChecked(value: Bool): JQueryX { return untyped this.val(untyped value); }
	public inline function setValArray(value: Array<String>): JQueryX { return untyped this.val(untyped value); }
	
	@:overload(function (fn: Int -> Bool): JQueryX {})
	override function filter(expr: String): js.JQuery;
	
	public function map(call: Void->Void ): JQueryX;
	
	@:overload(function ( f : Int -> Void ) : JQueryX {}) 
	override function each( f : Void -> Void ) : js.JQuery;
	
	//public inline function Add(expr: String): JQueryX { return untyped this.add(expr); }
	//public inline function Children(?expr: String): JQueryX { return untyped this.children(expr); }
	
	//public inline function Closest(expr: String): JQueryX { return untyped this.closest(expr); }
	//public inline function Find(expr: String): JQueryX { return untyped this.find(expr); }
	//public inline function Next(?expr: String): JQueryX { return untyped this.next(expr); }
	//public inline function NextAll(?expr: String): JQueryX { return untyped this.nextAll(expr); }
	//public inline function OffsetParent(expr: String): JQueryX { return untyped this.offsetParent(expr); }
	//public inline function Parent(?expr: String): JQueryX { return untyped this.parent(expr); }
	//public inline function Parents(?expr: String): JQueryX { return untyped this.parents(expr); }
	//public inline function Prev(?expr: String): JQueryX { return untyped this.prev(expr); }
	//public inline function PrevAll(?expr: String): JQueryX { return untyped this.prevAll(expr); }
	//public inline function Siblings(?expr: String): JQueryX { return untyped this.siblings(expr); }
	
	//public inline function AndSelf(): JQueryX { return untyped this.andSelf(); }
	//public inline function End(): JQueryX { return untyped this.end(); }

	//public inline function Append(content: String): JQueryX { return untyped this.append(content); }
	//public inline function AppendTo(selector: String): JQueryX { return untyped this.appendTo(selector); }
	//public inline function Prepend(content: String): JQueryX { return untyped this.prepend(content); }
	//public inline function PrependTo(selector: String): JQueryX { return untyped this.prependTo(selector); }

	//public inline function After(content: String): JQueryX { return untyped this.after(content); }
	//public inline function Before(content: String): JQueryX { return untyped this.before(content); }
	//public inline function InsertAfter(selector: String): JQueryX { return untyped this.insertAfter(selector); }
	//public inline function InsertBefore(selector: String): JQueryX { return untyped this.insertbefore(selector); }
	
	//public inline function Wrap(content: String): JQueryX { return untyped this.wrap(content); }	
	//public inline function WrapElement(el: HtmlDom): JQueryX { return untyped this.wrap(el); }	
	//public inline function WrapAll(content: String): JQueryX { return untyped this.wrapAll(content); }	
	//public inline function WrapAllElement(el: HtmlDom): JQueryX { return untyped this.wrapAll(el); }	
	//public inline function WrapInner(content: String): JQueryX { return untyped this.wrapInner(content); }	
	//public inline function WrapInnerElement(el: HtmlDom): JQueryX { return untyped this.wrapInner(el); }	

	//public inline function ReplaceWith(content: String): JQueryX { return untyped this.replaceWith(content); }	
	//public inline function ReplaceAll(selector: String): JQueryX { return untyped this.replaceAll(selector); }	
	
	//public inline function Empty(): JQueryX { return untyped this.empty(); }	
	//public inline function Remove(?expr: String): JQueryX { return untyped this.remove(expr); }	
	
	//public inline function Clone(?AndElements: Bool): JQueryX { return untyped this.clone(AndElements); }	
	
	//public inline function Css(name: String): String { return untyped this.css(name); }
	//public inline function SetCss(prop: Dynamic): JQueryX { return untyped this.css(prop); }
	//public inline function SetCssValue(name: String, value: Dynamic): JQueryX { return untyped this.css(name, value); }
	
	//public inline function SetCssCall(name: String, call: Void->Void): JQueryX { return untyped this.css(name, call); }
	
	//public inline function Offset(): OffsetPos { return untyped this.offset(); }
	//public inline function OffsetParent(): JQueryX { return untyped this.offsetParent(); }
	//public inline function Position(): OffsetPos { return untyped this.position(); }

	//public inline function ScrollTop(): Int { return untyped this.scrollTop(); }
	//public inline function SetscrollTop(value: Int): JQueryX { return untyped this.scrollTop(value); }
	//public inline function ScrollLeft(): Int { return untyped this.scrollLeft(); }
	//public inline function SetScrollLeft(value: Int): JQueryX { return untyped this.scrollLeft(value); }
	//public inline function Height(): Int { return untyped this.height(); }
	//public inline function SetHeight(value: Int): JQueryX { return untyped this.height(value); }
	//public inline function Width(): Int { return untyped this.width(); }
	//public inline function SetWidth(value: Int): JQueryX { return untyped this.width(value); }
	//public inline function InnerHeight(): Int { return untyped this.innerHeight(); }
	//public inline function InnerWidth(): Int { return untyped this.innerWidth(); }
	//public inline function OuterHeight(?margin: Int): Int { return untyped this.outerHeight(margin); }
	//public inline function OuterWidth(?margin: Int): Int { return untyped this.outerWidth(margin); }

	@:overload(function ( events : String, data: Dynamic, callb : EventHandler2 ) : JQueryX {})
	@:overload(function ( events : String, callb : EventHandler ) : JQueryX {})
	@:overload(function ( events : String, callb : EventHandler2 ) : JQueryX {})
	override function bind( events : String, callb : js.JQuery.JqEvent -> Void  ) : js.JQuery;
	
	//public inline function One(type: String, fn: EventHandler): JQueryX { return untyped this.one(type, fn); }
	//public inline function OneWithData(type: String, data: Dynamic, fn: EventHandler): JQueryX { return untyped this.one(type, data, fn); }
	
	@:overload(function (event: EventObject): JQueryX {})
	@:overload(function (events : String, ? data: Dynamic ): JQueryX {})
	override function trigger( events : String) : js.JQuery;

	//public inline function Unbind(?type: String, ?fn: EventHandler): JQueryX { return untyped this.unbind(type, fn); }
	
	//public inline function Live(type: String, fn: EventHandler): JQueryX { return untyped this.live(type, fn); }
	//public inline function Die(?type: String, ?fn: EventHandler): JQueryX { return untyped this.die(type, fn); }
	//public inline function Hover(over: EventHandler, out: EventHandler): JQueryX { return untyped this.hover(over, out); }

	@:overload(function(events: String, selector: String, data: Dynamic, f: EventObject->Void):JQueryX {})
	@:overload(function(events: String, selector: String, f: EventObject->Void):JQueryX {})
	override function on(events: String, f: js.JqEvent->Void): JQueryX;

	@:overload(function(events: String, selector: String, ? f: EventObject->Void):JQueryX {})
	function off(events: String, ? f: js.JqEvent->Void): JQueryX;

	inline function newclick(f: js.JqEvent->Void): JQueryX { return off('click').on('click', f); }
	inline function attachHandler(event: String, f: js.JqEvent->Void): JQueryX { return off(event).on(event, f); }
	function disableSelection(): JQueryX;
	function enableSelection(): JQueryX;
	
	@:overload(function (fn1: EventHandler, fn2: EventHandler, ?fn3: EventHandler, ?fn4: EventHandler): JQueryX {})
	@:overload(function (to: Bool): JQueryX {})
	override function toggle( ?duration : Int, ?call : Void -> Void ) : js.JQuery;
	
		
	@:overload(function ( properties : { }, options : { }): JQueryX {})
	override function animate( properties : { }, ?duration : Int, ?callb : Void -> Void ) : js.JQuery;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function hide( ?duration : Int, ?call : Void -> Void ) : js.JQuery;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function fadeIn( ?duration : Int, ?call : Void -> Void ) : js.JQuery;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function fadeOut( ?duration : Int, ?call : Void -> Void ) : js.JQuery;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function fadeTo( duration : Int, opacity : Float, ?call : Void -> Void ) : js.JQuery;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function fadeToggle( ?duration : Int, ?call : Void -> Void ) : js.JQuery;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function show( ?duration : Int, ?call : Void -> Void ) : js.JQuery;
	
	//function stop( ?clearQueue : Bool, ?jumpToEnd : Bool ) : JQueryX;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function slideDown( ?duration : Int, ?call : Void -> Void ): js.JQuery;

	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function slideUp(? duration: Int, ? call: Void -> Void): js.JQuery;
	
	@:overload(function (easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (duration: Int, easing: String, ? call: Void -> Void): JQueryX {})
	@:overload(function (call: Void -> Void): JQueryX {})
	override function slideToggle(? duration: Int, ? call: Void -> Void): js.JQuery;
	
	private static inline function get_effects(): Bool { return untyped jQuery.fx.off; }
	private static inline function set_effects(value: Bool): Bool { return untyped jQuery.fx.off = value; }
	public static var effects(get, set): Bool;
	
	// AJAX
	
	static inline function ajax(options: Dynamic): js.html.XMLHttpRequest { return untyped jQuery.ajax(options); }
	static inline function ajaxSetup(options: Dynamic): Void { return untyped jQuery.ajaxSetup(options); }
	//public inline function LoadUrl(url: String, ? data: Dynamic, ?call: Void -> Void): JQueryX { return untyped this.load(url, data, call); }
	static inline function getUrl(url: String, ? data: Dynamic, ?call: Void -> Void, ?type: String): js.html.XMLHttpRequest { return untyped jQuery.get(url, data, call, type); }
	static inline function getJSON(url: String, ? data: Dynamic, ?call: Void -> Void): js.html.XMLHttpRequest { return untyped jQuery.getJSON(url, data, call); }
	static inline function getScript(url: String, ?call: Void -> Void): js.html.XMLHttpRequest { return untyped jQuery.getScript(url, call); }
	static inline function post(url: String, ? data: Dynamic, ?call: Void -> Void, ?type: String): js.html.XMLHttpRequest { return untyped jQuery.post(url, data, call); }

	public function ajaxComplete(call: Dynamic): JQueryX;
	public function ajaxError(call: Dynamic): JQueryX;
	public function ajaxSend(call: Dynamic): JQueryX;
	public function ajaxStart(call: Dynamic): JQueryX;
	public function ajaxStop(call: Dynamic): JQueryX;
	public function ajaxSuccess(call: Dynamic): JQueryX;
	
	//public inline function Serialize(): String { return untyped this.serialize(); }
	//public inline function SerializeArray(): Array<Dynamic> { return untyped this.serializeArray(); }
	
	// Utilities
	public static function support(): Dynamic { return untyped jQuery.support(); }
	public static inline function forEach(object: Dynamic, call: Int->Dynamic->Void): Dynamic { return untyped jQuery.each(object, call); }
	public static inline function grep<T>(arr: Array<T>, call: T->Int->Void, ? invert: Bool): Array<T> { return untyped jQuery.grep(arr, call, invert); }
	public static inline function inArray<T>(value: T, arr: Array<T>): Int{ return untyped jQuery.inArray(value, arr); }
	public static inline function merge<T>(first: Array<T>, second: Array<T>): Array<T>{ return untyped jQuery.merge(first, second); }
	public static inline function unique<T>(arr: Array<T>): Array<T>{ return untyped jQuery.unique(arr); }
	public static inline function isArray(o: Dynamic): Bool { return untyped jQuery.isArray(o); }
	public static inline function isFunction(o: Dynamic): Bool { return untyped jQuery.isFunction(o); }
	public static inline function param(o: Dynamic): String { return untyped jQuery.param(o); }
	
	// jQuery UI support
	
	// Drag and Drop

	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function draggable(?param: Dynamic): JQueryX;
	public inline function draggableOption(name: String, ?value: Dynamic ): Dynamic { return this.draggable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function droppable(?param: Dynamic): JQueryX;
	public inline function droppableOption(name: String, ?value: Dynamic ): Dynamic { return this.droppable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function resizable(?param: Dynamic): JQueryX;	
	public inline function resizableOption(name: String, ?value: Dynamic ): Dynamic { return this.resizable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function selectable(?param: Dynamic): JQueryX;
	public inline function selectableOption(name: String, ?value: Dynamic ): Dynamic { return this.selectable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function sortable(?param: Dynamic): JQueryX;
	public inline function sortableOption(name: String, ?value: Dynamic ): Dynamic { return this.sortable('option', name, value); }

	// Widgets
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function accordion(?param: Dynamic): JQueryX;
	public inline function accordionOption(name: String, ?value: Dynamic ): Dynamic { return this.accordion('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function autocomplete(?param: Dynamic, ? value: Dynamic): JQueryX;
	public inline function autocompleteOption(name: String, ?value: Dynamic ): Dynamic { return this.autocomplete('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function button(?param: Dynamic): JQueryX;
	public inline function buttonOption(name: String, ?value: Dynamic ):Dynamic { return this.button('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function datepicker(?param: Dynamic): JQueryX;
	public inline function datepickerOption(name: String, ?value: Dynamic ): Dynamic { return this.datepicker('option', name, value); }
	public inline function datepickerGetDate(): Date { return untyped this.datepicker('getDate'); }
	public inline function datepickerSetDate(value: Date): Date { return untyped this.datepicker('setDate', value); }
	

	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function dialog(?param: Dynamic): JQueryX;
	public inline function dialogOption(name: String, ?value: Dynamic ): Dynamic { return this.dialog('option', name, value); }
	public inline function dialogOptions(value: Dynamic ): Dynamic { return this.dialog('option', value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function progressbar(?param: Dynamic): JQueryX;
	public inline function progressbarOption(name: String, ?value: Dynamic ): Dynamic { return this.progressbar('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function slider(?param: Dynamic): JQueryX;
	public inline function sliderOption(name: String, ?value: Dynamic ): Dynamic { return this.slider('option', name, value); }

	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function tabs(?param: Dynamic): JQueryX;
	public inline function tabsOption(name: String, ?value: Dynamic ): Dynamic { return this.tabs('option', name, value); }
	
	public function tooltip(? options: Dynamic): JQueryX;
}
#end

#if iDontNeedThis
private class JQueryImplementation {
	private static function __init__() : Void untyped {
		var q : Dynamic = window.jQuery;
		jquery.JQuery = q;
		jquery.jQuery = q;
	}		
}
#end