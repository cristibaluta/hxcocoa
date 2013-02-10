package ios.map;

import ios.ui.UIView;
import ios.ui.UIGeometry;
import ios.map.MKGeometry;
import objc.graphics.CGGeometry;
import objc.location.CLLocation;
import objc.foundation.NSSet;

extern enum MKMapType {
    MKMapTypeStandard;
    MKMapTypeSatellite;
    MKMapTypeHybrid;
}
typedef MKUserTrackingMode = Dynamic;//TODO:

extern class MKMapView extends UIView {
	
	public var delegate :MKMapViewDelegate;
	public var mapType :MKMapType;
	public var region :MKCoordinateRegion;
	public function setRegion (region:MKCoordinateRegion, animated:Bool) :Void;
	public var centerCoordinate :CLLocationCoordinate2D;
	public function setCenterCoordinate (coordinate:CLLocationCoordinate2D, animated:Bool) :Void;
	public function regionThatFits (region:MKCoordinateRegion) :MKCoordinateRegion;
	

// Access the visible region of the map in projected coordinates.
	public var visibleMapRect :MKMapRect;
	@:overload(function (mapRect:MKMapRect, edgePadding:UIEdgeInsets, animated:Bool) :Void {})
	public function setVisibleMapRect (mapRect:MKMapRect, animated:Bool) :Void;

// Returns an MKMapRect modified to fit the aspect ratio of the map.
	@:overload(function (mapRect:MKMapRect, edgePadding:UIEdgeInsets) :MKMapRect{})
	public function mapRectThatFits (mapRect:MKMapRect) :MKMapRect;

// Edge padding is the minumum padding on each side around the specified MKMapRect.

	public function convertCoordinate (coordinate:CLLocationCoordinate2D, toPointToView:UIView) :CGPoint;
	//public function convertPoint (point:CGPoint, toCoordinateFromView:UIView) :CLLocationCoordinate2D;
	public function convertRegion (region:MKCoordinateRegion, toRectToView:UIView) :CGRect;
	//public function convertRect (rect:CGRect, toRegionFromView:UIView) :MKCoordinateRegion;

// Disable user interaction from zooming or scrolling the map, or both.
	public var zoomEnabled :Bool;
	public var scrollEnabled :Bool;

// Set to YES to add the user location annotation to the map and start updating its location
	public var showsUserLocation :Bool;

// The annotation representing the user's location
	public var userLocation :MKUserLocation;

	@:require(ios5_0) public var userTrackingMode :MKUserTrackingMode;
	@:require(ios5_0) public function setUserTrackingMode (mode:MKUserTrackingMode, animated:Bool) :Void;

// Returns YES if the user's location is displayed within the currently visible map region.
	public var userLocationVisible :Bool;

// Annotations are models used to annotate coordinates on the map. 
// Implement mapView:viewForAnnotation: on MKMapViewDelegate to return the annotation view for each annotation.
	public function addAnnotation (annotation:MKAnnotation) :Void;
	public function addAnnotations (annotations:Array<MKAnnotation>) :Void;

	public function removeAnnotation (annotation:MKAnnotation) :Void;
	public function removeAnnotations (annotations:Array<MKAnnotation>) :Void;

	public var annotations :Array<MKAnnotation>;
	public function annotationsInMapRect (mapRect:MKMapRect) :NSSet;

// Currently displayed view for an annotation; returns nil if the view for the annotation isn't being displayed.
	public function viewForAnnotation (annotation:MKAnnotation) :MKAnnotationView;

// Used by the delegate to acquire an already allocated annotation view, in lieu of allocating a new one.
	public function dequeueReusableAnnotationViewWithIdentifier (identifier:String) :MKAnnotationView;

// Select or deselect a given annotation.  Asks the delegate for the corresponding annotation view if necessary.
	public function selectAnnotation (annotation:MKAnnotation, animated:Bool) :Void;
	public function deselectAnnotation (annotation:MKAnnotation, animated:Bool) :Void;
	public var selectedAnnotations :Array<MKAnnotation>;

// annotationVisibleRect is the visible rect where the annotations views are currently displayed.
// The delegate can use annotationVisibleRect when animating the adding of the annotations views in mapView:didAddAnnotationViews:
	public var annotationVisibleRect :CGRect;

	// (OverlaysAPI)

// Overlays are models used to represent areas to be drawn on top of the map.
// This is in contrast to annotations, which represent points on the map.
// Implement -mapView:viewForOverlay: on MKMapViewDelegate to return the view for each overlay.
	public function addOverlay (overlay:MKOverlay) :Void;
	public function addOverlays (overlays:Array<MKOverlay>) :Void;

	public function removeOverlay (overlay:MKOverlay) :Void;
	public function removeOverlays (overlays:Array<MKOverlay>) :Void;

	public function exchangeOverlayAtIndex (index1:Int, withOverlayAtIndex:Int) :Void;

	@:overload(function (overlay:MKOverlay, aboveOverlay:MKOverlay) :Void{})
	@:overload(function (overlay:MKOverlay, belowOverlay:MKOverlay) :Void{})
	public function insertOverlay (overlay:MKOverlay, atIndex:Int) :Void;

	public var overlays :Array<MKOverlay>;

// Currently displayed view for overlay; returns nil if the view has not been created yet.
	public function viewForOverlay (overlay:MKOverlay) :MKOverlayView;

}

extern interface MKMapViewDelegate {
#if display

	public function mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated;
	public function mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated;

	public function mapViewWillStartLoadingMap:(MKMapView *)mapView;
	public function mapViewDidFinishLoadingMap:(MKMapView *)mapView;
	public function mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error;

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(annotation:MKAnnotation,;

// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
	public function mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views;

// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
	public function mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;

	public function mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(NA, 4_0);
	public function mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(NA, 4_0);

	public function mapViewWillStartLocatingUser:(MKMapView *)mapView NS_AVAILABLE(NA, 4_0);
	public function mapViewDidStopLocatingUser:(MKMapView *)mapView NS_AVAILABLE(NA, 4_0);
	public function mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(NA, 4_0);
	public function mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error NS_AVAILABLE(NA, 4_0);

	public function mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState 
   fromOldState:(MKAnnotationViewDragState)oldState NS_AVAILABLE(NA, 4_0);

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay (overlay:MKOverlay, NS_AVAILABLE(NA, 4_0);

// Called after the provided overlay views have been added and positioned in the map.
	public function mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews NS_AVAILABLE(NA, 4_0);

	public function mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:Bool NS_AVAILABLE(NA, 5_0);
#end
}
