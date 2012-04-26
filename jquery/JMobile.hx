package jquery;

/**
 * ...
 * @author 
 */

import jquery.JQueryX; 

@:native("$.mobile")
extern class JMobile 
{
	@:overload(function(p:JQueryX, ? options: Dynamic):Void {} )
	static public function changePage(p: String, ? options: Dynamic): Void;
	
	static public function loadPage(p: String, ? options: Dynamic): Void;

	static public function hidePageLoadingMsg():Void;
	static public function showPageLoadingMsg():Void;
	static public function silentScroll(yPos: Int): Void;
	static public var activePage: JQueryX; 
	static public function closestPageData(t: js.JQuery): JQueryX;
	inline static public function listview(j: js.JQuery): Void { return untyped j.listview(); }
	inline static public function page(j: js.JQuery): Void { return untyped j.page(); }
	inline static public function button(j: js.JQuery): Void { return untyped j.button(); }
	inline static public function selectmenu(j: js.JQuery, command: String): Void { return untyped j.selectmenu(command); }
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