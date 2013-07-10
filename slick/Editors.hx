package slick;

/**
 * ...
 * @author Adrian Veith
 */
typedef IEditor =
{

	function focus(): Void;
	function getValue(): Dynamic;
	function setValue(val: Dynamic): Void;
	
}


@:native("Slick.Editors")
extern class Editors 
{
	static public var Text(default, null): IEditor;
	static public var Integer(default, null): IEditor;
	static public var Date(default, null): IEditor;
	static public var YesNoSelect(default, null): IEditor;
	static public var Checkbox(default, null): IEditor;
	static public var PercentComplete(default, null): IEditor;
	static public var LongText(default, null): IEditor;
	
}