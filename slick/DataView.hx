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
	public function getIdxById(id: String): Null<Int>;
	public function getRowById(id: String): Null<Int>;
	public function getItemById(id: String): T;
	public function getItemByIdx(idx: Int): T;
	public function mapIdsToRows(idArray: Array<String>): Array<Int>;
	public function mapRowsToIds(rowArray: Array<Int>): Array<String>;
	public function updateItem(id: String, item: T): Void;
	public function insertItem(insertBefore: Int, item: T): Void;
	public function addItem(item: T): Void;
	public function deleteItem(id: String): Void;
	//EVENTS
	public var onRowCountChanged(default, null): GridEventHandler<Void>;
	public var onRowsChanged(default, null): GridEventHandler<Void>;
	public var onPagingInfoChanged(default, null): GridEventHandler<Void>;
	
}