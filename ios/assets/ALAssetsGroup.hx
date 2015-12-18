package ios.assets;

import objc.foundation.NSArray;//NSEnumerationOptions
import objc.foundation.NSIndexSet;
import objc.foundation.NSObject;
import objc.graphics.CGImage;

// This block is executed when a result is found. The result argument passed into the block is an ALAsset that
// matches the filter set by the caller.
// The index argument indicates which asset is being returned. In the case where no asset is found, index will be set to NSNotFound and stop to YES.
// When the enumeration is done, the block will be called with result set to nil and index set to NSNotFound.
// Setting the output argument stop to YES will finish the enumeration.
typedef ALAssetsGroupEnumerationResultsBlock = ALAsset->Int->Bool->Void;

// Groups Properties
@:framework("AssetsLibrary")
extern enum ALAssetsGroupProperty {
	ALAssetsGroupPropertyName;
	ALAssetsGroupPropertyType;
	ALAssetsGroupPropertyPersistentID;
	@:require(ios5) ALAssetsGroupPropertyURL;
}

@:framework("AssetsLibrary")
extern class ALAssetsGroup extends NSObject {

// Use this method to get information about the group.
public function valueForProperty (property:String) :Dynamic;

// Returns a CGImage of the poster photo for the group.  The thumbnail will be in the correct orientation.
public function posterImage():CGImageRef;

// Set the ALAssetsFilter on the group to filter the group contents. This does not execute the filter. 
// For that, -enumerateAssetsUsingBlock:doneBlock: or -numberOfAssets needs to be called. 
// If no filter is set, the enumeration will return all the assets in the group.
// Only one filter is active at a time. Calling this method again resets the filter and does not affect any enumeration that may be in flight.
public function setAssetsFilter (filter:ALAssetsFilter) :Void;

// Get the number of assets in the group that match the filter.
// If no filter is set, it returns the count of all assets in the group.
public function numberOfAssets () :Int;

// These methods are used to retrieve the assets that match the filter.  
// The caller can specify which results are returned using an NSIndexSet. The index set's count or lastIndex cannot exceed -numberOfAssets.
// 'enumerationBlock' is used to pass back results to the caller and provide the opportunity to stop the filter.
// When the enumeration is done, 'enumerationBlock' will be called with result set to nil and index set to NSNotFound.
// If the application has not been granted access to the data, 'enumerationBlock' will be called with result set to nil, index set to NSNotFound, and stop set to YES.
public function enumerateAssetsUsingBlock (enumerationBlock:ALAssetsGroupEnumerationResultsBlock) :Void;
public function enumerateAssetsWithOptions (options:NSEnumerationOptions, usingBlock:ALAssetsGroupEnumerationResultsBlock) :Void;
public function enumerateAssetsAtIndexes (indexSet:NSIndexSet, options:NSEnumerationOptions, usingBlock:ALAssetsGroupEnumerationResultsBlock) :Void;

// Returns YES if the application is able to edit the group.  Returns NO if the application is not able to edit the group.
@:require(ios5) public var editable (default, null) :Bool;

// Add an existing ALAsset to the group.  An asset can belong to multiple ALAssetsGroups.
// The caller should check the editable property of the group to see if it is possible to add an asset to the group.
// Returns YES if the asset was added successfully.  Returns NO if the group is not editable, or if the asset was not able to be added to the group.
@:require(ios5) public function addAsset (asset:ALAsset) :Bool;

}
