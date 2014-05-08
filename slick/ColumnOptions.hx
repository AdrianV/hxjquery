package slick;

/**
 * ...
 * @author 
 */

import slick.Editors;
import slick.Grid;

typedef ColumnOptions<T> = {
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
  ? formatter: FormaterCall<T>,
  ? asyncPostRender: PostRenderCall<T>,

  // these are enhancements to Slick Grid
	? getAsString: T->String,
	? compare: T->T->Int,
  
}
