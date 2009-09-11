/**
 * ...
 * @author Adrian Veith
 */

import js.Dom;
import jquery.JQuery;

class Main {

	public static function Repaint() {
		JQuery.Qy('#sortable li:odd').AddClass('ui-state-default').RemoveClass('ui-state-highlight');
		JQuery.Qy('#sortable li:even').RemoveClass('ui-state-default').AddClass('ui-state-highlight');		
	}
	
	public static function animA() {
		JQuery.Qy('#a').FadeIn(1000, function() {
			JQuery.This().FadeOut(1000, Main.animA);
		});		
	}
	public static function animB() {
		JQuery.Qy('#b').FadeIn(2000, function() {
			JQuery.This().FadeOut(1000, Main.animB);
		});		
	}
	public static function startup() {
		Repaint();
		JQuery.Qy('#sortable').Sortable({ 
			stop: function (event, ui) { Repaint();
			}}).DisableSelection();
		JQuery.Qy('#a').Hide();
		JQuery.Qy('#b').Hide();
		animA();
		animB();
	}
	
	static function main()
	{
		JQuery.Ready(startup);
	}
}