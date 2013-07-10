package slick;

/**
 * ...
 * @author Adrian Veith
 */

import js.html.Node;
import slick.Editors;
import slick.DataView;
import slick.GridEventHandler;

typedef GridRow = Dynamic;
typedef GridCell = Node;
typedef GridValue = Dynamic;
typedef GridDataContext = Dynamic;

typedef FormaterCall = GridRow->GridCell->GridValue->ColumnOptions->GridDataContext->String;
typedef PostRenderCall = GridCell->GridRow->GridDataContext->ColumnOptions->Void;

typedef SortColumns = {
	sortAsc: Bool,
	sortCol: ColumnOptions,
}

typedef ColumnOptions = {
  id: String,
  ? field: String,
  ? name: String,
  ? resizable: Bool,
  ? sortable: Bool,
  ? minWidth: Int,
  ? rerenderOnResize: Bool,
  ? headerCssClass: String,
  ? defaultSortAsc: Bool,
  ? focusable: Bool,
  ? selectable: Bool,
  ? cssClass: String,
  ? editor: IEditor,
  ? validator: Dynamic -> Dynamic,
  ? width: Int,
  ? formatter: FormaterCall,
  ? asyncPostRender: PostRenderCall,
  
}


typedef GridOptions = {
  ? explicitInitialization: Bool,
  ? rowHeight: Int,
  ? defaultColumnWidth: Int,
  ? enableAddRow: Bool,
  ? leaveSpaceForNewRows: Bool,
  ? editable: Bool,
  ? autoEdit: Bool,
  ? enableCellNavigation: Bool,
  ? enableColumnReorder: Bool,
  ? asyncEditorLoading: Bool,
  ? asyncEditorLoadDelay: Int,
  ? forceFitColumns: Bool,
  ? enableAsyncPostRender: Bool,
  ? asyncPostRenderDelay: Int,
  ? autoHeight: Bool,
  ? editorLock: Dynamic, //Slick.GlobalEditorLock
  ? showHeaderRow: Bool,
  ? headerRowHeight: Int,
  ? showTopPanel: Bool,
  ? topPanelHeight: Int,
  ? formatterFactory: Dynamic,
  ? editorFactory: Dynamic,
  ? cellFlashingCssClass: String,
  ? selectedCellCssClass: String,
  ? multiSelect: Bool,
  ? enableTextSelectionOnCells: Bool,
  ? dataItemColumnValueExtractor: Dynamic,
  ? fullWidthRows: Bool,
  ? multiColumnSort: Bool,
  ? defaultFormatter: Dynamic,
  ? forceSyncScrolling: Bool,
}

@:native("Slick.Grid")
extern class Grid<T>
{
	@:overload(function(container: String, data:DataView<T>, columns: Array<ColumnOptions>, options: GridOptions): Grid<T> {})
	public function new<T>(container: String, data:Array<T>, columns: Array<ColumnOptions>, options: GridOptions);
	
	public function init(): Void;
	public function getData(): Array<T>;
	public function getColumns(): Array<ColumnOptions>;
	public function getColumnIndex(columnId: String): Int;
	public function getHeaderRow(): Node;
	public function getHeaderRowColumn(columnId: String): Node;
	public function invalidate(): Void;
	public function invalidateRows(rows: Array<Int>): Void;
	public function setData(data: Array<T>, ? scrollToTop: Bool): Void;
	public function render(): Void;
	public function resizeCanvas(): Void;
	public function updateRowCount(): Void;
	public function setSelectionModel(model: ISelectionModel<T>): Void;
	public function getSelectionModel(): ISelectionModel<T>;
	//EVENTS
	public var onScroll(default, null): GridEventHandler<Void>;
	public var onSort(default, null): GridEventHandler<Void>;
	public var onHeaderContextMenu(default, null): GridEventHandler<Void>;
	public var onHeaderClick(default, null): GridEventHandler<Void>;
	public var onMouseEnter(default, null): GridEventHandler<Void>;
	public var onMouseLeave(default, null): GridEventHandler<Void>;
	public var onClick(default, null): GridEventHandler<Void>;
	public var onDblClick(default, null): GridEventHandler<Void>;
	public var onContextMenu(default, null): GridEventHandler<Void>;
	public var onKeyDown(default, null): GridEventHandler<Bool>;
	public var onAddNewRow(default, null): GridEventHandler<Void>;
	public var onValidationError(default, null): GridEventHandler<Void>;
	public var onViewportChanged(default, null): GridEventHandler<Void>;
	public var onColumnsReordered(default, null): GridEventHandler<Void>;
	public var onColumnsResized(default, null): GridEventHandler<Void>;
	public var onCellChange(default, null): GridEventHandler<Void>;
	public var onBeforeEditCell(default, null): GridEventHandler<Void>;
	public var onBeforeCellEditorDestroy(default, null): GridEventHandler<Void>;
	public var onHeaderCellRendered(default, null): GridEventHandler<Void>;
	public var onHeaderRowCellRendered(default, null): GridEventHandler<Void>;
	public var onBeforeHeaderCellDestroy(default, null): GridEventHandler<Void>;
	public var onBeforeDestroy(default, null): GridEventHandler<Void>;
	public var onActiveCellChanged(default, null): GridEventHandler<Void>;
	public var onActiveCellPositionChanged(default, null): GridEventHandler<Void>;
	public var onDragInit(default, null): GridEventHandler<Void>;
	public var onDragStart(default, null): GridEventHandler<Void>;
	public var onDrag(default, null): GridEventHandler<Void>;
	public var onDragEnd(default, null): GridEventHandler<Void>;
	public var onSelectedRowsChanged(default, null): GridEventHandler<Void>;
	public var onCellCssStylesChanged(default, null): GridEventHandler<Void>;
	
}