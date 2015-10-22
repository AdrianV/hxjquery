package jquery;

@:hack
@:native("$")
extern class JQueryUI extends jquery.JQueryX
{
	// jQuery UI support
	
	// Drag and Drop

	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function draggable(?param: Dynamic): JQueryUI;
	public inline function draggableOption(name: String, ?value: Dynamic ): Dynamic { return this.draggable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function droppable(?param: Dynamic): JQueryUI;
	public inline function droppableOption(name: String, ?value: Dynamic ): Dynamic { return this.droppable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function resizable(?param: Dynamic): JQueryUI;	
	public inline function resizableOption(name: String, ?value: Dynamic ): Dynamic { return this.resizable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function selectable(?param: Dynamic): JQueryUI;
	public inline function selectableOption(name: String, ?value: Dynamic ): Dynamic { return this.selectable('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function sortable(?param: Dynamic): JQueryUI;
	public inline function sortableOption(name: String, ?value: Dynamic ): Dynamic { return this.sortable('option', name, value); }

	// Widgets
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function accordion(?param: Dynamic): JQueryUI;
	public inline function accordionOption(name: String, ?value: Dynamic ): Dynamic { return this.accordion('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function autocomplete(?param: Dynamic, ? value: Dynamic): JQueryUI;
	public inline function autocompleteOption(name: String, ?value: Dynamic ): Dynamic { return this.autocomplete('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function button(?param: Dynamic): JQueryUI;
	public inline function buttonOption(name: String, ?value: Dynamic ):Dynamic { return this.button('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function datepicker(?param: Dynamic): JQueryUI;
	public inline function datepickerOption(name: String, ?value: Dynamic ): Dynamic { return this.datepicker('option', name, value); }
	public inline function datepickerGetDate(): Date { return untyped this.datepicker('getDate'); }
	public inline function datepickerSetDate(value: Date): Date { return untyped this.datepicker('setDate', value); }
	

	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function dialog(?param: Dynamic): JQueryUI;
	public inline function dialogOption(name: String, ?value: Dynamic ): Dynamic { return this.dialog('option', name, value); }
	public inline function dialogOptions(value: Dynamic ): Dynamic { return this.dialog('option', value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function progressbar(?param: Dynamic): JQueryUI;
	public inline function progressbarOption(name: String, ?value: Dynamic ): Dynamic { return this.progressbar('option', name, value); }
	
	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function selectmenu(?param: Dynamic): JQueryUI;
	public inline function selectmenuOption(name: String, ?value: Dynamic ): Dynamic { return this.selectmenu('option', name, value); }

	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function slider(?param: Dynamic): JQueryUI;
	public inline function sliderOption(name: String, ?value: Dynamic ): Dynamic { return this.slider('option', name, value); }

	@:overload(function (option: String, name: String, param: Dynamic): Dynamic {})
	@:overload(function (name: String, ?param: Dynamic): Dynamic {})
	public function tabs(?param: Dynamic): JQueryUI;
	public inline function tabsOption(name: String, ?value: Dynamic ): Dynamic { return this.tabs('option', name, value); }
	
	public function tooltip(? options: Dynamic): JQueryUI;

}
