package slick;

/**
 * ...
 * @author Adrian Veith
 */

typedef GridEvent = Dynamic;
typedef GridEvtArgs = Dynamic;


typedef GridEventHandlerCall<T> = GridEvent->GridEvtArgs->T;
 
typedef GridEventHandler<T> = {
	function subscribe(handler: GridEventHandlerCall<T>): Void;
	function unsubscribe(handler: GridEventHandlerCall<T>): Void;
}
