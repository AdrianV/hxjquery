package slick;

/**
 * ...
 * @author Adrian Veith
 */

import js.html.Event;
import js.html.HtmlElement;
import js.html.Node;
import slick.Editors;
import slick.DataView;
import slick.GridEventHandler;

typedef GridRow = Dynamic;
typedef GridCell = Node;
typedef GridValue = Dynamic;
typedef GridDataContext = Dynamic;

typedef FormaterCall<T> = GridRow->GridCell->GridValue->ColumnOptions<T>->GridDataContext->String;
typedef PostRenderCall<T> = GridCell->GridRow->GridDataContext->ColumnOptions<T>->Void;

typedef SortColumns<T> = {
	sortAsc: Bool,
	sortCol: ColumnOptions<T>,
}

typedef SortColumnInfo = {
	columnId: String,
	sortAsc: Bool,
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
  ? frozenColumn: Int,
  ? frozenRow: Int,
}

typedef ViewPort = {
	top: Int, 
	bottom: Int, 
	leftPx: Int, 
	rightPx: Int
}

typedef CellPosition = { 
  bottom:  Int,
  height:  Int,
  left:    Int, 
  right:   Int, 
  top:     Int, 
  visible: Bool, 
  width:   Int 
}

typedef CellIndex = {
	row: Int,
	cell: Int,
}

@:native("Slick.Grid")
extern class Grid<T>
{
	@:overload(function(container: String, data:IDataView<T>, columns: Array<ColumnOptions<T>>, options: GridOptions): Grid<T> {})
	@:overload(function(container: String, data:DataView<T>, columns: Array<ColumnOptions<T>>, options: GridOptions): Grid<T> {})
	public function new<T>(container: String, data:Array<T>, columns: Array<ColumnOptions<T>>, options: GridOptions);
	
	public function init(): Void;
	public function autosizeColumns(): Void;
	
	public function getData(): Array<T>;
	inline public function getDataView(): DataView<T> return cast getData();
	public function getDataLength(): Int;
	public function getColumns(): Array<ColumnOptions<T>>;
	public function getColumnIndex(columnId: String): Int;
	public function setColumns(columns: Array<ColumnOptions<T>>): Void;
	public function setSortColumn(id: String, ascending: Bool): Void;
	public function setSortColumns(colums: Array<{columnId: String, sortAsc: Bool}>): Void;
	public function updateColumnHeader(columnId: String, title: String, ? toolTip: String): Void;
	
	public function addCellCssStyles(key: String, hash: Dynamic): Void;
	public function canCellBeActive(row: Int, col: Int): Bool;
	public function canCellBeSelected(row: Int, col: Int): Bool;
	public function editActiveCell(editor: IEditor): Void;
	public function flashCell(row: Int, col: Int, ? speed: Int): Void;
	public function getActiveCell(): { row: Int, cell: Int };
	public function getActiveCellNode(): HtmlElement;
	public function setActiveCell(row: Int, cell: Int): Void;
	public function getActiveCellPosition(): CellPosition;
	public function getCellCssStyles(key: String): Dynamic;
	public function getCellEditor(): IEditor;
	public function getCellFromEvent(e: Event): CellIndex;
	public function getCellFromPoint(x: Int, y: Int): CellIndex;
	public function getCellNode(row: Int, cell: Int): HtmlElement;
	public function getCellNodeBox(row: Int, cell: Int): CellPosition;
	public function gotoCell(row: Int, cell: Int, forceEdit: Bool): Void;
	public function getHeaderRow(): Node;
	public function getHeaderRowColumn(columnId: String): Node;
	public function getSortColumns(): Array<SortColumnInfo>;
	public function getTopPanel(): HtmlElement;
	public function invalidate(): Void;
	public function invalidateAllRows(): Void;
	public function invalidateRow(row: Int): Void;
	public function invalidateRows(rows: Array<Int>): Void;
	public function navigateDown(): Void;
	public function navigateLeft(): Void;
	public function navigateNext(): Void;
	public function navigatePrev(): Void;
	public function navigateRight(): Void;
	public function navigateUp(): Void;
	public function removeCellCssStyles(key: String): Void;
	public function resetActiveCell(): Void;
	public function setCellCssStyles(key: String, styles: Dynamic): Void;
	public function setData(data: Array<T>, ? scrollToTop: Bool): Void;
	public function render(): Void;
	public function resizeCanvas(): Void;
	public function scrollCellIntoView(row: Int, cell: Int): Void;
	public function setSelectionModel(model: ISelectionModel<T>): Void;
	public function getSelectionModel(): ISelectionModel<T>;
	public function setHeaderRowVisibility(visible: Bool): Void;
	public function setOptions(options: GridOptions): Void;
	public function scrollRowToTop(row: Int): Void;
	public function scrollRowIntoView(row: Int, doPaging: Bool): Void;
	public function updateCell(row: Int, cell: Int): Void;
	public function updateRow(row: Int): Void;
	public function updateRowCount(): Void;
	//RENDERING
	public function getCanvasNode(): HtmlElement;
	public function getGridPosition(): CellPosition;
	public function getRenderedRange(? viewportTop: Int, ? viewportLeft: Int): ViewPort;
	public function getViewport(? viewportTop: Int, ? viewportLeft: Int): ViewPort;
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