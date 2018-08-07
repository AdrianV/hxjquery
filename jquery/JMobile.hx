package jquery;

/**
 * ...
 * @author 
 */

//import jquery.JMobile.PagecontainerChangeOptions;
import haxe.extern.EitherType;
import js.jquery.JQuery; 
//using jquery.JQueryX; 

typedef SelectMenuOptions = {
	? corners: Bool,
}

@:enum abstract ButtonOptionName(String) {
	var corners = "corners";
	var disabled = "disabled";
	var enhanced = "enhanced";
	var icon = "icon";
	var iconpos = "iconpos";
	var initSelector = "initSelector";
	var inline_ = "inline";
	var mini = "mini";
	var shadow = "shadow";
	var theme = "theme";
	var wrapperClass = "wrapperClass";
}

typedef ButtonOptions = {
	? corners: Bool,
	? disabled: Bool,
	? enhanced: Bool,
	? icon: String,
	? iconpos: String,
	? initSelector: String,
	//? inline: Bool,
	? mini: Bool,
	? shadow: Bool,
	? theme: String,
	? wrapperClass: String,
}

@:enum abstract PagecontainerMethods(String) {
	var change = "change";
	var getActivePage = "getActivePage";
	var load = "load";
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

typedef PagecontainerEvent = Dynamic->Dynamic-> Void;

typedef PagecontainerEvents = {
	? beforechange: PagecontainerEvent,
	? beforehide: PagecontainerEvent,
	? beforeload: PagecontainerEvent,
	? beforeshow: PagecontainerEvent,
	? beforetransition: PagecontainerEvent,
	? change: PagecontainerEvent,
	? changefailed: PagecontainerEvent,
	? create: PagecontainerEvent,
	? hide: PagecontainerEvent,
	? load: PagecontainerEvent,
	? loadfailed: PagecontainerEvent,
	? remove: PagecontainerEvent,
	? show: PagecontainerEvent,
	? transition: PagecontainerEvent,
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

typedef PopupOptions = {
	? arrow: EitherType<Bool, String>,
	? corners: Bool,
	? defaults: Bool,
	? disabled: Bool,
	? dismissible: Bool,
	? history: Bool,
	? initSelector: String,
	? overlayTheme: String,
	? positionTo: String,
	? shadow: Bool,
	? theme: String,
	? tolerance: String,
	? transition: String,
	? afterclose: Dynamic->Dynamic->Void,
	? afteropen: Dynamic->Dynamic->Void,
	? beforeposition: Dynamic->Dynamic->Void,
	? create: Dynamic->Dynamic->Void,
}

@:enum abstract PanelCommand(String) {
	var close = "close";
	var destroy = "destroy";
	var open = "open";
	var option = "option";
	var toggle = "toggle";
}

@:enum abstract PanelOption(String) {
	var animate = "animate";
	var defaults = "defaults";
	var disabled = "disabled";
	var dismissible = "dismissible";
	var display = "display";
	var position = "position";
	var positionFixed = "positionFixed";
	var swipeClose = "swipeClose";
	var theme = "theme";
}

@:native("$.mobile")
extern class JMobile extends js.jquery.JQuery  
{
	//static public inline function jqm(j: js.jquery.JQuery): JMobile { return cast j; } 
	//@:overload(function(j: js.jquery.JQuery): JMobile { } )
	//static public inline function qy(query: String): JMobile { return untyped __js__(JQueryX._j)(query); }
	
	//public inline function ext(): jquery.JMobile.JMobileExtension return this;

	static public inline function qm(j: js.jquery.JQuery): jquery.JMobile { return cast j; }
	@:overload(function(query: js.html.Node): JMobile {})
	static public inline function qym(query: String): JMobile { return cast new JQuery(query); }
	
	@:overload(function(p:js.jquery.JQuery, ? options: Dynamic):Void {} )
	static public function changePage(p: String, ? options: Dynamic): Void;
	
	static public function loadPage(p: String, ? options: Dynamic): Void;

	static public function hidePageLoadingMsg():Void;
	static public function showPageLoadingMsg():Void;
	static public function silentScroll(yPos: Int): Void;
	static public function back(): Void;
	
	static public var activePage: JMobile; 
	static public function closestPageData(t: js.jquery.JQuery): JMobile;
	
	@:overload(function (command: WidgetCommand, name: ButtonOptionName, param: Dynamic): Void {})
	@:overload(function (name: WidgetCommand, name: ButtonOptionName): Dynamic {})
	@:overload(function (name: WidgetCommand): JMobile {})
	public function button(?param: ButtonOptions): JMobile;
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
	
	@:overload(function (method: PagecontainerMethods, ?param1: Dynamic, ?param2: Dynamic): Dynamic {})
	@:overload(function (events: PagecontainerEvents): Void {})
	public function pagecontainer(? options: PagecontainerOptions): JMobile;
	static public var pageContainer(default, null): JMobile;
	
	@:overload(function (command: PanelCommand, option: PanelOption): Dynamic {})
	@:overload(function (command: PanelCommand, option: PanelOption, value: Dynamic): Void {})
	public function panel(command: PanelCommand): JMobile;

	@:overload(function (): JMobile {})
	@:overload(function (options: PopupOptions): JMobile {})
	@:overload(function (command: PopupCommand = option, name: String, value: Dynamic): JMobile {})
	public function popup(command: PopupCommand, ? options: Dynamic): JMobile;
	
	@:overload(function (): JMobile {})
	public function textinput(command: WidgetCommand, ? options: Dynamic): JMobile;
	public function enhanceWithin(): JMobile;
	public function date(? command: String, ? options: Dynamic): JMobile;
	public inline function dateGetDate(): Date { return untyped this.date('getDate'); }
	public inline function dateSetDate(value: Date): Date { return untyped this.date('setDate', value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function slider(?param: Dynamic): JQueryUI;
	public inline function sliderOption(name: String, ?value: Dynamic ): Dynamic { return this.slider('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function dialog(?param: Dynamic): JQueryUI;
	public inline function dialogOption(name: String, ?value: Dynamic ): Dynamic { return this.dialog('option', name, value); }
	public inline function dialogOptions(value: Dynamic ): Dynamic { return this.dialog('option', value); }
	
	public inline function toggleButton(disabled: Bool, themeNormal: String, themeDisabled: String): JMobile return JMobileExtImpl.toggleButton(this, disabled, themeNormal, themeDisabled);
	public inline function pagecontainerChange(url: String, options: PagecontainerChangeOptions): JMobile return pagecontainer(PagecontainerMethods.change, url, options);
	
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


extern class JMobilePanel 
{
	inline static public function panel(j: js.jquery.JQuery, command: String): Void { return untyped j.panel(command); }
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

