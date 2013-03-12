
import ios.map.MKMapView;
import ios.map.MKGeometry;
import objc.location.CLLocation;

class CustomMapView extends MKMapView {
	
	public function locateLondon () :Void {
		locate (51.4788, 0.0106, 1.2);
	}
	public function locateMe () {
		this.showsUserLocation = true;
	}
	public function locate (lat:Float, long:Float, zoom:Float) {
		
		//var zoomLocation = new CLLocationCoordinate2D(0,0);
		untyped __objc__("CLLocationCoordinate2D zoomLocation");
		untyped __objc__("zoomLocation.latitude = lat");
		untyped __objc__("zoomLocation.longitude = _long");
	    //untyped zoomLocation.latitude = lat;//TODO: dot notation instead space notation
	    //untyped zoomLocation.longitude = long;
		
		untyped __objc__("MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance (zoomLocation, 40000, 40000)");
		untyped __objc__("MKCoordinateRegion adjustedRegion = [self regionThatFits:viewRegion]");
		//var viewRegion :MKCoordinateRegion = MKGeometry.MKCoordinateRegionMakeWithDistance (zoomLocation, 40000, 40000);
	    //var adjustedRegion :MKCoordinateRegion = this.regionThatFits ( viewRegion );
		untyped this.setRegion ( adjustedRegion, true );
			
			
/*		var addAnnotation = new AddressAnnotation().initWithCoordinate ( cloc );
		this.addAnnotation(addAnnotation);*/
			
			// zoom to  a specific area
/*			    CLLocationCoordinate2D zoomLocation;
			    zoomLocation.latitude = lat;
			    zoomLocation.longitude = _long;
	
			    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance (zoomLocation, 40000, 40000);
			    MKCoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
	
			    // make sure the Google water mark is always visible
			    self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
			    [self setRegion:adjustedRegion animated:YES];*/
	}
}
