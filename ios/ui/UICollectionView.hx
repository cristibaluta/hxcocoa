//
//  UICollectionView.h
package ios.ui;
import objc.foundation.NSIndexPath;
import objc.foundation.NSIndexSet;
import objc.graphics.CGGeometry;
import ios.ui.UICollectionViewLayout;

@:framework("UIKit")
@:require(ios6_0)
extern enum UICollectionViewScrollPosition {
    UICollectionViewScrollPositionNone;
    
    // The vertical positions are mutually exclusive to each other, but are bitwise or-able with the horizontal scroll positions.
    // Combining positions from the same grouping (horizontal or vertical) will result in an NSInvalidArgumentException.
    UICollectionViewScrollPositionTop;
    UICollectionViewScrollPositionCenteredVertically;
    UICollectionViewScrollPositionBottom;
    
    // Likewise, the horizontal positions are mutually exclusive to each other.
    UICollectionViewScrollPositionLeft;
    UICollectionViewScrollPositionCenteredHorizontally;
    UICollectionViewScrollPositionRight;
}

@:framework("UIKit")
@:require(ios6_0)
extern interface UICollectionViewDataSource {
//@required
	@:sel("collectionView:numberOfItemsInSection:")
	public function numberOfItemsInSection (collectionView:UICollectionView, section:Int) :Int;

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
	@:sel("collectionView:cellForItemAtIndexPath:")
	public function cellForItemAtIndexPath (collectionView:UICollectionView, indexPath:NSIndexPath) :UICollectionViewCell;

//@optional
#if display

	public function numberOfSectionsInCollectionView (collectionView:UICollectionView) :Int;

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView (UICollectionView *)collectionView viewForSupplementaryElementOfKind (String *)kind atIndexPath (indexPath: NSIndexPath,;
#end
}

@:framework("UIKit")
@:require(ios6_0)
extern interface UICollectionViewDelegate {
//@optional
#if display
// Methods for notification of selection/deselection and highlight/unhighlight events.
// The sequence of calls leading to selection from a user touch is:
//
// (when the touch begins)
// 1. -collectionView:shouldHighlightItemAtIndexPath:
// 2. -collectionView:didHighlightItemAtIndexPath:
//
// (when the touch lifts)
// 3. -collectionView:shouldSelectItemAtIndexPath: or -collectionView:shouldDeselectItemAtIndexPath:
// 4. -collectionView:didSelectItemAtIndexPath: or -collectionView:didDeselectItemAtIndexPath:
// 5. -collectionView:didUnhighlightItemAtIndexPath:
- (BOOL)collectionView (UICollectionView *)collectionView shouldHighlightItemAtIndexPath (indexPath: NSIndexPath,;
	public function collectionView (UICollectionView *)collectionView didHighlightItemAtIndexPath (indexPath: NSIndexPath,;
	public function collectionView (UICollectionView *)collectionView didUnhighlightItemAtIndexPath (indexPath: NSIndexPath,;
- (BOOL)collectionView (UICollectionView *)collectionView shouldSelectItemAtIndexPath (indexPath: NSIndexPath,;
- (BOOL)collectionView (UICollectionView *)collectionView shouldDeselectItemAtIndexPath (indexPath: NSIndexPath,; // called when the user taps on an already-selected item in multi-select mode

	@:sel("collectionView:didSelectItemAtIndexPath:")
	public function didSelectItemAtIndexPath (collectionView:UICollectionView, indexPath:NSIndexPath) :Void;
	@:sel("collectionView:didDeselectItemAtIndexPath:")
	public function didDeselectItemAtIndexPath (collectionView:UICollectionView, indexPath: NSIndexPath) :Void;

	public function collectionView (UICollectionView *)collectionView didEndDisplayingCell (UICollectionViewCell *)cell forItemAtIndexPath (indexPath: NSIndexPath,;
	public function collectionView (UICollectionView *)collectionView didEndDisplayingSupplementaryView (UICollectionReusableView *)view forElementOfKind (String *)elementKind atIndexPath (indexPath: NSIndexPath,;

// These methods provide support for copy/paste actions on cells.
// All three should be implemented if any are.
- (BOOL)collectionView (UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath (indexPath: NSIndexPath,;
- (BOOL)collectionView (UICollectionView *)collectionView canPerformAction (SEL)action forItemAtIndexPath (indexPath: NSIndexPath, withSender (id)sender;
	public function collectionView (UICollectionView *)collectionView performAction (SEL)action forItemAtIndexPath (indexPath: NSIndexPath, withSender (id)sender;
#end
}

@:framework("UIKit")
@:require(ios6_0)
extern class UICollectionView extends UIScrollView {

	//public function initWithFrame (frame:CGRect, collectionViewLayout:UICollectionViewLayout) :UICollectionView;

	public var collectionViewLayout :UICollectionViewLayout;
	//public var delegate :UICollectionViewDelegate;
	public var dataSource :UICollectionViewDataSource;
	public var backgroundView :UIView; // will be automatically resized to track the size of the collection view and placed behind all cells and supplementary views.

// For each reuse identifier that the collection view will use, register either a class or a nib from which to instantiate a cell.
// If a nib is registered, it must contain exactly 1 top level object which is a UICollectionViewCell.
// If a class is registered, it will be instantiated via alloc/initWithFrame:
	public function registerClass (cellClass:Class<Dynamic>, forCellWithReuseIdentifier:String) :Void;
	public function registerNib (nib:UINib, forCellWithReuseIdentifier:String) :Void;

	//public function registerClass (Class)viewClass forSupplementaryViewOfKind (String *)elementKind withReuseIdentifier (String *)identifier;
	//public function registerNib (UINib *)nib forSupplementaryViewOfKind (String *)kind withReuseIdentifier (String *)identifier;

	public function dequeueReusableCellWithReuseIdentifier (identifier:String, forIndexPath:NSIndexPath) :Dynamic;
	public function dequeueReusableSupplementaryViewOfKind (elementKind:String, withReuseIdentifier:String, forIndexPath:NSIndexPath) :Dynamic;

// These properties control whether items can be selected, and if so, whether multiple items can be simultaneously selected.
	public var allowsSelection :Bool; // default is YES
	public var allowsMultipleSelection :Bool; // default is NO

	public function indexPathsForSelectedItems () :Array<NSIndexPath>; // returns nil or an array of selected index paths
	public function selectItemAtIndexPath (indexPath:NSIndexPath, animated:Bool, scrollPosition:UICollectionViewScrollPosition) :Void;
	public function deselectItemAtIndexPath (indexPath:NSIndexPath, animated:Bool) :Void;

	public function reloadData () :Void; // discard the dataSource and delegate data and requery as necessary

	public function setCollectionViewLayout (layout:UICollectionViewLayout, animated:Bool) :Void;

// Information about the current state of the collection view.

	public function numberOfSections () :Int;
	public function numberOfItemsInSection (section:Int) :Int;

	public function layoutAttributesForItemAtIndexPath (indexPath: NSIndexPath) :UICollectionViewLayoutAttributes;
	public function layoutAttributesForSupplementaryElementOfKind (kind:String, atIndexPath:NSIndexPath) :UICollectionViewLayoutAttributes;

	public function indexPathForItemAtPoint (point:CGPoint) :NSIndexPath;
	public function indexPathForCell (cell:UICollectionViewCell) :NSIndexPath;

	public function cellForItemAtIndexPath (indexPath:NSIndexPath) :UICollectionViewCell;
	public function visibleCells () :Array<UICollectionViewCell>;
	public function indexPathsForVisibleItems () :Array<NSIndexPath>;

// Interacting with the collection view.

	public function scrollToItemAtIndexPath (indexPath:NSIndexPath, atScrollPosition:UICollectionViewScrollPosition, animated:Bool) :Void;

// These methods allow dynamic modification of the current set of items in the collection view
	public function insertSections(sections:NSIndexSet) :Void;
	public function deleteSections(sections:NSIndexSet) :Void;
	public function reloadSections(sections:NSIndexSet) :Void;
	public function moveSection (section:Int, toSection:Int) :Void;

	public function insertItemsAtIndexPaths (indexPaths:Array<NSIndexPath>) :Void;
	public function deleteItemsAtIndexPaths (indexPaths:Array<NSIndexPath>) :Void;
	public function reloadItemsAtIndexPaths (indexPaths:Array<NSIndexPath>) :Void;
	public function moveItemAtIndexPath (indexPath:NSIndexPath, toIndexPath:NSIndexPath) :Void;

	public function performBatchUpdates (updates:Void->Void, completion:Bool->Void) :Void;
}
