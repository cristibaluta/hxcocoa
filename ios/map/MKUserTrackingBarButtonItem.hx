package ios.map;

@:require(ios5_0) extern class MKUserTrackingBarButtonItem extends UIBarButtonItem {

	public function initWithMapView (mapView:MKMapView) :MKUserTrackingBarButtonItem;
	public var mapView :MKMapView;

}
