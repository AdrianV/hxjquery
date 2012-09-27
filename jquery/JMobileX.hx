package jquery;

/**
 * ...
 * @author 
 */

typedef SelectMenuOptions = {
	? var corners: Bool;
}

typedef ButtonOptions = {
	? var corners: Bool;
}

extern class JMobileX extends JQueryX {
	static public inline function mobile(j: js.JQuery): JMobileX { return cast j; }
	
	@:overload(function(options: SelectMenuOptions):JMobileX {} )
	public function selectmenu(command: String, ? param: Bool): JMobileX;
	
	public function listview(? command: String): JMobileX;
	
	//@:overload(function(options: ButtonOptions):JMobileX { } )
	//public function button(? command: String): JMobileX;
	
	public function collapsibleset(? command: String): JMobileX;
}
