package jquery;

/**
 * ...
 * @author Adrian Veith
 */

import js.jquery.JQuery;

typedef DateBoxOptions = {
	@:optional var mode: String;
	@:optional var lockInput: Bool;
	@:optional var enhanceInput: Bool;
	@:optional var defaultValue: Dynamic;
	@:optional var startOffsetYears: Int;
	@:optional var startOffsetMonths: Int;
	@:optional var startOffsetDays: Int;
	// Display Options
	@:optional var centerHoriz: Bool;
	@:optional var centerVert: Bool;
	@:optional var transition: String;
	@:optional var useAnimation: Bool;
	@:optional var hideInput: Bool;
	@:optional var hideFixedToolbars: Bool;
	@:optional var zindex: Int;
	@:optional var clickEvent: String;
	@:optional var clickEventAlt: String;
	@:optional var resizeListener: Bool;
	@:optional var dialogEnable: Bool;
	@:optional var dialogForce: Bool;
	@:optional var useModal: Bool;
	@:optional var useInline: Bool;
	@:optional var useInlineBlind: Bool;
	@:optional var useButton: Bool;
	@:optional var useFocus: Bool;
	@:optional var usePlaceholder: Bool;
	@:optional var useNewStyle: Bool;
	@:optional var useAltIcon: Bool;
	@:optional var overrideStyleClass: String;
	//Control Options
	@:optional var useHeader: Bool;
	@:optional var useImmediate: Bool;
	@:optional var useClearButton: Bool;
	@:optional var useSetButton: Bool;
	@:optional var useTodayButton: Bool;
	@:optional var useCollapsedBut: Bool;
	@:optional var useLang: String;
	@:optional var rolloverMode: { m: Bool, d: Bool, h: Bool, i: Bool,s: Bool };
	@:optional var slen: {y: Int, m:Int, d:Int, h:Int, i:Int};
	@:optional var flen: {y: Int, m:Int, d:Int, h:Int, i:Int,a:Int};
	@:optional var calShowDays: Bool;
	@:optional var calShowWeek: Bool;
	@:optional var calOnlyMonth: Bool;
	@:optional var calWeekMode: Bool;
	@:optional var calWeekModeDay: Bool;
	//Callback Options
	@:optional var openCallback: Dynamic->Void;
	@:optional var openCallbackArgs: Array<Dynamic>;
	@:optional var closeCallback: Dynamic->Void;
	@:optional var closeCallbackArgs: Array<Dynamic>;
	//Date Limiting Options
	@:optional var afterToday: Bool;
	@:optional var beforeToday: Bool;
	@:optional var notToday: Bool;
	@:optional var maxDays: Int;
	@:optional var minDays: Int;
	@:optional var maxYear: Int;
	@:optional var minYear: Int;
	@:optional var blackDatesRec: Array<Array<Int>>;
	@:optional var blackDates: Array<Date>;
	@:optional var blackDays: Array<Int>;
	@:optional var enableDates: Array<Date>;
	@:optional var minHour: Int;
	@:optional var maxHour: Int;
	@:optional var validHours: Array<Int>;
	@:optional var minuteStep: Int;
	@:optional var minuteStepRound: Int;
	@:optional var highDays: Array<Int>;
	@:optional var highDates: Array<Date>;
	@:optional var highDatesRec: Array<Array<Int>>;
	@:optional var highDatesAlt: Array<Date>;
	@:optional var calShowDateList: Bool;
	@:optional var calDateList: Array<Array<Dynamic>>;
	@:optional var durationSteppers: { d: Int, h: Int, i: Int, s: Int };
	// Theme Options
	@:optional var theme: Bool;
	@:optional var themeHeader: String;
	@:optional var themeDateHigh: String;
	@:optional var themeDatePick: String;
	@:optional var themeDate: String;
	@:optional var themeButton: String;
	@:optional var themeInput: String;
	@:optional var themeDateToday: String;
	@:optional var themeDayHigh: String;
	@:optional var themeDateHighAlt: String;
	@:optional var themeDateHighRec: String;
	//@:optional var themeDate: String;
	@:optional var calUsePickers: Bool;
	@:optional var calNoHeader: Bool;
	@:optional var calHighToday: Bool;
	@:optional var calHighPick: Bool;
	@:optional var calWeekHigh: Bool;
	@:optional var calControlGroup: Bool;
	@:optional var customData: Array<Dynamic>;
	@:optional var themeOptPick: String;
	@:optional var themeOpt: String;
	@:optional var overrideCustomSet: String;
	@:optional var customDefault: Array<Int>;
	//
	@:optional var setDateButtonLabel: String;
	@:optional var setTimeButtonLabel: String;
	@:optional var setDurationButtonLabel: String;
	@:optional var calTodayButtonLabel: String;
	@:optional var titleDateDialogLabel: String;
	@:optional var titleTimeDialogLabel: String;
	@:optional var daysOfWeek: Array<String>;
	@:optional var daysOfWeekShort: Array<String>;
	@:optional var monthsOfYear: Array<String>;
	@:optional var monthsOfYearShort: Array<String>;
	@:optional var durationLabel: Array<String>;
	@:optional var durationDays: Array<String>;
	@:optional var timeFormat: Int;
	@:optional var headerFormat: String;
	@:optional var tooltip: String;
	@:optional var nextMonth: String;
	@:optional var prevMonth: String;
	@:optional var dateFieldOrder: Array<String>;
	@:optional var overrideDateFieldOrder: Array<String>;
	@:optional var timeFieldOrder: Array<String>;
	@:optional var overrideTimeFieldOrder: Array<String>;
	@:optional var slideFieldOrder: Array<String>;
	@:optional var overrideSlideFieldOrder: Array<String>;
	@:optional var overrideDateFormat: String;
	@:optional var useArabicIndic: Int;
	@:optional var isRTL: Int;
	@:optional var calStartDay: Int;
	@:optional var clearButton: String;
	@:optional var durationOrder: Array<String>;
	@:optional var overrideDurationOrder: Array<String>;
	@:optional var meridiem: Array<String>;
	@:optional var timeOutput: String;
	@:optional var durationFormat: String;
	@:optional var overrideDurationFormat: String;
	@:optional var calDateListLabel: String;
	@:optional var lang: Dynamic;
}

#if jtsage
@:native("jQuery.jtsage.datebox.prototype")
#else
@:native("jQuery.mobile.datebox.prototype")
#end
extern class JQMDateBox {
	//@:native("jQuery.jtsage.datebox.prototype.options")
	static public var options(default, never): DateBoxOptions;
	
	static public inline function datebox_options(j: JQuery, param: DateBoxOptions): JQueryX { return untyped j.datebox(param);  }
	static public inline function datebox_call(j: JQuery, method: String): Dynamic { return untyped j.datebox(method);  }
	static public inline function datebox_callFormat(j: JQuery, format: String, date: Date): String { return untyped j.datebox('callFormat', format, date);  }
	static public inline function datebox_open(j: JQuery): JQueryX { return untyped j.datebox('open');  }
	static public inline function datebox_close(j: JQuery): JQueryX { return untyped j.datebox('close');  }
	static public inline function datebox_disable(j: JQuery): JQueryX { return untyped j.datebox('disable');  }
	static public inline function datebox_enable(j: JQuery): JQueryX { return untyped j.datebox('enable');  }
	static public inline function datebox_refresh(j: JQuery): JQueryX { return untyped j.datebox('refresh');  }
	static public inline function datebox_getTheDate(j: JQuery): Date { return untyped j.datebox('getTheDate');  }
	static public inline function datebox_setTheDate(j: JQuery, theDate: Date): JQueryX { return untyped j.datebox('setTheDate', theDate);  }
	static public inline function datebox_getLastDur(j: JQuery): Float { return untyped j.datebox('getLastDur');  }
}
