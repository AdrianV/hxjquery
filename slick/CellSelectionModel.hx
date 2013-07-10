package slick;

/**
 * ...
 * @author Adrian Veith
 */
import slick.ISelectionModel;
import slick.Range;
 
@:native("Slick.CellSelectionModel")
extern class CellSelectionModel<T> implements ISelectionModel<T>
{
	public function new();
	public function init(grid: Grid<T>): Void;
	public function destroy(): Void;
	
	public function getSelectedRanges(): Array<Range>;
	public function setSelectedRanges(ranges: Array<Range>): Void;
	public var onSelectedRangesChanged(default, null): GridEventHandler<Void>;	
	
}