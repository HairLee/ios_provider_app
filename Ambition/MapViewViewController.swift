//
//  MapViewViewController.swift
//  Ambition
//
//  Created by Fullname on 10/16/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit
import MapKit

class MapViewViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 21.028511, longitude: 105.804817)

    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(location: initialLocation)
//        showAtWorkOnMap()
        
      
     
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        myMapView.setRegion(coordinateRegion, animated: true)
    }
    
    func showAtWorkOnMap(){
        let artwork = Artwork(title: "King David Kalakaua",
                              locationName: "Waikiki Gateway Park",
                              discipline: "Sculpture",
                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        myMapView.addAnnotation(artwork)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.myMapView.setRegion(region, animated: true)
        }
    }


}

extension MapViewViewController: MKMapViewDelegate {
 
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
   
        guard let annotation = annotation as? Artwork else { return nil }
   
        let identifier = "marker"
        var view: MKMarkerAnnotationView
   
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
    
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
