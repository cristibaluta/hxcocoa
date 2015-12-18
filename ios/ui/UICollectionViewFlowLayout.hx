//
//  UICollectionViewFlowLayout.h
package ios.ui;
import objc.graphics.CGGeometry;
import ios.ui.UIGeometry;

//UIKIT_EXTERN String *const UICollectionElementKindSectionHeader;
//UIKIT_EXTERN String *const UICollectionElementKindSectionFooter;

@:framework("UIKit")
@:require(ios6)
extern enum UICollectionViewScrollDirection {
    UICollectionViewScrollDirectionVertical;
    UICollectionViewScrollDirectionHorizontal;
}

@:framework("UIKit")
@:require(ios6)
extern interface UICollectionViewDelegateFlowLayout {
#if display

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(Int)section;
- (Float)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(Int)section;
- (Float)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(Int)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(Int)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(Int)section;
#end
}

@:framework("UIKit")
@:require(ios6)
extern class UICollectionViewFlowLayout extends UICollectionViewLayout {

	public var minimumLineSpacing :Float;
	public var minimumInteritemSpacing :Float;
	public var itemSize :CGSize;
	public var scrollDirection :UICollectionViewScrollDirection; // default is UICollectionViewScrollDirectionVertical
	public var headerReferenceSize :CGSize;
	public var footerReferenceSize :CGSize;

	public var sectionInset :UIEdgeInsets;

}
