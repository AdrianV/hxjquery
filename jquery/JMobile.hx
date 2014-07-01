package jquery;

/**
 * ...
 * @author 
 */

import jquery.JMobile.PagecontainerChangeOptions;
import js.JQuery; 
using jquery.JQueryX; 

typedef SelectMenuOptions = {
	? var corners: Bool;
}

typedef ButtonOptions = {
	? var corners: Bool;
}

typedef PagecontainerOptions = {
	? defaults: Bool,
	? disabled: Bool,
	? theme: String,
}

typedef PagecontainerChangeOptions = {
	? allowSamePageTransition: Bool,
	? changeHash: Bool,
	? dataUrl: String,
	? loadMsgDelay: Int,
	? reloadPage: Bool,
	? reload: Bool,
	? reverse: Bool,
	? role: String,
	? showLoadMsg: Bool,
	? transition: String,
	? type: String,
}

@:enum abstract WidgetCommand(String) {
	var destroy = "destroy";
	var disable = "disable";
	var enable = "enable";
	var option = "option";
	var refresh = "refresh";
}

@:enum abstract PopupCommand(String) {
	var close = "close";
	var destroy = "destroy";
	var disable = "disable";
	var enable = "enable";
	var open = "open";
	var option = "option";
	var refresh = "reposition";
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
	static public function back(): Void;
	
	static public var activePage: JMobile; 
	static public function closestPageData(t: js.JQuery): JMobile;
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	override public function button(?param: ButtonOptions): JMobile;
	public function buttonMarkup(?param: Dynamic): JMobile;
	//public function button(): Void;
	
	public function collapsibleset(? command: String): JMobile;
	
	@:overload(function (): JMobile {})
	public function listview(command: WidgetCommand, ? options: Dynamic): JMobile;
	
	public function page(? command: String): JMobile;
	@:overload(function(options: SelectMenuOptions):JMobile {} )
	public function selectmenu(command: String, ? param: Bool): JMobile;
	//public function slider(command: String): JMobile;
	
	public function checkboxradio(command: WidgetCommand, ? options: Dynamic): JMobile;
	
	@:overload(function (name: String, ?param1: Dynamic, ?param2: Dynamic): Dynamic {})
	public function pagecontainer(? options: PagecontainerOptions): JMobile;
	static public var pageContainer(default, null): JMobile;
	
	@:overload(function (): JMobile {})
	public function popup(command: PopupCommand, ? options: Dynamic): JMobile;
	
	@:overload(function (): JMobile {})
	public function textinput(command: WidgetCommand, ? options: Dynamic): JMobile;
	public function enhanceWithin(): JMobile;
	public function date(? command: String, ? options: Dynamic): JMobile;
	public inline function dateGetDate(): Date { return untyped this.date('getDate'); }
	public inline function dateSetDate(value: Date): Date { return untyped this.date('setDate', value); }
	
}

@:native("j.m.x")
private class JMobileExtImpl {
	
	static public function toggleButton(me: JMobile, disabled: Bool, themeNormal: String, themeDisabled: String): JMobile {
		if ( !disabled ) {
			me.removeClass('ui-disabled ui-btn-$themeDisabled').addClass('ui-btn-$themeNormal');
			return me;
		} else {
			me.removeClass('ui-btn-$themeNormal').addClass('ui-disabled ui-btn-$themeDisabled');
			return me;
		}
	}	
}

abstract JMobileExtension(JMobile) from JMobile to JMobile {
	public inline function toggleButton(disabled: Bool, themeNormal: String, themeDisabled: String): JMobile return JMobileExtImpl.toggleButton(this, disabled, themeNormal, themeDisabled);
	public inline function pagecontainerChange(url: String, options: PagecontainerChangeOptions): JMobile return this.pagecontainer(url, options);
	
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

