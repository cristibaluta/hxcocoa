package ios.assets;

@:framework("AssetsLibrary")
extern class ALAssetsFilter extends NSObject {

// Get all photos assets in the assets group.
public static function allPhotos () :ALAssetsFilter;
// Get all video assets in the assets group.
public static function allVideos () :ALAssetsFilter;
// Get all assets in the group.
public static function allAssets () :ALAssetsFilter;

}
