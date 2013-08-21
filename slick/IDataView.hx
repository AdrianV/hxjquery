package slick;

/**
 * ...
 * @author Adrian Veith
 */
interface IDataView<T>
{
	public function getItem(index: Int): T;
	public function getLength(): Int;
	
}