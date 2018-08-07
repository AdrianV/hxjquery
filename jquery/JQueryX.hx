/**
 * ...
 * @author Adrian Veith
 */

package jquery;

#if !macro
import js.jquery.JQuery;
import js.jquery.Helper.J;
import js.jquery.Helper.JTHIS;
#end

//@:hack
//@:native("$")
extern class JQueryX  // #if (!macro) extends js.jquery.JQuery #end
{
	#if !macro
	
	//static public inline function qyx(j: js.jquery.JQuery): JQueryX { return cast j; } 
	
	//@:overload(function(query: js.html.Node): JQueryX {})
	//static public inline function qy(query: String): JQueryX { return cast new JQuery(query); }
	
	static public inline function jqm(j: js.jquery.JQuery): jquery.JMobile { return cast j; }
	static public inline function jqui(j: js.jquery.JQuery): jquery.JQueryUI { return cast j; }
	
	//public inline function iHeight(): Int return Std.int(height());
	//public inline function iWidth(): Int return Std.int(width());
	
	//static public var This(get, null): JQueryX;
	//static private inline function get_This(): JQueryX return cast new js.jquery.JQuery(js.Lib.nativeThis);
	
	static public inline function start(f: Void -> Void): js.jquery.JQuery { return new js.jquery.JQuery(f); }
	
	static public inline function isChecked(j: js.jquery.JQuery): Bool { return j.prop('checked'); }
	static public inline function setChecked(j: js.jquery.JQuery, val: Bool): js.jquery.JQuery { return j.prop( "checked", val); }

	@:deprecated
	static public inline function replaceHandler(j: js.jquery.JQuery, event: String = "click", f: js.jquery.Event->js.jquery.JQuery->Void): js.jquery.JQuery 
	{ 
		return j.off(event).on(event, function(e) f(e, JTHIS)); 
	}
	#end
}

