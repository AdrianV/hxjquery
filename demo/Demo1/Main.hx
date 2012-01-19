/**
 * ...
 * @author Adrian Veith
 */

import js.Dom;
import jquery.JQueryX;

using jquery.JQueryX;


class Main {

	public static function Repaint() {
		'#sortable li:odd'.qy().addClass('ui-state-default').removeClass('ui-state-highlight');
		'#sortable li:even'.qy().removeClass('ui-state-default').addClass('ui-state-highlight');		
	}
	
	public static function animA() {
		'#a'.qy().fadeIn(1000, function() {
			JQueryX.currentThis.fadeOut(1000, Main.animA);
		});		
	}
	public static function animB() {
		'#b'.qy().fadeIn(2000, function() {
			JQueryX.currentThis.fadeOut(1000, Main.animB);
		});		
	}
	public static function startup() {
		'#a'.qy().attr('test', 'Hallo Welt');
		
		Repaint();
		'#sortable'.qy().sortable({ 
			stop: function (event, ui) { Repaint();
			}}).disableSelection();
		'#a'.qy().hide();
		'#b'.qy().hide();
		animA();
		animB();
		//JQuery.when( { test: 123 } ).done( function(x) { x.test = 124; } );
		var c = JQueryX.me.extend(true, { a: 123 }, { b:321 } );
	}
	
	static function main()
	{
		JQueryX.ready(startup);
	}
}