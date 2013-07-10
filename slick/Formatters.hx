package slick;

/**
 * ...
 * @author Adrian Veith
 */

import slick.Grid;

@:native("Slick.Formatters")
 
extern class Formatters
{

	static public var PercentComplete(default, null): FormaterCall;
	static public var PercentCompleteBar(default, null): FormaterCall;
	static public var YesNo(default, null): FormaterCall;
	static public var Checkmark(default, null): FormaterCall;	
}