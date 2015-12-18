//
//  UICollectionViewLayout.h
package ios.ui;

import objc.foundation.NSObject;
import objc.graphics.CGGeometry;
import objc.foundation.NSIndexPath;

@:framework("UIKit")
@:require(ios6)
extern enum UICollectionElementCategory {
    UICollectionElementCategoryCell;
    UICollectionElementCategorySupplementaryView;
    UICollectionElementCategoryDecorationView;
}

@:framework("UIKit")
@:require(ios6)
extern class UICollectionViewLayoutAttributes extends NSObject {

	public var frame :CGRect;
	public var center :CGPoint;
	public var size :CGSize;
	//public var transform3D :CATransform3D;
	public var alpha :Float;
	public var zIndex :Int; // default is 0
	public var hidden :Bool; // As an optimization, UICollectionView might not create a view for items whose hidden attribute is YES
	public var indexPath :NSIndexPath;

	public var representedElementCategory :UICollectionElementCategory;
	public var representedElementKind :String; // nil when representedElementCategory is UICollectionElementCategoryCell

//+ (instancetype)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath;
//+ (instancetype)layoutAttributesForSupplementaryViewOfKind:(String *)elementKind withIndexPath:(NSIndexPath *)indexPath;
//+ (instancetype)layoutAttributesForDecorationViewOfKind:(String *)decorationViewKind withIndexPath:(NSIndexPath*)indexPath;

}


@:framework("UIKit")
@:require(ios6)
extern enum UICollectionUpdateAction {
    UICollectionUpdateActionInsert;
    UICollectionUpdateActionDelete;
    UICollectionUpdateActionReload;
    UICollectionUpdateActionMove;
    UICollectionUpdateActionNone;
}


@:framework("UIKit")
@:require(ios6)
extern class UICollectionViewUpdateItem extends NSObject {

	public var indexPathBeforeUpdate :NSIndexPath; // nil for UICollectionUpdateActionInsert
	public var indexPathAfterUpdate :NSIndexPath; // nil for UICollectionUpdateActionDelete
	public var updateAction :UICollectionUpdateAction;

}


@:framework("UIKit")
@:require(ios6)
extern class UICollectionViewLayout extends NSObject {

// Methods in this class are meant to be overridden and will be called by its collection view to gather layout information.
// To get the truth on the current state of the collection view, call methods on UICollectionView rather than these.

	public var collectionView :UICollectionView;

// Call -invalidateLayout to indicate that the collection view needs to requery the layout information.
// Subclasses must always call super if they override.
	public function invalidateLayout () :Void;

	public function registerClass (viewClass:Class<Dynamic>, forDecorationViewOfKind:String) :Void;
	public function registerNib (nib:UINib, forDecorationViewOfKind:String) :Void;

// (SubclassingHooks)

	public static function layoutAttributesClass () :Class<Dynamic>; // override this method to provide a custom class to be used when instantiating instances of UICollectionViewLayoutAttributes

// The collection view calls -prepareLayout once at its first layout as the first message to the layout instance.
// The collection view calls -prepareLayout again after layout is invalidated and before requerying the layout information.
// Subclasses should always call super if they override.
	public function prepareLayout () :Void;

// UICollectionView calls these four methods to determine the layout information.
// Implement -layoutAttributesForElementsInRect: to return layout attributes for for supplementary or decoration views, or to perform layout in an as-needed-on-screen fashion.
// Additionally, all layout subclasses should implement -layoutAttributesForItemAtIndexPath: to return layout attributes instances on demand for specific index paths.
// If the layout supports any supplementary or decoration view types, it should also implement the respective atIndexPath: methods for those types.
	public function layoutAttributesForElementsInRect (rect:CGRect) :Array<UICollectionViewLayoutAttributes>;
	// return an array layout attributes instances for all the views in the given rect
	public function layoutAttributesForItemAtIndexPath (indexPath:NSIndexPath) :UICollectionViewLayoutAttributes;
	public function layoutAttributesForSupplementaryViewOfKind (kind:String, atIndexPath:NSIndexPath) :UICollectionViewLayoutAttributes;
	public function layoutAttributesForDecorationViewOfKind (decorationViewKind:String, atIndexPath:NSIndexPath) :UICollectionViewLayoutAttributes;

	public function shouldInvalidateLayoutForBoundsChange (newBounds:CGRect) :Bool; // return YES to cause the collection view to requery the layout for geometry information
	public function targetContentOffsetForProposedContentOffset (proposedContentOffset:CGPoint, withScrollingVelocity:CGPoint) :CGPoint; // return a point at which to rest after scrolling - for layouts that want snap-to-point scrolling behavior

	public function collectionViewContentSize():CGSize;
	// Subclasses must override this method and use it to return the width and height of the collection view’s content. These values represent the width and height of all the content, not just the content that is currently visible. The collection view uses this information to configure its own content size to facilitate scrolling.

	// (UpdateSupportHooks)

// This method is called when there is an update with deletes/inserts to the collection view.
// It will be called prior to calling the initial/final layout attribute methods below to give the layout an opportunity to do batch computations for the insertion and deletion layout attributes.
// The updateItems parameter is an array of UICollectionViewUpdateItem instances for each element that is moving to a new index path.
	public function prepareForCollectionViewUpdates(updateItems:Array<UICollectionViewUpdateItem>) :Void;
	public function finalizeCollectionViewUpdates () :Void; // called inside an animation block after the update

	public function prepareForAnimatedBoundsChange (oldBounds:CGRect) :Void;
	// UICollectionView calls this when its bounds have changed inside an animation block before displaying cells in its new bounds
	public function finalizeAnimatedBoundsChange () :Void; // also called inside the animation block

// This set of methods is called when the collection view undergoes an animated transition such as a batch update block or an animated bounds change.
// For each element on screen before the invalidation, finalLayoutAttributesForDisappearingXXX will be called and an animation setup from what is on screen to those final attributes.
// For each element on screen after the invalidation, initialLayoutAttributesForAppearingXXX will be called an an animation setup from those initial attributes to what ends up on screen.
// - (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
// - (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
// - (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(String *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
// - (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(String *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
// - (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingDecorationElementOfKind:(String *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;
// - (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingDecorationElementOfKind:(String *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;

}
