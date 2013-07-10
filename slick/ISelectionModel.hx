package slick;

/**
 * ...
 * @author Adrian Veith
 */

import slick.Grid;
import slick.GridEventHandler;

interface ISelectionModel<T>
{

	public function init(grid: Grid<T>): Void;
	public function destroy(): Void;
	
	public var onSelectedRangesChanged(default, null): GridEventHandler<Void>;
	
}