package slick;

/**
 * ...
 * @author Adrian Veith
 */

import slick.ISelectionModel;
 
@:native("Slick.RowSelectionModel")
extern class RowSelectionModel<T> implements ISelectionModel<T>
{
	public function new();
	public function init(grid: Grid<T>): Void;
	public function destroy(): Void;
	public function getSelectedRanges(): Array<Range>;
	public function setSelectedRanges(ranges: Array<Range>): Void;
	public function getSelectedRows(): Array<Int>;
	public function setSelectedRows(rows: Array<Int>): Void;

	public var onSelectedRangesChanged(default, null): GridEventHandler<Void>;	
}