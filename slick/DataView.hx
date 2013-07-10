package slick;

/**
 * ...
 * @author Adrian Veith
 */

import slick.GridEventHandler;

@:native("Slick.Data.DataView") 
extern class DataView<T>
{
	public function new();
	public function beginUpdate(): Void;
	public function endUpdate(): Void;
	public function setRefreshHints(hints: Dynamic): Void;
	public function setFilterArgs(args: Dynamic): Void;
	public function setItems(data: Array<T>, ? objectIdProperty: String): Void;
	public function getItem(index: Int): T;
	public function getLength(): Int;
	public function refresh(): Void;
	public function setFilter(filter: T->Bool): Void;
	public function sort(comparer: T->T->Int, ascending: Bool): Void;
	
	//EVENTS
	public var onRowCountChanged(default, null): GridEventHandler<Void>;
	public var onRowsChanged(default, null): GridEventHandler<Void>;
	public var onPagingInfoChanged(default, null): GridEventHandler<Void>;
	
}