package jquery;

/**
 * ...
 * @author 
 */

import js.JQuery; 
using jquery.JQueryX; 

typedef SelectMenuOptions = {
	? var corners: Bool;
}

typedef ButtonOptions = {
	? var corners: Bool;
}

@:native("$.mobile")
extern class JMobile extends JQueryX  
{
	static public inline function jqm(j: js.JQuery): JMobile { return cast j; } 
	@:overload(inline function(j: js.JQuery): JMobile { } )
	static public inline function qy(query: String): JMobile { return untyped __js__(JQueryX._j)(query); }
	@:overload(function(p:JQueryX, ? options: Dynamic):Void {} )
	static public function changePage(p: String, ? options: Dynamic): Void;
	
	static public function loadPage(p: String, ? options: Dynamic): Void;

	static public function hidePageLoadingMsg():Void;
	static public function showPageLoadingMsg():Void;
	static public function silentScroll(yPos: Int): Void;
	static public var activePage: JMobile; 
	static public function closestPageData(t: js.JQuery): JMobile;
	override public function button(?param: ButtonOptions): JMobile;
	//public function button(): Void;
	public function collapsibleset(? command: String): JMobile;
	public function listview(? command: String): JMobile;
	public function page(? command: String): JMobile;
	@:overload(function(options: SelectMenuOptions):JMobile {} )
	public function selectmenu(command: String, ? param: Bool): JMobile;
	
}

extern class JMobilePanel 
{
	inline static public function panel(j: JQuery, command: String): Void { return untyped j.panel(command); }
}

@:native("$.mobile.fixedToolbars")
extern class FixedToolbars {
	static public function show():Void;
	static public function hide():Void;	
}


typedef PathInfo = {
	var hash: String;
	var host: String;
	var hostname: String;
	var href: String;
	var pathname: String;
	var port: String;
	var protocol: String;
	var search: String;
	var authority: String; 
	var directory: String;
	var domain: String; 
	var filename: String; 
	var hrefNoHash: String; 
	var hrefNoSearch: String; 
	var password: String; 
	var username: String; 
}

@:native("$.mobile.path")

extern class Path {
	static public function parseUrl(url: String): PathInfo;
	static public function makePathAbsolute(relPath: String, absPath: String): String;
	static public function makeUrlAbsolute(relUrl: String, absUrl: String): String;
	static public function isSameDomain(Url1: String, Url2: String): Bool;
	static public function isRelativeUrl(Url1: String, Url2: String): Bool;
	static public function isAbsoluteUrl(Url1: String, Url2: String): Bool;
}

