package slick;

/**
 * ...
 * @author Adrian Veith
 */

@:native("Slick.Range")
extern class Range {
	public var fromRow(default, null): Int;
	public var fromCell(default, null): Int;
	public var toRow(default, null): Int;
	public var toCell(default, null): Int;
	public function isSingleRow(): Bool;
	public function isSingleCell(): Bool;
	public function new(fromRow: Int, fromCell: Int, toRow: Int, toCell: Int);
}